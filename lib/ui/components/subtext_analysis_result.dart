import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtext/core/theme/app_theme.dart';
import 'package:subtext/data/models/subtext_analysis_response.dart';

class SubtextAnalysisResult extends StatelessWidget {
  final SubtextAnalysisResponse analysis;

  const SubtextAnalysisResult({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Risk Status
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            color: analysis.meta.riskLevel == 'High' ? AppTheme.redLight :
                   analysis.meta.riskLevel == 'Medium' ? AppTheme.orangeLight :
                   AppTheme.greenLight,
            child: Row(
              children: [
                Text(
                  '风险等级: ${analysis.meta.riskLevel}',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.black,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '风险分数: ${analysis.meta.riskScore}',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.stone400,
                  ),
                ),
              ],
            ),
          ),
          
          // Core Intent
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '核心意图',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    color: AppTheme.burntOrange,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  analysis.meta.coreIntent,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.black,
                  ),
                ),
              ],
            ),
          ),
          
          // Subtext Analysis
          Container(
            padding: const EdgeInsets.all(24),
            color: AppTheme.stone50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '潜台词分析',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    color: AppTheme.burntOrange,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Tone
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: const BoxDecoration(
                        color: AppTheme.stone200,
                      ),
                      child: Text(
                        analysis.subtextAnalysis.tone,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Psych Profile
                Text(
                  analysis.subtextAnalysis.psychProfile,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.stone400,
                  ),
                ),
              ],
            ),
          ),
          
          // Strategies
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '推荐策略',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                    color: AppTheme.burntOrange,
                  ),
                ),
                const SizedBox(height: 16),
                
                for (int i = 0; i < analysis.strategies.length; i++)
                  _buildStrategyCard(analysis.strategies[i], i + 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildStrategyCard(Strategy strategy, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.white,
        border: Border.all(color: AppTheme.stone200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$index. ${strategy.type}',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Content
          Text(
            '回复话术',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppTheme.stone400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            strategy.content,
            style: GoogleFonts.playfairDisplay(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: AppTheme.black,
            ),
          ),
          const SizedBox(height: 16),
          
          // Expected Response
          Text(
            '预期回应',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppTheme.stone400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            strategy.expectedResponse,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.stone400,
            ),
          ),
          const SizedBox(height: 16),
          
          // Use Case
          Text(
            '适用场景',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppTheme.stone400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            strategy.useCase,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.stone400,
            ),
          ),
        ],
      ),
    );
  }
}
