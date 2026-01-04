import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      appBar: AppBar(
        backgroundColor: AppTheme.paperWhite,
        surfaceTintColor: Colors.transparent,
        title: Text(
          '关于',
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
                '关于',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '了解更多关于Subtext的信息',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.stone600,
                ),
              ),
              const SizedBox(height: 32),

              // 应用信息卡片
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  border: Border.all(color: AppTheme.stone200, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 应用图标和名称
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppTheme.stone100,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppTheme.stone300, width: 1),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.speaker_notes_outlined,
                          size: 40,
                          color: AppTheme.burntOrange,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 应用名称
                    Text(
                      'Subtext',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.black,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // 应用版本
                    Text(
                      '版本 1.0.0',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.stone500,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // 构建号
                    Text(
                      '构建号: 20260104',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.stone500,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 应用描述
                    Text(
                      'Subtext是您的AI驱动的沟通助手，帮助您分析和改善社交互动。通过先进的AI技术，Subtext可以深入理解对话内容，提供有价值的洞察和建议，让您的沟通更加有效和自信。',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.stone600,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 评分和分享按钮
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.star_outlined),
                            label: const Text('评分'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.burntOrange,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.share_outlined),
                            label: const Text('分享'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: AppTheme.stone300,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 功能亮点
              _buildSectionTitle('功能亮点'),
              const SizedBox(height: 16),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildFeatureItem(
                    icon: Icons.analytics_outlined,
                    title: '对话分析',
                    description: '深入分析对话内容，提供有价值的洞察',
                  ),
                  _buildFeatureItem(
                    icon: Icons.sentiment_satisfied_outlined,
                    title: '情绪识别',
                    description: '识别对话中的情绪变化和情感倾向',
                  ),
                  _buildFeatureItem(
                    icon: Icons.person_add_outlined,
                    title: '社交评分',
                    description: '基于沟通方式提供个性化的社交评分',
                  ),
                  _buildFeatureItem(
                    icon: Icons.lightbulb_outlined,
                    title: '智能建议',
                    description: '提供改善沟通的智能建议和反馈',
                  ),
                  _buildFeatureItem(
                    icon: Icons.security_outlined,
                    title: '隐私保护',
                    description: '端到端加密，确保您的数据安全',
                  ),
                  _buildFeatureItem(
                    icon: Icons.language_outlined,
                    title: '多语言支持',
                    description: '支持多种语言的对话分析',
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 开发者信息
              _buildSectionTitle('开发者信息'),
              const SizedBox(height: 16),

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
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppTheme.stone100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'S',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: AppTheme.burntOrange,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Subtext Team',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'AI驱动的沟通助手',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.stone500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '我们致力于利用先进的AI技术，帮助人们更好地理解和改善沟通。通过Subtext，我们希望让每个人都能拥有更有效的沟通技巧和更健康的社交关系。',
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

              const SizedBox(height: 24),

              // 社交媒体链接
              _buildSectionTitle('关注我们'),
              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  border: Border.all(color: AppTheme.stone200, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSocialIcon(
                      icon: Icons.facebook_outlined,
                      label: 'Facebook',
                      onTap: () {},
                    ),
                    _buildSocialIcon(
                      icon: Icons.facebook_outlined,
                      label: 'Twitter',
                      onTap: () {},
                    ),
                    _buildSocialIcon(
                      icon: Icons.camera_alt_outlined,
                      label: 'Instagram',
                      onTap: () {},
                    ),
                    _buildSocialIcon(
                      icon: Icons.group_outlined,
                      label: 'LinkedIn',
                      onTap: () {},
                    ),
                    _buildSocialIcon(
                      icon: Icons.play_circle_outlined,
                      label: 'YouTube',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 法律信息和协议
              _buildSectionTitle('法律信息'),
              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  border: Border.all(color: AppTheme.stone200, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildLegalItem(title: '隐私政策', onTap: () {}),
                    _buildDivider(),
                    _buildLegalItem(title: '用户协议', onTap: () {}),
                    _buildDivider(),
                    _buildLegalItem(title: '服务条款', onTap: () {}),
                    _buildDivider(),
                    _buildLegalItem(title: '知识产权声明', onTap: () {}),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 版权信息
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '© 2026 Subtext Team',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.stone600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '瑞士设计 • 全球服务',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.stone500,
                    ),
                  ),
                ],
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

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        border: Border.all(color: AppTheme.stone200, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.stone100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(icon, size: 20, color: AppTheme.stone500),
            ),
          ),
          const SizedBox(height: 12),
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
              color: AppTheme.stone600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.stone100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(icon, size: 24, color: AppTheme.stone500),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppTheme.stone500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegalItem({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.black,
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.stone400),
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
