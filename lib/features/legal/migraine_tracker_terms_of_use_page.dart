import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/migraine_tracker_terms_of_use_content.dart';
import 'package:offlience_website/features/legal/widgets/legal_page_scaffold.dart';

class MigraineTrackerTermsOfUsePage extends StatelessWidget {
  const MigraineTrackerTermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LegalPageScaffold(
      title: MigraineTrackerTermsOfUseContent.title,
      subtitle: MigraineTrackerTermsOfUseContent.subtitle,
      effectiveDate: MigraineTrackerTermsOfUseContent.effectiveDate,
      documentTitle: MigraineTrackerTermsOfUseContent.documentTitle,
      intro: MigraineTrackerTermsOfUseContent.intro,
      sections: MigraineTrackerTermsOfUseContent.sections,
    );
  }
}
