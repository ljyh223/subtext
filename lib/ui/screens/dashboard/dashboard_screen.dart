import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const _DashboardHeader(),
            const SizedBox(height: 24),
            // Social Battery Card
            _buildSocialBatteryCard(),
            const SizedBox(height: 32),
            // Recent Insights
            _buildRecentInsights(),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialBatteryCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(color: AppTheme.black),
      child: Stack(
        children: [
          Positioned(
            right: -24,
            bottom: -40,
            child: Container(
              width: 128,
              height: 128,
              decoration: const BoxDecoration(
                color: AppTheme.burntOrange,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.burntOrange,
                    blurRadius: 48,
                    spreadRadius: 24,
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '社交电量',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '82',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 64,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '%',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 240,
                child: Text(
                  '你本周处理了 5 次高压对话，建议周末开启勿扰模式。',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentInsights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '最近洞察',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
            color: AppTheme.stone400,
          ),
        ),
        const SizedBox(height: 8),
        const Divider(color: AppTheme.black, thickness: 1),
        const SizedBox(height: 16),
        // Insight items
        _buildInsightItem(1, '项目延期谈判', '防御性 | 被动'),
        const SizedBox(height: 12),
        _buildInsightItem(2, '团队反馈会议', '协作性 | 开放'),
        const SizedBox(height: 12),
        _buildInsightItem(3, '客户提案评审', '果断 | 清晰'),
      ],
    );
  }

  Widget _buildInsightItem(int index, String title, String tags) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.white,
        border: Border.all(color: AppTheme.stone200, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(color: AppTheme.stone100),
            child: Center(
              child: Text(
                index.toString(),
                style: GoogleFonts.playfairDisplay(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.stone400,
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
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '检测到: $tags',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.stone400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '星期五, 1月2日',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
            color: AppTheme.stone400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '仪表盘',
          style: GoogleFonts.playfairDisplay(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: AppTheme.black,
          ),
        ),
      ],
    );
  }
}
