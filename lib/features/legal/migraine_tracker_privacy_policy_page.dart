import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/migraine_tracker_privacy_policy_content.dart';
import 'package:offlience_website/features/legal/core/migraine_tracker_privacy_policy_content_ru.dart';
import 'package:offlience_website/features/legal/widgets/legal_page_scaffold.dart';

class MigraineTrackerPrivacyPolicyPage extends StatelessWidget {
  const MigraineTrackerPrivacyPolicyPage({super.key, this.russian = false});

  final bool russian;

  @override
  Widget build(BuildContext context) {
    if (russian) {
      return const LegalPageScaffold(
        title: MigraineTrackerPrivacyPolicyContentRu.title,
        subtitle: MigraineTrackerPrivacyPolicyContentRu.subtitle,
        effectiveDate: MigraineTrackerPrivacyPolicyContentRu.effectiveDate,
        documentTitle: MigraineTrackerPrivacyPolicyContentRu.documentTitle,
        intro: MigraineTrackerPrivacyPolicyContentRu.intro,
        sections: MigraineTrackerPrivacyPolicyContentRu.sections,
      );
    }

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
