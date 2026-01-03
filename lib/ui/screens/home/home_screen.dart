import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/providers/nav_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final appStateNotifier = ref.read(appStateProvider.notifier);

    return Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader(),
                const SizedBox(height: 24),
                // Home View Toggle
                _buildHomeViewToggle(appState, appStateNotifier),
                const SizedBox(height: 24),
                // Content based on HomeView
                if (appState.homeView == HomeView.overview)
                  _buildOverviewView()
                else
                  _buildGraphView(appState, appStateNotifier),
              ],
            ),
          ),
        ),
        // Side Panel
        if (appState.showSidePanel) _buildSidePanel(appStateNotifier),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Friday, Jan 2',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
            color: AppTheme.stone400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Dashboard',
          style: GoogleFonts.playfairDisplay(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: AppTheme.black,
          ),
        ),
      ],
    );
  }

  Widget _buildHomeViewToggle(
    AppState appState,
    AppStateNotifier appStateNotifier,
  ) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => appStateNotifier.setHomeView(HomeView.overview),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: appState.homeView == HomeView.overview
                  ? AppTheme.black
                  : AppTheme.stone100,
              border: Border.all(
                color: appState.homeView == HomeView.overview
                    ? AppTheme.black
                    : AppTheme.stone200,
                width: 1,
              ),
            ),
            child: Text(
              'Overview',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: appState.homeView == HomeView.overview
                    ? AppTheme.white
                    : AppTheme.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => appStateNotifier.setHomeView(HomeView.graph),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: appState.homeView == HomeView.graph
                  ? AppTheme.black
                  : AppTheme.stone100,
              border: Border.all(
                color: appState.homeView == HomeView.graph
                    ? AppTheme.black
                    : AppTheme.stone200,
                width: 1,
              ),
            ),
            child: Text(
              'Network Graph',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: appState.homeView == HomeView.graph
                    ? AppTheme.white
                    : AppTheme.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOverviewView() {
    return Column(
      children: [
        // Social Battery Card
        _buildSocialBatteryCard(),
        const SizedBox(height: 32),
        // Recent Insights
        _buildRecentInsights(),
      ],
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
                'Social Battery',
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
          'Recent Insights',
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
        _buildInsightItem(
          1,
          'Project Delay Negotiation',
          'Defensive | Passive',
        ),
        const SizedBox(height: 12),
        _buildInsightItem(2, 'Team Feedback Session', 'Collaborative | Open'),
        const SizedBox(height: 12),
        _buildInsightItem(3, 'Client Proposal Review', 'Assertive | Clear'),
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
                  'Detected: $tags',
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

  Widget _buildGraphView(AppState appState, AppStateNotifier appStateNotifier) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          // Network Graph Background
          Container(
            decoration: BoxDecoration(
              color: AppTheme.white,
              border: Border.all(color: AppTheme.stone200, width: 1),
            ),
            child: CustomPaint(
              painter: NetworkGraphPainter(),
              size: Size.infinite,
            ),
          ),
          // Me Node
          Positioned(
            left: 100,
            top: 200,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppTheme.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.burntOrange, width: 2),
                ),
                child: Center(
                  child: Text(
                    'Me',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Boss Node
          Positioned(
            right: 100,
            top: 150,
            child: GestureDetector(
              onTap: () => appStateNotifier.toggleSidePanel(),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.black, width: 2),
                ),
                child: Center(
                  child: Text(
                    'Boss',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidePanel(AppStateNotifier appStateNotifier) {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 0,
      child: AnimatedContainer(
        width: 300,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: const BoxDecoration(
          color: AppTheme.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(-5, 0),
            ),
          ],
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => appStateNotifier.toggleSidePanel(),
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Boss Avatar
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: AppTheme.stone200,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Boss',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Director',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.stone400,
                ),
              ),
              const SizedBox(height: 24),
              // Stats
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatItem('Communication Style', 'Direct | Assertive'),
                  const SizedBox(height: 12),
                  _buildStatItem('Sentiment Score', '78%'),
                  const SizedBox(height: 12),
                  _buildStatItem('Response Rate', '95%'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppTheme.stone400,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppTheme.black,
          ),
        ),
      ],
    );
  }
}

class NetworkGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.stone300
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Draw lines between nodes
    canvas.drawLine(
      const Offset(132, 200),
      Offset(size.width - 132, 150),
      paint,
    );

    // Additional lines for network effect
    canvas.drawLine(
      const Offset(132, 232),
      Offset(size.width - 132, 182),
      paint..color = AppTheme.stone200,
    );

    canvas.drawLine(
      const Offset(132, 168),
      Offset(size.width - 132, 118),
      paint..color = AppTheme.stone200,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
