import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subtext/core/utils/logger.dart';
import 'package:subtext/data/models/ai_response.dart';
import 'package:subtext/data/models/chat_message.dart';
import 'package:subtext/data/repositories/chat_repository.dart';
import 'package:subtext/data/sources/chat_api.dart';

// Chat API Provider - Coze API continues to use its own token
final chatApiProvider = Provider<ChatApi>((ref) {
  // Coze API token remains unchanged as requested by user
  final token = "pat_Sm4IiE8ESCB35wzmNzLllYeZ5VzPMmq5W8ks7pNbPs2e2IB6wYY0pKYmlZbG7jth";
  return ChatApi(token: token);
});

// Chat Repository Provider
final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final chatApi = ref.watch(chatApiProvider);
  return ChatRepository(chatApi: chatApi);
});

// Chat State
class ChatState {
  final List<ChatMessage> messages;
  final bool isLoading;
  final String? error;
  final Stream<AIResponse>? responseStream;

  const ChatState({
    this.messages = const [],
    this.isLoading = false,
    this.error,
    this.responseStream,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    bool? isLoading,
    String? error,
    Stream<AIResponse>? responseStream,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      responseStream: responseStream ?? this.responseStream,
    );
  }
}

// Chat Notifier
final chatNotifierProvider = NotifierProvider<ChatNotifier, ChatState>(
  ChatNotifier.new,
);

class ChatNotifier extends Notifier<ChatState> {
  late final ChatRepository _chatRepository;
  StreamSubscription<AIResponse>? _streamSubscription;

  @override
  ChatState build() {
    _chatRepository = ref.read(chatRepositoryProvider);
    return const ChatState();
  }

  /// 发送聊天消息
  void sendMessage({
    required String botId,
    required String userId,
    required String content,
    String? conversationId,
    bool autoSaveHistory = true,
  }) {
    // 更新状态为加载中
    state = state.copyWith(isLoading: true, error: null);

    // 创建新消息
    final newMessage = ChatMessage(
      content: content,
      contentType: 'text',
      role: 'user',
      type: 'question',
    );

    // 更新消息列表
    final updatedMessages = [...state.messages, newMessage];
    state = state.copyWith(messages: updatedMessages);

    // 发送消息并获取流
    final responseStream = _chatRepository.sendSingleMessage(
      botId: botId,
      userId: userId,
      content: content,
      stream: true,
      conversationId: conversationId,
      autoSaveHistory: autoSaveHistory,
    );

    // 订阅流
    _streamSubscription?.cancel();
    _streamSubscription = responseStream.listen(
      (aiResponse) {
        // 详细日志：收到AI响应
        Logger.d('ChatNotifier', 'Received AI response: ${aiResponse.content}');
        Logger.d(
          'ChatNotifier',
          'AI response has content: ${aiResponse.content != null}',
        );

        // 处理AI响应
        if (aiResponse.content != null) {
          // 检查是否已有AI消息
          final aiMessages = state.messages
              .where((msg) => msg.role == 'assistant')
              .toList();
          final lastAiMessage = aiMessages.isNotEmpty ? aiMessages.last : null;

          Logger.d(
            'ChatNotifier',
            'Has last AI message: ${lastAiMessage != null}',
          );

          if (lastAiMessage != null) {
            // 更新现有AI消息
            final updatedMessages = [...state.messages];
            final aiMessageIndex = updatedMessages.lastIndexWhere(
              (msg) => msg.role == 'assistant',
            );

            if (aiMessageIndex != -1) {
              final newContent = lastAiMessage.content + aiResponse.content!;
              Logger.d('ChatNotifier', 'Updating AI message: $newContent');

              updatedMessages[aiMessageIndex] = ChatMessage(
                content: newContent,
                contentType: 'text',
                role: 'assistant',
                type: 'answer',
              );
              state = state.copyWith(messages: updatedMessages);
              Logger.d('ChatNotifier', 'State updated with new content');
            }
          } else {
            // 添加新的AI消息
            final aiMessage = ChatMessage(
              content: aiResponse.content!,
              contentType: 'text',
              role: 'assistant',
              type: 'answer',
            );
            Logger.d(
              'ChatNotifier',
              'Adding new AI message: ${aiResponse.content}',
            );

            final updatedMessages = [...state.messages, aiMessage];
            state = state.copyWith(messages: updatedMessages);
            Logger.d('ChatNotifier', 'State updated with new AI message');
          }
        }
      },
      onError: (error) {
        // 处理错误
        Logger.e('ChatNotifier', 'Stream error: $error');
        state = state.copyWith(error: error.toString(), isLoading: false);
      },
      onDone: () {
        // 流结束
        Logger.d('ChatNotifier', 'Stream done');
        state = state.copyWith(isLoading: false);
      },
    );

    // 更新状态，包含流
    state = state.copyWith(responseStream: responseStream);
  }

