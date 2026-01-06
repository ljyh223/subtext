import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:subtext/core/utils/logger.dart';
import 'package:subtext/data/models/ai_response.dart';
import 'package:subtext/data/models/chat_message.dart';
import 'package:subtext/data/models/workflow.dart';

class ChatApi {
  final Dio _dio;

  ChatApi({required String token})
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.coze.cn',
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

  /// 发送聊天请求，支持流式响应
  Stream<AIResponse> sendChatMessage({
    required String botId,
    required String userId,
    required List<ChatMessage> messages,
    bool stream = true,
    String? conversationId,
    bool autoSaveHistory = true,
  }) async* {
    try {
      final data = {
        'bot_id': botId,
        'user_id': userId,
        'stream': stream,
        'auto_save_history': autoSaveHistory,
        'additional_messages': messages
            .map(
              (msg) => {
                'role': msg.role,
                'content': msg.content,
                'content_type': msg.contentType,
                'type': msg.type,
              },
            )
            .toList(),
      };

      // 添加可选的conversation_id
      if (conversationId != null) {
        data['conversation_id'] = conversationId;
      }

      Logger.d('ChatApi', 'Sending chat message to /v3/chat');
      Logger.d('ChatApi', 'Request data: ${jsonEncode(data)}');

      final response = await _dio.post(
        '/v3/chat',
        data: data,
        options: Options(responseType: ResponseType.stream),
      );

      Logger.i('ChatApi', 'Received response for /v3/chat');

      // 处理流式响应
      if (stream) {
        // 使用Utf8Decoder处理不完整的UTF-8字节序列
        final utf8Decoder = Utf8Decoder(allowMalformed: true);
        final buffer = StringBuffer();

        // 显式指定StreamTransformer的泛型类型为Uint8List和AIResponse
        final StreamTransformer<Uint8List, AIResponse>
        streamTransformer = StreamTransformer.fromHandlers(
          handleData: (data, sink) {
            // 解码当前数据块，并将结果添加到缓冲区
            final decodedChunk = utf8Decoder.convert(data as List<int>);
            buffer.write(decodedChunk);

            // 处理缓冲区中的完整消息
            String content = buffer.toString();
            int lastNewlineIndex = content.lastIndexOf('\n');

            if (lastNewlineIndex != -1) {
              String completeContent = content.substring(
                0,
                lastNewlineIndex + 1,
              );
              String remainingContent = content.substring(lastNewlineIndex + 1);

              // 清空缓冲区并添加剩余内容
              buffer.clear();
              buffer.write(remainingContent);

              // 解析完整的SSE内容
              final lines = completeContent.split('\n');

              // 临时存储当前事件类型
              String? currentEvent;

              for (final line in lines) {
                if (line.trim().isEmpty) continue;

                // 解析事件类型
                if (line.startsWith('event:')) {
                  currentEvent = line.substring(6).trim();
                  continue;
                }

                // 解析数据
                if (line.startsWith('data:')) {
                  final jsonString = line.substring(5).trim();

                  // 处理结束事件
                  if (jsonString == '[DONE]' ||
                      (currentEvent == 'done' && jsonString == '[DONE]')) {
                    Logger.d('ChatApi', 'Received stream done event');
                    sink.close();
                    return;
                  }

                  try {
                    final json = jsonDecode(jsonString);
                    Logger.d(
                      'ChatApi',
                      'Received event: $currentEvent, data: $json',
                    );

                    // 只处理与消息相关的事件
                    if (currentEvent == 'conversation.message.delta' ||
                        currentEvent == 'conversation.message.completed') {
                      // 检查JSON结构，特别是content字段的位置
                      Logger.d('ChatApi', 'JSON keys: ${json.keys.join(', ')}');

                      // 从message对象中提取content
                      final messageJson = json['message'] ?? json;
                      Logger.d(
                        'ChatApi',
                        'Message JSON keys: ${messageJson.keys.join(', ')}',
                      );

                      final aiResponse = AIResponse.fromJson(messageJson);
                      sink.add(aiResponse);
                    }
                  } catch (e) {
                    Logger.e('ChatApi', 'Error parsing AI response: $e');
                  }
                }
              }
            }
          },
          handleError: (error, stackTrace, sink) {
            Logger.e('ChatApi', 'Stream error: $error', error, stackTrace);
            sink.addError(error);
          },
          handleDone: (sink) {
            // 处理缓冲区中剩余的数据
            if (buffer.isNotEmpty) {
              final lines = buffer.toString().split('\n');

              // 临时存储当前事件类型
              String? currentEvent;

              for (final line in lines) {
                if (line.trim().isEmpty) continue;

                // 解析事件类型
                if (line.startsWith('event:')) {
                  currentEvent = line.substring(6).trim();
                  continue;
                }

                // 解析数据
                if (line.startsWith('data:')) {
                  final jsonString = line.substring(5).trim();

                  try {
                    final json = jsonDecode(jsonString);
                    Logger.d(
                      'ChatApi',
                      'Received event: $currentEvent, data: $json',
                    );

                    // 只处理与消息相关的事件
                    if (currentEvent == 'conversation.message.delta' ||
                        currentEvent == 'conversation.message.completed') {
                      final aiResponse = AIResponse.fromJson(json);
                      sink.add(aiResponse);
                    }
                  } catch (e) {
                    Logger.e('ChatApi', 'Error parsing AI response: $e');
                  }
                }
              }
            }
            sink.close();
          },
        );

        final stream = response.data.stream.transform(streamTransformer);
        yield* stream;
      } else {
        // 处理非流式响应
        final aiResponse = AIResponse.fromJson(response.data);
        yield aiResponse;
      }
    } catch (e) {
      Logger.e('ChatApi', 'Failed to send chat message: $e', e);
      throw Exception('Failed to send chat message: $e');
    }
  }

  /// 设置新的token
  void updateToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  /// 上传文件
  Future<Map<String, dynamic>> uploadFile({
    required String filePath,
    required String fileName,
  }) async {
    try {
      Logger.d('ChatApi', 'Uploading file: $fileName');
      Logger.d('ChatApi', 'File path: $filePath');

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
      });

      final response = await _dio.post(
        '/v1/files/upload',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      Logger.i('ChatApi', 'File upload successful');
      Logger.d('ChatApi', 'Upload response: ${response.data}');

      return response.data;
    } catch (e) {
      Logger.e('ChatApi', 'Failed to upload file: $e', e);
      throw Exception('Failed to upload file: $e');
    }
  }
}
