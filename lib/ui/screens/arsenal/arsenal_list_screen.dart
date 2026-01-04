import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/data/models/arsenal.dart';
import 'package:subtext/providers/arsenal_providers.dart';
import 'package:subtext/ui/screens/arsenal/arsenal_detail_screen.dart';

class ArsenalListScreen extends ConsumerWidget {
  const ArsenalListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听锦囊状态
    final arsenalState = ref.watch(arsenalNotifierProvider);
    final arsenalNotifier = ref.read(arsenalNotifierProvider.notifier);

    // 初始化时加载数据
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (arsenalState.arsenalList.isEmpty && !arsenalState.isLoading) {
        arsenalNotifier.fetchAllArsenal();
      }
    });

    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      appBar: AppBar(
        backgroundColor: AppTheme.paperWhite,
        surfaceTintColor: Colors.transparent,
        title: Text(
          '锦囊',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: AppTheme.black,
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 页面标题
              Text(
                '锦囊',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '探索各种分类的锦囊条目',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.stone600,
                ),
              ),
              const SizedBox(height: 32),

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
              // 空状态
              else if (arsenalState.arsenalList.isEmpty) ...[
                const Center(child: Text('暂无锦囊条目')),
              ]
              // 列表状态
              else ...[
                _buildArsenalGrid(arsenalState.arsenalList, context, ref),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArsenalGrid(
    List<Arsenal> arsenalList,
    BuildContext context,
    WidgetRef ref,
  ) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: arsenalList.length,
      itemBuilder: (context, index) {
        final arsenal = arsenalList[index];
        return _buildArsenalCard(arsenal, context, ref);
      },
    );
  }

  Widget _buildArsenalCard(
    Arsenal arsenal,
    BuildContext context,
    WidgetRef ref,
  ) {
    return GestureDetector(
      onTap: () {
        // 导航到详情页
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArsenalDetailScreen(arsenalId: arsenal.id),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          border: Border.all(color: AppTheme.stone200, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 2),
              blurRadius: 8,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 分类标签
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.burntOrange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                arsenal.category,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.burntOrange,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 标题 - 点击标题获取对应category
            GestureDetector(
              onTap: () {
                // 点击标题时，根据category筛选锦囊
                final arsenalNotifier = ref.read(
                  arsenalNotifierProvider.notifier,
                );
                arsenalNotifier.fetchArsenalByCategory(arsenal.category);
              },
              child: Text(
                arsenal.title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.black,
                  decoration: TextDecoration.underline,
                  decorationColor: AppTheme.burntOrange,
                  decorationThickness: 2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            // 标签
            SizedBox(
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: arsenal.tags.take(2).length,
                itemBuilder: (context, index) {
                  final tag = arsenal.tags[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.stone100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      tag,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.stone600,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
