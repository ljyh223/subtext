import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/data/models/analysis_record.dart';
import 'package:subtext/ui/screens/analysis_detail/analysis_detail_screen.dart';

class HistoryList extends ConsumerWidget {
  final List<AnalysisRecord> records;
  final VoidCallback? onRefresh;

  const HistoryList({
    super.key,
    required this.records,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (records.isEmpty) {
      return _buildEmptyState(context);
    }

    return RefreshIndicator(
      onRefresh: () async {
        onRefresh?.call();
      },
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: records.length,
        itemBuilder: (context, index) {
          final record = records[index];
          return _buildRecordCard(context, record, index + 1);
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(color: AppTheme.stone100),
            child: Center(
              child: Text(
                '0',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.stone400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '暂无历史记录',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.stone400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '扫描图片后，分析结果将保存在这里',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppTheme.stone300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordCard(BuildContext context, AnalysisRecord record, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnalysisDetailScreen(record: record),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
                    _getShortTitle(record.coreIntent),
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildRiskBadge(record.riskLevel),
                      const SizedBox(width: 8),
                      Text(
                        _formatDate(record.createdAt),
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.stone400,
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
    );
  }

  Widget _buildRiskBadge(String riskLevel) {
    Color backgroundColor;
    Color textColor;
    String label;

    switch (riskLevel.toLowerCase()) {
      case 'critical':
      case 'high':
        backgroundColor = AppTheme.redLight;
        textColor = AppTheme.burntOrange;
        label = '高风险';
        break;
      case 'medium':
        backgroundColor = AppTheme.orangeLight;
        textColor = AppTheme.stone600;
        label = '中风险';
        break;
      case 'low':
        backgroundColor = AppTheme.greenLight;
        textColor = AppTheme.stone500;
        label = '低风险';
        break;
      default:
        backgroundColor = AppTheme.stone100;
        textColor = AppTheme.stone600;
        label = riskLevel;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  String _getShortTitle(String coreIntent) {
    if (coreIntent.length > 20) {
      return '${coreIntent.substring(0, 20)}...';
    }
    return coreIntent;
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return '今天 ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays == 1) {
      return '昨天 ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}天前';
    } else {
      return '${date.month}-${date.day}';
    }
  }
}