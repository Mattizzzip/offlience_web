import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/legal_section.dart';
import 'package:offlience_website/features/legal/widgets/legal_back_button.dart';
import 'package:offlience_website/features/legal/widgets/legal_section_block.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class LegalPageScaffold extends StatelessWidget {
  const LegalPageScaffold({
    super.key,
    required this.title,
    required this.effectiveDate,
    required this.intro,
    required this.sections,
  });

  final String title;
  final String effectiveDate;
  final String intro;
  final List<LegalSection> sections;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 720;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: isCompact ? 20 : 48,
                vertical: isCompact ? 20 : 40,
              ),
              children: [
                const LegalBackButton(),
                const SizedBox(height: 28),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: isCompact ? 32 : 44,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.8,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  effectiveDate,
                  style: const TextStyle(
                    color: AppColors.slate,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Text(
                    intro,
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: isCompact ? 16 : 17,
                      fontWeight: FontWeight.w400,
                      height: 1.65,
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                ...sections.map(
                  (section) => LegalSectionBlock(section: section),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
