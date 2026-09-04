import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/legal_section.dart';
import 'package:offlience_website/features/legal/widgets/legal_rich_text.dart';
import 'package:offlience_website/features/legal/widgets/legal_table_block.dart';
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
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
              height: 1.25,
            ),
          ),
          if (section.body.isNotEmpty) ...[
            const SizedBox(height: 12),
            LegalRichText(text: section.body),
          ],
          if (section.bulletGroups.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...section.bulletGroups.map(_BulletGroupView.new),
          ],
          if (section.bullets.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...section.bullets.map(_BulletView.new),
          ],
          if (section.table != null) ...[
            const SizedBox(height: 16),
            LegalTableBlock(table: section.table!),
          ],
          if (section.trailingBody.isNotEmpty) ...[
            const SizedBox(height: 16),
            LegalRichText(text: section.trailingBody),
          ],
        ],
      ),
    );
  }
}

class _BulletGroupView extends StatelessWidget {
  const _BulletGroupView(this.group);

  final LegalBulletGroup group;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.heading,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 6),
          ...group.items.map(_BulletView.new),
        ],
      ),
    );
  }
}

class _BulletView extends StatelessWidget {
  const _BulletView(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Expanded(child: LegalRichText(text: text)),
        ],
      ),
    );
  }
}
