import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/providers/arsenal_providers.dart';

class ArsenalDetailScreen extends ConsumerWidget {
  final int arsenalId;

  const ArsenalDetailScreen({super.key, required this.arsenalId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听锦囊状态
    final arsenalState = ref.watch(arsenalNotifierProvider);
    final arsenalNotifier = ref.read(arsenalNotifierProvider.notifier);

    // 仅在需要时加载数据，避免重复调用
    if (arsenalState.selectedArsenal?.id != arsenalId &&
        !arsenalState.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        arsenalNotifier.fetchArsenalById(arsenalId);
      });
    }

    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      appBar: AppBar(
        backgroundColor: AppTheme.paperWhite,
        surfaceTintColor: Colors.transparent,
        title: Text(
          '锦囊详情',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: AppTheme.black,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          color: AppTheme.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 加载状态
              if (arsenalState.isLoading) ...[
                const Center(child: CircularProgressIndicator()),
              ]
              // 错误状态
              else if (arsenalState.error != null) ...[
                Center(
                  child: Text(
                    '加载失败: ${arsenalState.error}',
                    style: TextStyle(color: AppTheme.burntOrange),
                  ),
                ),
              ]
              // 显示详情
              else if (arsenalState.selectedArsenal != null) ...[
                _buildArsenalDetail(arsenalState.selectedArsenal!, context),
              ]
              // 空状态
              else ...[
                const Center(child: Text('锦囊条目不存在')),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArsenalDetail(dynamic arsenal, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 分类标签
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.burntOrange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            arsenal.category,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.burntOrange,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // 标题
        Text(
          arsenal.title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: AppTheme.black,
          ),
        ),
        const SizedBox(height: 20),
        // 标签
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var tag in arsenal.tags)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.stone100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  tag,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.stone600,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 24),
        // 内容
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.white,
            border: Border.all(color: AppTheme.stone200, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            arsenal.content,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppTheme.black,
              height: 1.8,
            ),
          ),
        ),
        const SizedBox(height: 32),
        // 底部操作按钮
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              // 可以添加复制内容、分享等功能
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.burntOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              '复制内容',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
