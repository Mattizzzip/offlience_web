import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/photo_grafik_privacy_policy_content.dart';
import 'package:offlience_website/features/legal/widgets/legal_page_scaffold.dart';

class PhotoGrafikPrivacyPolicyPage extends StatelessWidget {
  const PhotoGrafikPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LegalPageScaffold(
      title: PhotoGrafikPrivacyPolicyContent.title,
      subtitle: PhotoGrafikPrivacyPolicyContent.subtitle,
      effectiveDate: PhotoGrafikPrivacyPolicyContent.effectiveDate,
      documentTitle: PhotoGrafikPrivacyPolicyContent.documentTitle,
      intro: PhotoGrafikPrivacyPolicyContent.intro,
      sections: PhotoGrafikPrivacyPolicyContent.sections,
    );
  }
}
