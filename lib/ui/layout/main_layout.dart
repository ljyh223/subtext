import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/providers/nav_provider.dart';
import 'package:subtext/ui/screens/home/home_screen.dart';
import 'package:subtext/ui/screens/arsenal/arsenal_screen.dart';
import 'package:subtext/ui/screens/scanner/scanner_screen.dart';
import 'package:subtext/ui/screens/agents/agents_configuration_screen.dart';
import 'package:subtext/ui/screens/me/me_screen.dart';

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final appStateNotifier = ref.read(appStateProvider.notifier);

    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // 主内容区域 - 占据除底部导航外的所有空间
            Expanded(
              child: Stack(
                children: [
                  // 主内容使用Positioned确保正确占位
                  Positioned.fill(
                    child: _getCurrentScreen(appState.currentTab),
                  ),
                ],
              ),
            ),
            // 底部导航栏
            _buildBottomNavigationBar(appState, appStateNotifier, context),
          ],
        ),
      ),
    );
  }

  Widget _getCurrentScreen(AppTab tab) {
    switch (tab) {
      case AppTab.home:
        return const HomeScreen();
      case AppTab.arsenal:
        return const ArsenalScreen();
      case AppTab.scan:
        return const ScannerScreen();
      case AppTab.agents:
        return const AgentsConfigurationScreen();
      case AppTab.me:
        return const MeScreen();
    }
  }

  Widget _buildBottomNavigationBar(
    AppState appState,
    AppStateNotifier appStateNotifier,
    BuildContext context,
  ) {
    final paddingBottom = MediaQuery.of(context).padding.bottom;

    return Container(
      height: 80 + paddingBottom,
      decoration: BoxDecoration(
        color: AppTheme.paperWhite,
        border: Border(
          top: BorderSide(color: Colors.black.withValues(alpha: 20), width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 15),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // --- Navigation Row (5 columns) ---
          SafeArea(
            top: false,
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Home
                Expanded(
                  child: _buildNavItem(
                    icon: Icons.home_outlined,
                    selectedIcon: Icons.home,
                    label: '首页',
                    isActive: appState.currentTab == AppTab.home,
                    onTap: () => appStateNotifier.setCurrentTab(AppTab.home),
                  ),
                ),

                // Arsenal
                Expanded(
                  child: _buildNavItem(
                    icon: Icons.library_books_outlined,
                    selectedIcon: Icons.library_books,
                    label: '锦囊',
                    isActive: appState.currentTab == AppTab.arsenal,
                    onTap: () => appStateNotifier.setCurrentTab(AppTab.arsenal),
                  ),
                ),

                // 中间预留位置（扫描按钮浮在上方）
                const Expanded(child: SizedBox()),

                // Agents
                Expanded(
                  child: _buildNavItem(
                    icon: Icons.people_outline,
                    selectedIcon: Icons.people,
                    label: '智能助手',
                    isActive: appState.currentTab == AppTab.agents,
                    onTap: () => appStateNotifier.setCurrentTab(AppTab.agents),
                  ),
                ),

                // Me
                Expanded(
                  child: _buildNavItem(
                    icon: Icons.person_outline,
                    selectedIcon: Icons.person,
                    label: '我的',
                    isActive: appState.currentTab == AppTab.me,
                    onTap: () => appStateNotifier.setCurrentTab(AppTab.me),
                  ),
                ),
              ],
            ),
          ),

          // --- Floating Scan Button (centred correctly) ---
          Positioned(
            top: -28,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => appStateNotifier.setCurrentTab(AppTab.scan),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppTheme.black,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 89),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 38),
                        blurRadius: 30,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppTheme.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },
              child: Icon(
                isActive ? selectedIcon : icon,
                key: ValueKey(isActive),
                size: 26,
                color: isActive ? AppTheme.burntOrange : AppTheme.stone400,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                letterSpacing: 0.12,
                color: isActive ? AppTheme.burntOrange : AppTheme.stone400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
