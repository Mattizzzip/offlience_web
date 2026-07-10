import 'package:flutter/material.dart';
import 'package:offlience_website/features/footer/core/footer_catalog.dart';
import 'package:offlience_website/features/footer/widgets/footer_legal_link.dart';
import 'package:offlience_website/features/legal/core/legal_routes.dart';

class FooterLegalLinks extends StatelessWidget {
  const FooterLegalLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 12,
      children: [
        FooterLegalLink(
          label: FooterCatalog.privacyPolicyLabel,
          onTap: () => Navigator.of(context).pushNamed(LegalRoutes.privacyPolicy),
        ),
        FooterLegalLink(
          label: FooterCatalog.termsLabel,
          onTap: () => Navigator.of(context).pushNamed(LegalRoutes.terms),
        ),
      ],
    );
  }
}
