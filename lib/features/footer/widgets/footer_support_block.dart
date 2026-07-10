import 'package:flutter/material.dart';
import 'package:offlience_website/features/footer/core/footer_catalog.dart';
import 'package:offlience_website/features/footer/core/footer_link_launcher.dart';
import 'package:offlience_website/features/footer/widgets/footer_legal_links.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class FooterSupportBlock extends StatelessWidget {
  const FooterSupportBlock({
    super.key,
    this.launcher = const FooterLinkLauncher(),
  });

  final FooterLinkLauncher launcher;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          FooterCatalog.sectionTitle,
          style: TextStyle(
            color: AppColors.lavender,
            fontSize: 28,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          FooterCatalog.emailLabel,
          style: TextStyle(
            color: AppColors.steel,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 8),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => launcher.openMailto(FooterCatalog.supportEmail),
            child: const Text(
              FooterCatalog.supportEmail,
              style: TextStyle(
                color: AppColors.gold,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.3,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.gold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const FooterLegalLinks(),
      ],
    );
  }
}
