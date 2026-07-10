import 'package:flutter/material.dart';
import 'package:offlience_website/features/footer/core/footer_catalog.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class FooterCopyright extends StatelessWidget {
  const FooterCopyright({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      FooterCatalog.copyright,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.steel,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
      ),
    );
  }
}
