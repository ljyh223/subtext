import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/providers/app_state_provider.dart';

class ScannerScreen extends ConsumerWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final appStateNotifier = ref.read(appStateProvider.notifier);

    return SafeArea(
      child: Stack(
        children: [
          // Main Content
          Container(
            color: AppTheme.paperWhite,
            child: Column(
              children: [
                // Header
                const _ScannerHeader(),
                // Content
                Expanded(
                  child: appState.hasResult
                      ? _buildResultsView(context, ref)
                      : _buildUploadView(appState, appStateNotifier),
                ),
              ],
            ),
          ),
          // Simulation Modal
          if (appState.showSim) _buildSimulationModal(context, ref),
        ],
      ),
    );
  }

  Widget _buildUploadView(
    AppState appState,
    AppStateNotifier appStateNotifier,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: appState.isAnalyzing
                ? null
                : () => appStateNotifier.startAnalysis(),
            child: Container(
              width: 256,
              height: 256,
              decoration: BoxDecoration(
                border: Border.all(
                  color: appState.isAnalyzing
                      ? AppTheme.stone300
                      : AppTheme.stone300,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(128),
                color: appState.isAnalyzing
                    ? AppTheme.paperWhite
                    : AppTheme.paperWhite,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Upload Icon
                  if (!appState.isAnalyzing)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '+',
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.w100,
                            color: AppTheme.stone300,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Upload Chat',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                            color: AppTheme.black,
                          ),
                        ),
                      ],
                    ),
                  // Loading Animation
                  if (appState.isAnalyzing)
                    const Center(
                      child: SizedBox(
                        width: 256,
                        height: 256,
                        child: CircularProgressIndicator(
                          color: AppTheme.burntOrange,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (appState.isAnalyzing) const SizedBox(height: 32),
          if (appState.isAnalyzing)
            Text(
              'Running Multi-Agent Workflow...',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: AppTheme.stone400,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildResultsView(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(appStateProvider.notifier);

    return SingleChildScrollView(
      child: Column(
        children: [
          // Result Image
          Container(
            height: 200,
            width: double.infinity,
            color: AppTheme.stone200,
            child: Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=3376&auto=format&fit=crop',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.5),
                  colorBlendMode: BlendMode.color,
                ),
                Positioned(
                  bottom: 16,
                  left: 24,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    color: AppTheme.burntOrange,
                    child: Text(
                      'Analysis Complete',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Result Content
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"Deflective"',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.black,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '对方试图通过模糊时间节点来转移话题。建议采用“封闭式提问”锁定结果。',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.stone400,
                  ),
                ),
                const SizedBox(height: 24),
                // Tabs
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppTheme.black, width: 2),
                        ),
                      ),
                      child: Text(
                        'Strategy',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                          color: AppTheme.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      'Raw Data',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                        color: AppTheme.stone400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Strategy Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.stone50,
                    border: Border.all(color: AppTheme.stone200, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommended',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                          color: AppTheme.burntOrange,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '"关于时间节点，我们需要在周三前敲定，否则会影响Q4的整体排期。"',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: AppTheme.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => appStateNotifier.toggleShowSim(),
                          icon: const Icon(Icons.edit_note_outlined, size: 14),
                          label: Text(
                            'Simulate Reply',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.1,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.black,
                            foregroundColor: AppTheme.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimulationModal(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(appStateProvider.notifier);

    return GestureDetector(
      onTap: () => appStateNotifier.toggleShowSim(),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {}, // Prevent modal from closing when tapping content
              child: Container(
                height: 400,
                decoration: const BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    // Modal Header
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppTheme.stone100,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Simulation Mode',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.2,
                              color: AppTheme.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => appStateNotifier.toggleShowSim(),
                            child: const Icon(
                              Icons.close,
                              size: 20,
                              color: AppTheme.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Chat Content
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: AppTheme.stone100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // AI Message
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    color: AppTheme.stone300,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 240,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                    ),
                                  ),
                                  child: Text(
                                    '这就是你所谓的紧急方案？我觉得还需要再议。',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // User Message
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 240,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    color: AppTheme.black,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Text(
                                    '关于时间节点，我们需要在周三前敲定...',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    color: AppTheme.burntOrange,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // AI Feedback
                            Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 243, 232),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'AI: 压迫感过强，对方可能产生抵触',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.burntOrange,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Input Field
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: AppTheme.stone200, width: 1),
                        ),
                      ),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppTheme.stone50,
                          border: Border.all(
                            color: AppTheme.stone200,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Type your reply to practice...',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppTheme.stone400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScannerHeader extends StatelessWidget {
  const _ScannerHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Analysis',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
              color: AppTheme.stone400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Scanner',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: AppTheme.black,
            ),
          ),
        ],
      ),
    );
  }
}
