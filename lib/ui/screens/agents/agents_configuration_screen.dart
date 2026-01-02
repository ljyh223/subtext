import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';

class AgentsConfigurationScreen extends StatelessWidget {
  const AgentsConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const _AgentsHeader(),
            const SizedBox(height: 24),
            // Description
            Text(
              '激活不同的智能体以应对不同场景。多智能体协作会增加分析耗时，但能提供更精准的策略。',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppTheme.stone400,
              ),
            ),
            const SizedBox(height: 24),
            // Agent List
            Column(
              children: [
                _buildAgentCard(
                  title: 'The Strategist',
                  subtitle: 'Core Agent',
                  description: '分析利益冲突，提供博弈论视角的回复建议。',
                  isActive: true,
                  icon: Icons.trending_up,
                  iconBackgroundColor: AppTheme.burntOrange.withOpacity(0.1),
                  iconColor: AppTheme.burntOrange,
                ),
                const SizedBox(height: 16),
                _buildAgentCard(
                  title: 'Empathizer',
                  subtitle: 'Psychology',
                  description: '分析情感潜台词，识别微情绪变化。',
                  isActive: false,
                  icon: Icons.psychology,
                  iconBackgroundColor: AppTheme.stone200,
                  iconColor: AppTheme.stone500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgentCard({
    required String title,
    required String subtitle,
    required String description,
    required bool isActive,
    required IconData icon,
    required Color iconBackgroundColor,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.white : AppTheme.stone50,
        border: Border.all(
          color: isActive ? AppTheme.black : AppTheme.stone200,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 20,
                    color: iconColor,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Text Content
              Column(
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
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                      color: AppTheme.stone400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 200,
                    child: Text(
                      description,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.stone600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Toggle Switch
          Container(
            width: 40,
            height: 20,
            decoration: BoxDecoration(
              color: isActive ? AppTheme.black : AppTheme.stone300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: isActive ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppTheme.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AgentsHeader extends StatelessWidget {
  const _AgentsHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Configuration',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
            color: AppTheme.stone400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'My Agents',
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
