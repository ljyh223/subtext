import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      appBar: AppBar(
        backgroundColor: AppTheme.paperWhite,
        surfaceTintColor: Colors.transparent,
        title: Text(
          '帮助与支持',
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
                '帮助与支持',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '获取帮助、反馈问题或了解更多关于Subtext的信息',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.stone600,
                ),
              ),
              const SizedBox(height: 32),

              // 常见问题
              _buildSectionTitle('常见问题'),
              const SizedBox(height: 16),

              // FAQ列表
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  border: Border.all(color: AppTheme.stone200, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildFAQItem(
                      question: '如何使用Subtext分析对话？',
                      answer:
                          '您可以通过以下步骤使用Subtext分析对话：1) 打开应用并选择对话分析功能；2) 上传聊天截图或粘贴对话文本；3) 点击分析按钮；4) 等待AI生成分析结果。',
                    ),
                    _buildDivider(),
                    _buildFAQItem(
                      question: 'Subtext支持哪些聊天平台？',
                      answer:
                          '目前Subtext支持微信、QQ、WhatsApp、Telegram、Messenger等主流聊天平台的对话分析。我们正在不断扩展支持的平台范围。',
                    ),
                    _buildDivider(),
                    _buildFAQItem(
                      question: '分析结果如何保证隐私安全？',
                      answer:
                          '我们非常重视您的隐私安全。所有对话数据仅用于生成分析结果，不会被存储或用于其他用途。我们采用端到端加密技术保护您的数据传输安全。',
                    ),
                    _buildDivider(),
                    _buildFAQItem(
                      question: '如何提高分析结果的准确性？',
                      answer:
                          '为了获得更准确的分析结果，建议您：1) 提供完整的对话上下文；2) 确保聊天截图清晰可读；3) 选择正确的聊天平台类型；4) 提供相关的背景信息（如果有）。',
                    ),
                    _buildDivider(),
                    _buildFAQItem(
                      question: '分析失败怎么办？',
                      answer:
                          '如果分析失败，您可以尝试：1) 检查网络连接；2) 确保对话内容清晰可读；3) 减少对话长度（建议单次分析不超过100条消息）；4) 重启应用并重试。如果问题仍然存在，请联系我们的客服团队。',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 联系我们
              _buildSectionTitle('联系我们'),
              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  border: Border.all(color: AppTheme.stone200, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildContactItem(
                      icon: Icons.email_outlined,
                      title: '电子邮件',
                      description: 'support@subtext.ai',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildContactItem(
                      icon: Icons.chat_outlined,
                      title: '在线客服',
                      description: '工作时间：周一至周日 9:00-21:00',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildContactItem(
                      icon: Icons.question_answer_outlined,
                      title: '社区论坛',
                      description: '加入我们的社区，与其他用户交流',
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildContactItem(
                      icon: Icons.phone_outlined,
                      title: '电话支持',
                      description: '+86 400-123-4567',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 反馈建议
              _buildSectionTitle('反馈建议'),
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
                    Text(
                      '帮助我们改进',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '您的反馈对我们非常重要，它帮助我们不断改进产品和服务。请告诉我们您的想法、建议或遇到的问题。',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.stone600,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.burntOrange,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              '提交反馈',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: AppTheme.stone300,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Text(
                              '报告问题',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.black,
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

              // 帮助资源
              _buildSectionTitle('帮助资源'),
              const SizedBox(height: 16),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: [
                  _buildHelpResource(
                    icon: Icons.book_outlined,
                    title: '用户手册',
                    description: '详细了解Subtext的功能和使用方法',
                    onTap: () {},
                  ),
                  _buildHelpResource(
                    icon: Icons.video_library_outlined,
                    title: '视频教程',
                    description: '观看教程视频，快速上手',
                    onTap: () {},
                  ),
                  _buildHelpResource(
                    icon: Icons.article_outlined,
                    title: '使用指南',
                    description: '常见场景的使用技巧和最佳实践',
                    onTap: () {},
                  ),
                  _buildHelpResource(
                    icon: Icons.update_outlined,
                    title: '更新日志',
                    description: '了解最新功能和改进',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 应用信息
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
                      '应用信息',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '版本',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.stone600,
                          ),
                        ),
                        Text(
                          '1.0.0',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '构建号',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.stone600,
                          ),
                        ),
                        Text(
                          '20260104',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '检查更新',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.stone600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            '检查更新',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.burntOrange,
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildFAQItem({required String question, required String answer}) {
    return ExpansionTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          question,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppTheme.black,
          ),
        ),
      ),
      backgroundColor: AppTheme.white,
      collapsedBackgroundColor: AppTheme.white,
      iconColor: AppTheme.stone400,
      collapsedIconColor: AppTheme.stone400,
      shape: const Border(),
      collapsedShape: const Border(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Text(
            answer,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppTheme.stone600,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
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
            const SizedBox(width: 16),
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
                      color: AppTheme.stone600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.stone400),
          ],
        ),
      ),
    );
  }
  Widget _buildHelpResource({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          border: Border.all(color: AppTheme.stone200, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
