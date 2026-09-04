import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/migraine_tracker_terms_of_use_content.dart';
import 'package:offlience_website/features/legal/core/migraine_tracker_terms_of_use_content_ru.dart';
import 'package:offlience_website/features/legal/widgets/legal_page_scaffold.dart';

class MigraineTrackerTermsOfUsePage extends StatelessWidget {
  const MigraineTrackerTermsOfUsePage({super.key, this.russian = false});

  final bool russian;

  @override
  Widget build(BuildContext context) {
    if (russian) {
      return const LegalPageScaffold(
        title: MigraineTrackerTermsOfUseContentRu.title,
        subtitle: MigraineTrackerTermsOfUseContentRu.subtitle,
        effectiveDate: MigraineTrackerTermsOfUseContentRu.effectiveDate,
        documentTitle: MigraineTrackerTermsOfUseContentRu.documentTitle,
        intro: MigraineTrackerTermsOfUseContentRu.intro,
        sections: MigraineTrackerTermsOfUseContentRu.sections,
      );
    }

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
