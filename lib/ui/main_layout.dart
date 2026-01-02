import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/providers/app_state_provider.dart';
import 'package:subtext/ui/screens/dashboard/dashboard_screen.dart';
import 'package:subtext/ui/screens/scanner/scanner_screen.dart';
import 'package:subtext/ui/screens/agents/agents_configuration_screen.dart';

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key});



  Widget _getCurrentScreen(AppTab tab) {
    switch (tab) {
      case AppTab.home:
        return const DashboardScreen();
      case AppTab.scan:
        return const ScannerScreen();
      case AppTab.agents:
        return const AgentsConfigurationScreen();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final appStateNotifier = ref.read(appStateProvider.notifier);

    return Scaffold(
      backgroundColor: AppTheme.paperWhite,
      body: SafeArea(
        child: _getCurrentScreen(appState.currentTab),
      ),
      bottomNavigationBar: SafeArea(
        bottom: false, // 我们手动处理底部安全区域
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          color: AppTheme.paperWhite,
          child: _buildBottomNavigationBar(
            appState,
            appStateNotifier,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(
      AppState appState,
      AppStateNotifier appStateNotifier,
      ) {
    return Container(
      height: 60, // 现在只需要导航栏本身的高度
      color: AppTheme.paperWhite,
      child: Stack(
        clipBehavior: Clip.none, // 允许子部件超出边界
        children: [
          // 导航栏底部边框
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 0.5,
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.05),
            ),
          ),

          // 导航栏主要内容
          Container(
            height: 60,
            color: AppTheme.paperWhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Home Button
                Expanded(
                  child: _buildNavItem(
                    icon: Icons.home_outlined,
                    label: 'Home',
                    isActive: appState.currentTab == AppTab.home,
                    onTap: () => appStateNotifier.setCurrentTab(AppTab.home),
                  ),
                ),

                // 中间占位 - 为浮出按钮留出空间
                const SizedBox(width: 80), // 给浮出按钮足够的空间

                // Agents Button
                Expanded(
                  child: _buildNavItem(
                    icon: Icons.people_outline,
                    label: 'Agents',
                    isActive: appState.currentTab == AppTab.agents,
                    onTap: () => appStateNotifier.setCurrentTab(AppTab.agents),
                  ),
                ),
              ],
            ),
          ),

          // 中间的浮出扫描按钮
          Positioned(
            left: 0,
            right: 0,
            bottom: 20, // 从导航栏内部向上浮出20
            child: Center(
              child: GestureDetector(
                onTap: () => appStateNotifier.setCurrentTab(AppTab.scan),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppTheme.black,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 12,
                        spreadRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
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
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: isActive ? AppTheme.burntOrange : AppTheme.stone400,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
                color: isActive ? AppTheme.black : AppTheme.stone400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
