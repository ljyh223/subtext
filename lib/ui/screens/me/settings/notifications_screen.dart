import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _allowNotifications = true;
  bool _newMessageNotifications = true;
  bool _analysisResultNotifications = true;
  bool _systemNotifications = true;
  bool _marketingNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      appBar: AppBar(
        backgroundColor: AppTheme.paperWhite,
        surfaceTintColor: Colors.transparent,
        title: Text(
          '通知设置',
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
                '通知设置',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 32),

              // 通知开关
              _buildSectionTitle('通知开关'),
              const SizedBox(height: 16),
              _buildToggleSetting(
                title: '允许通知',
                description: '开启或关闭所有通知',
                value: _allowNotifications,
                onChanged: (value) {
                  setState(() {
                    _allowNotifications = value;
                  });
                },
              ),
              const SizedBox(height: 24),

              // 通知类型设置
              _buildSectionTitle('通知类型设置'),
              const SizedBox(height: 16),
              _buildToggleSetting(
                title: '新消息通知',
                description: '接收新消息的通知',
                value: _newMessageNotifications,
                onChanged: (value) {
                  setState(() {
                    _newMessageNotifications = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              _buildToggleSetting(
                title: '分析结果通知',
                description: '接收分析结果的通知',
                value: _analysisResultNotifications,
                onChanged: (value) {
                  setState(() {
                    _analysisResultNotifications = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              _buildToggleSetting(
                title: '系统通知',
                description: '接收系统通知',
                value: _systemNotifications,
                onChanged: (value) {
                  setState(() {
                    _systemNotifications = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              _buildToggleSetting(
                title: '营销通知',
                description: '接收产品营销相关通知',
                value: _marketingNotifications,
                onChanged: (value) {
                  setState(() {
                    _marketingNotifications = value;
                  });
                },
              ),
              const SizedBox(height: 24),

              // 通知样式设置
              _buildSectionTitle('通知样式设置'),
              const SizedBox(height: 16),
              _buildSettingCard(
                title: '通知声音',
                description: '设置通知铃声',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '振动设置',
                description: '设置通知振动模式',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '通知显示方式',
                description: '设置通知在锁屏上的显示方式',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '通知图标',
                description: '设置通知图标样式',
                onTap: () {},
              ),
              const SizedBox(height: 24),

              // 通知管理
              _buildSectionTitle('通知管理'),
              const SizedBox(height: 16),
              _buildSettingCard(
                title: '免打扰时段',
                description: '设置免打扰时间',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '通知历史',
                description: '查看通知历史记录',
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

  Widget _buildToggleSetting({
    required String title,
    required String description,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        border: Border.all(color: AppTheme.stone200, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(20),
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
          const SizedBox(width: 16),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppTheme.burntOrange,
            activeTrackColor: AppTheme.burntOrange.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingCard({
    required String title,
    required String description,
    required VoidCallback onTap,
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
            const Icon(
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
