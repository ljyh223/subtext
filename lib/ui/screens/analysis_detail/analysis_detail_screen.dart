import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/core/utils/logger.dart';
import 'package:subtext/data/models/analysis_record.dart';
import 'package:subtext/data/services/database_service.dart';
import 'package:subtext/ui/components/subtext_analysis_result.dart';

class AnalysisDetailScreen extends ConsumerStatefulWidget {
  final AnalysisRecord record;

  const AnalysisDetailScreen({super.key, required this.record});

  @override
  ConsumerState<AnalysisDetailScreen> createState() => _AnalysisDetailScreenState();
}

class _AnalysisDetailScreenState extends ConsumerState<AnalysisDetailScreen> {
  bool _isDeleting = false;
  bool _showCotLog = false;

  @override
  Widget build(BuildContext context) {
    final analysis = widget.record.toSubtextAnalysisResponse();

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '分析详情',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppTheme.black,
          ),
        ),
        actions: [
          if (_isDeleting)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.delete, color: AppTheme.burntOrange),
              onPressed: _deleteRecord,
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  SubtextAnalysisResult(analysis: analysis),
                  if (widget.record.cotLogDump != null && widget.record.cotLogDump!.isNotEmpty)
                    _buildCotLogSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.stone200, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '创建时间',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                  color: AppTheme.stone400,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _formatDate(widget.record.createdAt),
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                '风险等级',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                  color: AppTheme.stone400,
                ),
              ),
              const SizedBox(width: 8),
              _buildRiskBadge(widget.record.riskLevel),
              const SizedBox(width: 16),
              Text(
                '风险分数',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                  color: AppTheme.stone400,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${widget.record.riskScore}',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.black,
                ),
              ),
            ],
          ),
          if (widget.record.imagePath != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  '图片路径',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    color: AppTheme.stone400,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.record.imagePath!,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.stone600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ],
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

  Widget _buildCotLogSection() {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.stone50,
        border: Border.all(color: AppTheme.stone200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _showCotLog = !_showCotLog;
              });
            },
            child: Row(
              children: [
                Text(
                  '分析日志',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    color: AppTheme.burntOrange,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  _showCotLog ? Icons.expand_less : Icons.expand_more,
                  size: 16,
                  color: AppTheme.stone400,
                ),
              ],
            ),
          ),
          if (_showCotLog) ...[
            const SizedBox(height: 16),
            Text(
              widget.record.cotLogDump ?? '',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppTheme.stone600,
                height: 1.6,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} '
        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _deleteRecord() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          '删除记录',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppTheme.black,
          ),
        ),
        content: Text(
          '确定要删除这条分析记录吗？此操作无法撤销。',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppTheme.stone600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              '取消',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.stone600,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              '删除',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.burntOrange,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      setState(() {
        _isDeleting = true;
      });

      try {
        if (widget.record.id != null) {
          await DatabaseService().deleteAnalysisRecord(widget.record.id!);
          Logger.d('AnalysisDetailScreen', 'Record deleted successfully');
          if (mounted) {
            Navigator.pop(context, true);
          }
        }
      } catch (e) {
        Logger.e('AnalysisDetailScreen', 'Error deleting record: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('删除失败: $e'),
              backgroundColor: AppTheme.burntOrange,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isDeleting = false;
          });
        }
      }
    }
  }
}