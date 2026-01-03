import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';

class ArsenalScreen extends StatelessWidget {
  const ArsenalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: 24),
            // Arsenal Cards Grid
            _buildArsenalGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '知识库',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
            color: AppTheme.stone400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '武器库',
          style: GoogleFonts.playfairDisplay(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: AppTheme.black,
          ),
        ),
      ],
    );
  }

  Widget _buildArsenalGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildArsenalCard(index);
      },
    );
  }

  Widget _buildArsenalCard(int index) {
    final titles = ['战略回复', '情商', '谈判策略', '冲突解决', '说服技巧', '肢体语言'];

    final descriptions = [
      '关键时刻的高影响力回复',
      '掌握对话中的情绪动态',
      '双赢谈判策略',
      '将冲突转化为机会',
      '充满自信和同理心的影响力',
      '有效解读非语言线索',
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        border: Border.all(color: AppTheme.stone200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(color: AppTheme.stone100),
              child: Center(
                child: Icon(
                  Icons.library_books_outlined,
                  size: 24,
                  color: AppTheme.burntOrange,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              titles[index],
              style: GoogleFonts.playfairDisplay(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              descriptions[index],
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppTheme.stone400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppTheme.burntOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
