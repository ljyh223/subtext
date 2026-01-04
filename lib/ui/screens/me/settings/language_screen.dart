import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      appBar: AppBar(
        backgroundColor: AppTheme.paperWhite,
        surfaceTintColor: Colors.transparent,
        title: Text(
          '语言设置',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: AppTheme.black,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          color: AppTheme.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '语言设置',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 32),

              // 应用语言设置
              _buildSectionTitle('应用语言'),
              const SizedBox(height: 16),

              // 语言选择卡片
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  border: Border.all(color: AppTheme.stone200, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '选择应用语言',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.black,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 自动检测选项
                    _buildLanguageOption('自动检测', '根据系统设置自动选择语言', true),
                    const SizedBox(height: 12),

                    // 中文选项
                    _buildLanguageOption('中文', '简体中文', false),
                    const SizedBox(height: 12),

                    // 英文选项
                    _buildLanguageOption('English', 'English', false),
                    const SizedBox(height: 12),

                    // 日语选项
                    _buildLanguageOption('日本語', 'Japanese', false),
                    const SizedBox(height: 12),

                    // 韩语选项
                    _buildLanguageOption('한국어', 'Korean', false),
                    const SizedBox(height: 12),

                    // 法语选项
                    _buildLanguageOption('Français', 'French', false),
                    const SizedBox(height: 12),

                    // 德语选项
                    _buildLanguageOption('Deutsch', 'German', false),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 语音设置
              _buildSectionTitle('语音设置'),
              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  border: Border.all(color: AppTheme.stone200, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildSettingCard(
                      title: '语音识别语言',
                      description: '设置语音输入的识别语言',
                      trailing: '中文 (简体)',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildSettingCard(
                      title: '文本转语音语言',
                      description: '设置AI回复的语音语言',
                      trailing: '中文 (简体)',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildSettingCard(
                      title: '语音速度',
                      description: '调整语音播放速度',
                      trailing: '正常',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildSettingCard(
                      title: '语音音调',
                      description: '调整语音播放音调',
                      trailing: '默认',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 说明信息
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.stone100,
                  border: Border.all(color: AppTheme.stone200, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '注意事项',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '• 语言设置更改后需重启应用生效\n• 部分语言可能不支持所有功能\n• 语音功能需要网络连接',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.stone600,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.2,
        color: AppTheme.stone400,
      ),
    );
  }

  Widget _buildLanguageOption(
    String title,
    String description,
    bool isSelected,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.stone100 : AppTheme.white,
        border: Border.all(
          color: isSelected ? AppTheme.burntOrange : AppTheme.stone200,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.stone500,
                  ),
                ),
              ],
            ),
          ),
          if (isSelected) ...[
            Icon(
              Icons.check_circle_outlined,
              size: 20,
              color: AppTheme.burntOrange,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSettingCard({
    required String title,
    required String description,
    required String trailing,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.stone500,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  trailing,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.stone500,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppTheme.stone400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: AppTheme.stone200,
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
