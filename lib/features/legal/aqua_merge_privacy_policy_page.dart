import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/aqua_merge_privacy_policy_content.dart';
import 'package:offlience_website/features/legal/widgets/legal_page_scaffold.dart';

class AquaMergePrivacyPolicyPage extends StatelessWidget {
  const AquaMergePrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LegalPageScaffold(
      title: AquaMergePrivacyPolicyContent.title,
      subtitle: AquaMergePrivacyPolicyContent.subtitle,
      effectiveDate: AquaMergePrivacyPolicyContent.effectiveDate,
      documentTitle: AquaMergePrivacyPolicyContent.documentTitle,
      intro: AquaMergePrivacyPolicyContent.intro,
      sections: AquaMergePrivacyPolicyContent.sections,
    );
  }
}
