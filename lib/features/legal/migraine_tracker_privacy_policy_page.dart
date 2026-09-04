import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/migraine_tracker_privacy_policy_content.dart';
import 'package:offlience_website/features/legal/widgets/legal_page_scaffold.dart';

class MigraineTrackerPrivacyPolicyPage extends StatelessWidget {
  const MigraineTrackerPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LegalPageScaffold(
      title: MigraineTrackerPrivacyPolicyContent.title,
      subtitle: MigraineTrackerPrivacyPolicyContent.subtitle,
      effectiveDate: MigraineTrackerPrivacyPolicyContent.effectiveDate,
      documentTitle: MigraineTrackerPrivacyPolicyContent.documentTitle,
      intro: MigraineTrackerPrivacyPolicyContent.intro,
      sections: MigraineTrackerPrivacyPolicyContent.sections,
    );
  }
}