  /// 取消流订阅
  void cancelStream() {
    _streamSubscription?.cancel();
    state = state.copyWith(isLoading: false, responseStream: null);
  }

  /// 发送图片消息
  void sendImageMessage({
    required String botId,
    required String userId,
    required String fileId,
    String? conversationId,
    bool autoSaveHistory = true,
  }) {
    // 更新状态为加载中
    state = state.copyWith(isLoading: true, error: null);

    // 创建新的图片消息
    final newMessage = ChatMessage(
      content: '发送了一张图片',
      contentType: 'image',
      role: 'user',
      type: 'question',
    );

    // 更新消息列表
    final updatedMessages = [...state.messages, newMessage];
    state = state.copyWith(messages: updatedMessages);

    // 发送消息并获取流
    final responseStream = _chatRepository.sendImageMessage(
      botId: botId,
      userId: userId,
      fileId: fileId,
      stream: true,
      conversationId: conversationId,
      autoSaveHistory: autoSaveHistory,
    );

    // 订阅流
    _streamSubscription?.cancel();
    _streamSubscription = responseStream.listen(
      (aiResponse) {
        // 详细日志：收到AI响应
        Logger.d('ChatNotifier', 'Received AI response: ${aiResponse.content}');
        Logger.d(
          'ChatNotifier',
          'AI response has content: ${aiResponse.content != null}',
        );

        // 处理AI响应
        if (aiResponse.content != null) {
          // 检查是否已有AI消息
          final aiMessages = state.messages
              .where((msg) => msg.role == 'assistant')
              .toList();
          final lastAiMessage = aiMessages.isNotEmpty ? aiMessages.last : null;

          Logger.d(
            'ChatNotifier',
            'Has last AI message: ${lastAiMessage != null}',
          );

          if (lastAiMessage != null) {
            // 更新现有AI消息
            final updatedMessages = [...state.messages];
            final aiMessageIndex = updatedMessages.lastIndexWhere(
              (msg) => msg.role == 'assistant',
            );

            if (aiMessageIndex != -1) {
              final newContent = lastAiMessage.content + aiResponse.content!;
              Logger.d('ChatNotifier', 'Updating AI message: $newContent');

              updatedMessages[aiMessageIndex] = ChatMessage(
                content: newContent,
                contentType: 'text',
                role: 'assistant',
                type: 'answer',
              );
              state = state.copyWith(messages: updatedMessages);
              Logger.d('ChatNotifier', 'State updated with new content');
            }
          } else {
            // 添加新的AI消息
            final aiMessage = ChatMessage(
              content: aiResponse.content!,
              contentType: 'text',
              role: 'assistant',
              type: 'answer',
            );
            Logger.d(
              'ChatNotifier',
              'Adding new AI message: ${aiResponse.content}',
            );

            final updatedMessages = [...state.messages, aiMessage];
            state = state.copyWith(messages: updatedMessages);
            Logger.d('ChatNotifier', 'State updated with new AI message');
          }
        }
      },
      onError: (error) {
        // 处理错误
        Logger.e('ChatNotifier', 'Stream error: $error');
        state = state.copyWith(error: error.toString(), isLoading: false);
      },
      onDone: () {
        // 流结束
        Logger.d('ChatNotifier', 'Stream done');
        state = state.copyWith(isLoading: false);
      },
    );

    // 更新状态，包含流
    state = state.copyWith(responseStream: responseStream);
  }

  /// 清除聊天记录
  void clearMessages() {
    _streamSubscription?.cancel();
    state = const ChatState();
  }
}
