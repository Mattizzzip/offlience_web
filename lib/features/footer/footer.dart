import 'package:flutter/material.dart';
import 'package:offlience_website/features/footer/widgets/footer_copyright.dart';
import 'package:offlience_website/features/footer/widgets/footer_legal_details.dart';
import 'package:offlience_website/features/footer/widgets/footer_support_block.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  static const double _breakpoint = 860;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < _breakpoint;

    return Semantics(
      container: true,
      label: 'Site footer with contact and legal registration details',
      child: Padding(
        padding: EdgeInsets.fromLTRB(isCompact ? 12 : 16, 8, isCompact ? 12 : 16, 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isCompact ? 20 : 28,
                vertical: isCompact ? 28 : 36,
              ),
              decoration: BoxDecoration(
                color: AppColors.navy,
                borderRadius: BorderRadius.circular(isCompact ? 28 : 36),
                border: Border.all(
                  color: AppColors.steel.withValues(alpha: 0.22),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.midnight.withValues(alpha: 0.16),
                    blurRadius: 32,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isCompact) ...[
                    const FooterSupportBlock(),
                    const SizedBox(height: 28),
                    const FooterLegalDetails(),
                  ] else
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: FooterSupportBlock()),
                        SizedBox(width: 40),
                        Expanded(flex: 2, child: FooterLegalDetails()),
                      ],
                    ),
                  const SizedBox(height: 28),
                  Divider(
                    color: AppColors.steel.withValues(alpha: 0.25),
                    height: 1,
                  ),
                  const SizedBox(height: 20),
                  const Center(child: FooterCopyright()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
