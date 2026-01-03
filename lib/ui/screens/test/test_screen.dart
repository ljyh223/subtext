import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/providers/chat_provider.dart';

class TestScreen extends ConsumerStatefulWidget {
  const TestScreen({super.key});

  @override
  ConsumerState<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends ConsumerState<TestScreen> {
  final TextEditingController _textController = TextEditingController();
  File? _selectedImage;
  bool _isUploading = false;
  String _uploadResult = '';

  // 选择图片
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _uploadResult = '';
      });
    }
  }

  // 上传图片
  Future<void> _uploadImage() async {
    if (_selectedImage == null) return;

    setState(() {
      _isUploading = true;
      _uploadResult = '正在上传...';
    });

    try {
      final chatRepository = ref.read(chatRepositoryProvider);
      final response = await chatRepository.uploadFile(
        filePath: _selectedImage!.path,
        fileName: _selectedImage!.path.split('/').last,
      );

      setState(() {
        if (response.code == 0 && response.data != null) {
          _uploadResult =
              '上传成功!\n文件ID: ${response.data!.id}\n文件名: ${response.data!.fileName}\n大小: ${response.data!.bytes} 字节';
        } else {
          _uploadResult = '上传失败: ${response.msg}';
        }
      });
    } catch (e) {
      setState(() {
        _uploadResult = '错误: $e';
      });
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatNotifierProvider);
    final chatNotifier = ref.read(chatNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      appBar: AppBar(
        backgroundColor: AppTheme.paperWhite,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'API测试',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: AppTheme.black,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 测试标题
              Text(
                'API测试',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 32),

              // 图片上传测试
              _buildImageUploadSection(),
              const SizedBox(height: 32),

              // 流式对话测试
              _buildChatTestSection(chatState, chatNotifier),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '图片上传测试',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
            color: AppTheme.stone400,
          ),
        ),
        const SizedBox(height: 16),

        // 图片选择和上传
        Container(
          decoration: BoxDecoration(
            color: AppTheme.white,
            border: Border.all(color: AppTheme.stone200, width: 1),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // 图片预览
              if (_selectedImage != null) ...[
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: FileImage(_selectedImage!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // 选择图片按钮
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.image_outlined),
                label: const Text('选择图片'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.black,
                  foregroundColor: AppTheme.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // 上传图片按钮
              ElevatedButton.icon(
                onPressed: _selectedImage != null && !_isUploading
                    ? _uploadImage
                    : null,
                icon: const Icon(Icons.upload_outlined),
                label: const Text('上传图片'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.burntOrange,
                  foregroundColor: AppTheme.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 上传结果
              if (_uploadResult.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.stone100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _uploadResult,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.stone600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChatTestSection(ChatState chatState, ChatNotifier chatNotifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '流式聊天测试',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
            color: AppTheme.stone400,
          ),
        ),
        const SizedBox(height: 16),

        // 聊天区域
        Container(
          decoration: BoxDecoration(
            color: AppTheme.white,
            border: Border.all(color: AppTheme.stone200, width: 1),
          ),
          child: Column(
            children: [
              // 消息列表
              Container(
                height: 300,
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: chatState.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatState.messages[index];
                    final isUser = message.role == 'user';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isUser ? AppTheme.black : AppTheme.stone100,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(8),
                              topRight: const Radius.circular(8),
                              bottomLeft: isUser
                                  ? const Radius.circular(8)
                                  : Radius.zero,
                              bottomRight: isUser
                                  ? Radius.zero
                                  : const Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            message.content,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: isUser ? AppTheme.white : AppTheme.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // 分隔线
              const Divider(height: 1, color: AppTheme.stone200),

              // 输入区域
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: '输入您的消息...',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 14,
                            color: AppTheme.stone400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: AppTheme.stone200),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: AppTheme.burntOrange),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppTheme.black,
                        ),
                        onSubmitted: (value) {
                          if (value.trim().isNotEmpty) {
                            chatNotifier.sendMessage(
                              botId: '7348293334459310000', // 替换为实际的bot_id
                              userId: '123456789',
                              content: value.trim(),
                            );
                            _textController.clear();
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 12),

                    // 发送按钮
                    ElevatedButton.icon(
                      onPressed: () {
                        final content = _textController.text.trim();
                        if (content.isNotEmpty) {
                          chatNotifier.sendMessage(
                            botId: '7348293334459310000', // 替换为实际的bot_id
                            userId: '123456789',
                            content: content,
                          );
                          _textController.clear();
                        }
                      },
                      icon: const Icon(Icons.send_outlined),
                      label: const Text('发送'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.black,
                        foregroundColor: AppTheme.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 加载状态
              if (chatState.isLoading) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppTheme.burntOrange,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
