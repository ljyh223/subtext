import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/core/utils/logger.dart';
import 'package:subtext/data/models/file_upload_response.dart';
import 'package:subtext/providers/app_state_provider.dart';
import 'package:subtext/providers/chat_provider.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  File? _selectedImage;
  FileUploadResponse? _uploadResponse;
  String _analysisResult = '';
  bool _isUploading = false;
  bool _isAnalyzing = false;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(appStateProvider);
    final appStateNotifier = ref.read(appStateProvider.notifier);

    return SafeArea(
      child: Stack(
        children: [
          // Main Content
          Container(
            color: AppTheme.paperWhite,
            child: Column(
              children: [
                // Header
                const _ScannerHeader(),
                // Content
                Expanded(
                  child: (_selectedImage != null || _analysisResult.isNotEmpty)
                      ? _buildResultsView(context, appStateNotifier)
                      : _buildUploadView(),
                ),
              ],
            ),
          ),
          // Simulation Modal
          if (appState.showSim) _buildSimulationModal(context),
        ],
      ),
    );
  }

  Widget _buildUploadView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _isUploading || _isAnalyzing ? null : () => _selectImage(),
            child: Container(
              width: 256,
              height: 256,
              decoration: BoxDecoration(
                border: Border.all(
                  color: (_isUploading || _isAnalyzing)
                      ? AppTheme.stone300
                      : AppTheme.stone300,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(128),
                color: (_isUploading || _isAnalyzing)
                    ? AppTheme.paperWhite
                    : AppTheme.paperWhite,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Upload Icon
                  if (!_isUploading && !_isAnalyzing)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '+',
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.w100,
                            color: AppTheme.stone300,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '上传聊天',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                            color: AppTheme.black,
                          ),
                        ),
                      ],
                    ),
                  // Loading Animation
                  if (_isUploading || _isAnalyzing)
                    const Center(
                      child: SizedBox(
                        width: 256,
                        height: 256,
                        child: CircularProgressIndicator(
                          color: AppTheme.burntOrange,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (_isUploading) const SizedBox(height: 32),
          if (_isUploading)
            Text(
              '正在上传图片...',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppTheme.stone400,
              ),
            ),
          if (_isAnalyzing) const SizedBox(height: 32),
          if (_isAnalyzing)
            Text(
              '正在分析聊天...',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppTheme.stone400,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildResultsView(
    BuildContext context,
    AppStateNotifier appStateNotifier,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Selected Image
          if (_selectedImage != null)
            Container(
              height: 200,
              width: double.infinity,
              color: AppTheme.stone200,
              child: Stack(
                children: [
                  Image.file(
                    _selectedImage!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 16,
                    left: 24,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      color: AppTheme.burntOrange,
                      child: Text(
                        '已上传图片',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          // Analysis Result
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_analysisResult.isNotEmpty)
                  Text(
                    '分析结果',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.black,
                    ),
                  ),
                const SizedBox(height: 16),
                if (_analysisResult.isNotEmpty)
                  Text(
                    _analysisResult,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.stone400,
                    ),
                  ),
                const SizedBox(height: 24),
                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_selectedImage != null && _analysisResult.isEmpty)
                      ElevatedButton.icon(
                        onPressed: _isUploading || _isAnalyzing
                            ? null
                            : () => _uploadImageAndAnalyze(),
                        icon: const Icon(Icons.upload_file, size: 14),
                        label: Text(
                          '分析聊天',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.1,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.black,
                          foregroundColor: AppTheme.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: _isUploading || _isAnalyzing
                          ? null
                          : () => _resetAnalysis(),
                      icon: const Icon(Icons.refresh, size: 14),
                      label: Text(
                        '重新分析',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.1,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.white,
                        foregroundColor: AppTheme.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(
                            color: AppTheme.black,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                if (_analysisResult.isNotEmpty)
                  // Strategy Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.stone50,
                      border: Border.all(color: AppTheme.stone200, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '推荐',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                            color: AppTheme.burntOrange,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '"关于时间节点，我们需要在周三前敲定，否则会影响Q4的整体排期。"',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: AppTheme.black,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => appStateNotifier.toggleShowSim(),
                            icon: const Icon(
                              Icons.edit_note_outlined,
                              size: 14,
                            ),
                            label: Text(
                              '模拟回复',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.1,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.black,
                              foregroundColor: AppTheme.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimulationModal(BuildContext context) {
    final appStateNotifier = ref.read(appStateProvider.notifier);

    return GestureDetector(
      onTap: () => appStateNotifier.toggleShowSim(),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {}, // Prevent modal from closing when tapping content
              child: Container(
                height: 400,
                decoration: const BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    // Modal Header
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppTheme.stone100,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '模拟模式',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.2,
                              color: AppTheme.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => appStateNotifier.toggleShowSim(),
                            child: const Icon(
                              Icons.close,
                              size: 20,
                              color: AppTheme.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Chat Content
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: AppTheme.stone100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // AI Message
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    color: AppTheme.stone300,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 240,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                    ),
                                  ),
                                  child: Text(
                                    '这就是你所谓的紧急方案？我觉得还需要再议。',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // User Message
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 240,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    color: AppTheme.black,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Text(
                                    '关于时间节点，我们需要在周三前敲定...',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    color: AppTheme.burntOrange,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // AI Feedback
                            Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 243, 232),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'AI: 压迫感过强，对方可能产生抵触',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.burntOrange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Input Field
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: AppTheme.stone200, width: 1),
                        ),
                      ),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppTheme.stone50,
                          border: Border.all(
                            color: AppTheme.stone200,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '输入您的回复进行练习...',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppTheme.stone400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
        _uploadResponse = null;
        _analysisResult = '';
      });
    }
  }

  Future<void> _uploadImageAndAnalyze() async {
    if (_selectedImage == null) return;

    setState(() {
      _isUploading = true;
      _analysisResult = '';
    });

    try {
      // 1. Upload Image
      final chatRepository = ref.read(chatRepositoryProvider);
      _uploadResponse = await chatRepository.uploadFile(
        filePath: _selectedImage!.path,
        fileName: _selectedImage!.path.split('/').last,
      );

      if (_uploadResponse?.code != 0 || _uploadResponse?.data == null) {
        throw Exception('Image upload failed: ${_uploadResponse?.msg}');
      }

      setState(() {
        _isUploading = false;
        _isAnalyzing = true;
      });

      // 2. Send Multimodal Message
      await _sendMultimodalMessage(_uploadResponse!.data!.id);
    } catch (e) {
      setState(() {
        _isUploading = false;
        _isAnalyzing = false;
        _analysisResult = 'Error: $e';
      });
    }
  }

  Future<void> _sendMultimodalMessage(String fileId) async {
    final chatRepository = ref.read(chatRepositoryProvider);

    // 使用新的sendImageMessage方法发送图片消息
    final stream = chatRepository.sendImageMessage(
      botId: '7590746062667972648',
      userId: '123456',
      fileId: fileId,
      stream: true,
    );

    // 订阅流，实时更新UI
    String fullResponse = '';

    // 监听流事件，实时更新UI
    stream.listen(
      (response) {
        if (response.content != null) {
          fullResponse += response.content!;
          setState(() {
            _analysisResult = fullResponse;
          });
        }
      },
      onError: (error) {
        Logger.e('ScannerScreen', 'Stream error: $error');
        setState(() {
          _analysisResult = 'Error: $error';
          _isAnalyzing = false;
        });
      },
      onDone: () {
        Logger.d('ScannerScreen', 'Stream done');
        setState(() {
          _isAnalyzing = false;
        });
      },
    );
  }

  void _resetAnalysis() {
    setState(() {
      _selectedImage = null;
      _uploadResponse = null;
      _analysisResult = '';
      _isUploading = false;
      _isAnalyzing = false;
    });
  }
}

class _ScannerHeader extends StatelessWidget {
  const _ScannerHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '分析',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
              color: AppTheme.stone400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '扫描器',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: AppTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
