import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:subtext/core/utils/logger.dart';
import 'package:subtext/data/models/ai_response.dart';
import 'package:subtext/data/models/chat_message.dart';

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
        // 显式指定StreamTransformer的泛型类型为Uint8List和AIResponse
        final StreamTransformer<Uint8List, AIResponse> streamTransformer =
            StreamTransformer.fromHandlers(
              handleData: (data, sink) {
                // 解析SSE格式的响应
                final listData = data as List<int>;
                final decoded = utf8.decode(listData);
                final lines = decoded.split('\n');

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
                        (currentEvent == 'done' && jsonString == '"[DONE]"')) {
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
                        final aiResponse = AIResponse.fromJson(json);
                        sink.add(aiResponse);
                      }
                    } catch (e) {
                      Logger.e('ChatApi', 'Error parsing AI response: $e');
                    }
                  }
                }
              },
              handleError: (error, stackTrace, sink) {
                Logger.e('ChatApi', 'Stream error: $error', error, stackTrace);
                sink.addError(error);
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
