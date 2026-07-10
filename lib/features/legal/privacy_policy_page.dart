import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/privacy_policy_content.dart';
import 'package:offlience_website/features/legal/widgets/legal_page_scaffold.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LegalPageScaffold(
      title: PrivacyPolicyContent.title,
      effectiveDate: PrivacyPolicyContent.effectiveDate,
      intro: PrivacyPolicyContent.intro,
      sections: PrivacyPolicyContent.sections,
    );
  }
}
