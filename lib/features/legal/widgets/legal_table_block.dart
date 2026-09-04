import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/legal_section.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class LegalTableBlock extends StatelessWidget {
  const LegalTableBlock({super.key, required this.table});

  final LegalTable table;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 720;

    if (isCompact) {
      return Column(
        children: [
          for (final row in table.rows)
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.heroBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < row.length; i++) ...[
                    Text(
                      table.headers[i],
                      style: const TextStyle(
                        color: AppColors.slate,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      row[i],
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                    if (i < row.length - 1) const SizedBox(height: 10),
                  ],
                ],
              ),
            ),
        ],
      );
    }

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(0.34),
        1: FlexColumnWidth(0.66),
      },
      border: TableBorder.all(
        color: AppColors.heroBorder,
        borderRadius: BorderRadius.circular(12),
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(color: AppColors.surface),
          children: [
            for (final header in table.headers)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Text(
                  header,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        for (final row in table.rows)
          TableRow(
            children: [
              for (final cell in row)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Text(
                    cell,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
