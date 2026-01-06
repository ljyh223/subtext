import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool _twoFactorEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      appBar: AppBar(
        backgroundColor: AppTheme.paperWhite,
        surfaceTintColor: Colors.transparent,
        title: Text(
          '隐私与安全',
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
                '隐私与安全',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 32),

              // 隐私设置部分
              _buildSectionTitle('隐私设置'),
              const SizedBox(height: 16),
              _buildSettingCard(
                title: '个人信息保护',
                description: '管理您的个人信息可见性',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '聊天记录隐私',
                description: '设置聊天记录的保存和删除策略',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '第三方授权管理',
                description: '管理应用的第三方授权',
                onTap: () {},
              ),

              const SizedBox(height: 24),

              // 安全设置部分
              _buildSectionTitle('安全设置'),
              const SizedBox(height: 16),
              _buildSettingCard(
                title: '登录密码',
                description: '修改登录密码',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '双重验证',
                description: '开启或关闭双重验证',
                trailing: Switch(
                  value: _twoFactorEnabled,
                  onChanged: (value) {
                    setState(() {
                      _twoFactorEnabled = value;
                    });
                  },
                  activeThumbColor: AppTheme.burntOrange,
                  activeTrackColor: AppTheme.burntOrange.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '设备管理',
                description: '查看和管理登录设备',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '登录记录',
                description: '查看最近登录记录',
                onTap: () {},
              ),

              const SizedBox(height: 24),

              // 数据保护部分
              _buildSectionTitle('数据保护'),
              const SizedBox(height: 16),
              _buildSettingCard(
                title: '数据备份',
                description: '备份您的数据到云端',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '数据恢复',
                description: '从云端恢复您的数据',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '清除数据',
                description: '清除应用数据',
                titleColor: AppTheme.burntOrange,
                onTap: () {},
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

  Widget _buildSettingCard({
    required String title,
    required String description,
    VoidCallback? onTap,
    Widget? trailing,
    Color? titleColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          border: Border.all(color: AppTheme.stone200, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                      color: titleColor ?? AppTheme.black,
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
            trailing ??
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppTheme.stone400,
                ),
          ],
        ),
      ),
    );
  }
}
