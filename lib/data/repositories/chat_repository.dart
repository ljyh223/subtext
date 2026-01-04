import 'dart:async';
import 'dart:convert';

import 'package:subtext/data/models/ai_response.dart';
import 'package:subtext/data/models/chat_message.dart';
import 'package:subtext/data/models/file_upload_response.dart';
import 'package:subtext/data/sources/chat_api.dart';

class ChatRepository {
  final ChatApi _chatApi;

  ChatRepository({required ChatApi chatApi}) : _chatApi = chatApi;

  /// 发送聊天消息，支持流式响应
  Stream<AIResponse> sendChatMessage({
    required String botId,
    required String userId,
    required List<ChatMessage> messages,
    bool stream = true,
    String? conversationId,
    bool autoSaveHistory = true,
  }) {
    return _chatApi.sendChatMessage(
      botId: botId,
      userId: userId,
      messages: messages,
      stream: stream,
      conversationId: conversationId,
      autoSaveHistory: autoSaveHistory,
    );
  }

  /// 发送单条聊天消息
  Stream<AIResponse> sendSingleMessage({
    required String botId,
    required String userId,
    required String content,
    bool stream = true,
    String? conversationId,
    bool autoSaveHistory = true,
  }) {
    final message = ChatMessage(
      content: content,
      contentType: 'text',
      role: 'user',
      type: 'question',
    );

    return _chatApi.sendChatMessage(
      botId: botId,
      userId: userId,
      messages: [message],
      stream: stream,
      conversationId: conversationId,
      autoSaveHistory: autoSaveHistory,
    );
  }

  /// 发送图片消息
  Stream<AIResponse> sendImageMessage({
    required String botId,
    required String userId,
    required String fileId,
    bool stream = true,
    String? conversationId,
    bool autoSaveHistory = true,
  }) {
    // 创建多模态内容对象
    final imageContent = MultimodalContent(
      type: 'image',
      text: null,
      fileId: fileId,
      fileUrl: null,
    );

    // 构建多模态内容列表
    final multimodalContentList = [imageContent];

    // 将多模态内容列表转换为JSON字符串
    final contentJson = jsonEncode(
      multimodalContentList.map((item) => item.toJson()).toList(),
    );

    // 创建聊天消息
    final message = ChatMessage(
      content: contentJson,
      contentType: 'object_string',
      role: 'user',
      type: 'question',
    );

    // 发送消息
    return _chatApi.sendChatMessage(
      botId: botId,
      userId: userId,
      messages: [message],
      stream: stream,
      conversationId: conversationId,
      autoSaveHistory: autoSaveHistory,
    );
  }

  /// 更新API token
  void updateToken(String token) {
    _chatApi.updateToken(token);
  }

  /// 上传文件
  Future<FileUploadResponse> uploadFile({
    required String filePath,
    required String fileName,
  }) async {
    final response = await _chatApi.uploadFile(
      filePath: filePath,
      fileName: fileName,
    );
    return FileUploadResponse.fromJson(response);
  }
}
