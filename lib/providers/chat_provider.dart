import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subtext/data/models/ai_response.dart';
import 'package:subtext/data/models/chat_message.dart';
import 'package:subtext/data/repositories/chat_repository.dart';
import 'package:subtext/data/sources/chat_api.dart';

// API Token Provider (replace with your actual token or a secure way to get it)
const String _apiToken =
    'pat_DDaWdIFUY0yqsLJzUc3DZvnA3ZTqhdJcR65mUKeMerjS11J4wnRfhiIJUSIzJrva';

// Chat API Provider
final chatApiProvider = Provider<ChatApi>((ref) {
  return ChatApi(token: _apiToken);
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
        // 处理AI响应
        if (aiResponse.content != null) {
          // 检查是否已有AI消息
          final aiMessages = state.messages
              .where((msg) => msg.role == 'assistant')
              .toList();
          final lastAiMessage = aiMessages.isNotEmpty ? aiMessages.last : null;

          if (lastAiMessage != null) {
            // 更新现有AI消息
            final updatedMessages = [...state.messages];
            final aiMessageIndex = updatedMessages.lastIndexWhere(
              (msg) => msg.role == 'assistant',
            );

            if (aiMessageIndex != -1) {
              updatedMessages[aiMessageIndex] = ChatMessage(
                content: lastAiMessage.content + aiResponse.content!,
                contentType: 'text',
                role: 'assistant',
                type: 'answer',
              );
              state = state.copyWith(messages: updatedMessages);
            }
          } else {
            // 添加新的AI消息
            final aiMessage = ChatMessage(
              content: aiResponse.content!,
              contentType: 'text',
              role: 'assistant',
              type: 'answer',
            );
            final updatedMessages = [...state.messages, aiMessage];
            state = state.copyWith(messages: updatedMessages);
          }
        }
      },
      onError: (error) {
        // 处理错误
        state = state.copyWith(error: error.toString(), isLoading: false);
      },
      onDone: () {
        // 流结束
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

  /// 清除聊天记录
  void clearMessages() {
    _streamSubscription?.cancel();
    state = const ChatState();
  }
}
