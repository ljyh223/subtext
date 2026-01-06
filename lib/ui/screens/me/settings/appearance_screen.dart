import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      appBar: AppBar(
        backgroundColor: AppTheme.paperWhite,
        surfaceTintColor: Colors.transparent,
        title: Text(
          '外观设置',
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
                '外观设置',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 32),

              // 主题设置
              _buildSectionTitle('主题设置'),
              const SizedBox(height: 16),

              // 主题选择
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
                      '主题',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.black,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 主题选项
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildThemeOption('浅色', true),
                        _buildThemeOption('深色', false),
                        _buildThemeOption('跟随系统', false),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 字体设置
              _buildSectionTitle('字体设置'),
              const SizedBox(height: 16),
              _buildSettingCard(
                title: '字体大小',
                description: '调整应用内的字体大小',
                trailing: Row(
                  children: [
                    Text(
                      '标准',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.stone500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppTheme.stone400,
                    ),
                  ],
                ),
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '字体样式',
                description: '选择应用内的字体样式',
                trailing: Row(
                  children: [
                    Text(
                      '默认',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.stone500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppTheme.stone400,
                    ),
                  ],
                ),
                onTap: () {},
              ),
              const SizedBox(height: 24),

              // 界面布局
              _buildSectionTitle('界面布局'),
              const SizedBox(height: 16),
              _buildToggleSetting(
                title: '紧凑布局',
                description: '减少界面元素间的间距，显示更多内容',
                value: false,
                onChanged: (value) {},
              ),
              const SizedBox(height: 12),
              _buildToggleSetting(
                title: '显示状态栏',
                description: '在应用内显示系统状态栏',
                value: true,
                onChanged: (value) {},
              ),
              const SizedBox(height: 12),
              _buildToggleSetting(
                title: '显示导航栏',
                description: '在应用内显示底部导航栏',
                value: true,
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),

              // 自定义设置
              _buildSectionTitle('自定义设置'),
              const SizedBox(height: 16),
              _buildSettingCard(
                title: '主色调',
                description: '自定义应用的主色调',
                trailing: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppTheme.burntOrange,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppTheme.stone200, width: 1),
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _buildSettingCard(
                title: '背景图片',
                description: '设置应用的背景图片',
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

  Widget _buildThemeOption(String title, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.stone100 : AppTheme.white,
            border: Border.all(
              color: isSelected ? AppTheme.burntOrange : AppTheme.stone200,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppTheme.burntOrange : AppTheme.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingCard({
    required String title,
    required String description,
    required VoidCallback onTap,
    Widget? trailing,
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
            if (trailing != null)
              trailing
            else
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
}
