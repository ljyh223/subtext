import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/data/models/chat_message.dart';
import 'package:subtext/providers/chat_provider.dart';
import 'package:subtext/ui/components/subtext_analysis_result.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({
    super.key,
    required this.botId,
    required this.userId,
  });

  final String botId;
  final String userId;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    ref.read(chatNotifierProvider.notifier).cancelStream();
    super.dispose();
  }

  void _sendMessage() {
    final content = _textController.text.trim();
    if (content.isEmpty) return;

    ref.read(chatNotifierProvider.notifier).sendMessage(
          botId: widget.botId,
          userId: widget.userId,
          content: content,
        );

    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatNotifierProvider);

    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      appBar: AppBar(
        backgroundColor: AppTheme.paperWhite,
        surfaceTintColor: Colors.transparent,
        title: Text(
          '智能助手',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: AppTheme.black,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Message List
            Expanded(
              child: Column(
                children: [
                  // Messages
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: chatState.messages.length,
                      itemBuilder: (context, index) {
                        final message = chatState.messages[index];
                        return _buildMessageItem(message);
                      },
                    ),
                  ),
                  
                  // Loading Indicator
                  if (chatState.isLoading) const LinearProgressIndicator(),
                  
                  // Error Message
                  if (chatState.error != null) 
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: AppTheme.redLight,
                      child: Text(chatState.error!),
                    ),
                  
                  // Subtext Analysis Result
                  if (chatState.subtextAnalysis != null) 
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: AppTheme.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '分析结果',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.burntOrange,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: SubtextAnalysisResult(
                              analysis: chatState.subtextAnalysis!,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            
            // Message Input
            Container(
              padding: const EdgeInsets.all(16),
              color: AppTheme.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: '输入消息...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppTheme.stone200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppTheme.burntOrange),
                        ),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send),
                    color: AppTheme.burntOrange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem(ChatMessage message) {
    final bool isUser = message.role == 'user';
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppTheme.black,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.smart_toy, color: AppTheme.white, size: 16),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isUser ? AppTheme.burntOrange : AppTheme.white,
                border: Border.all(
                  color: isUser ? AppTheme.burntOrange : AppTheme.stone200,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                message.content,
                style: TextStyle(
                  color: isUser ? AppTheme.white : AppTheme.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          if (isUser)
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppTheme.stone200,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person, color: AppTheme.black, size: 16),
            ),
        ],
      ),
    );
  }
}
