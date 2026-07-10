import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/legal_section.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class LegalSectionBlock extends StatelessWidget {
  const LegalSectionBlock({super.key, required this.section});

  final LegalSection section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            section.body,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.65,
            ),
          ),
          if (section.bullets.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...section.bullets.map(
              (bullet) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '•  ',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        height: 1.65,
                      ),
                    ),
                    Expanded(
                      child: SelectableText(
                        bullet,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.65,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
