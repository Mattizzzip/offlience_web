import 'package:flutter/material.dart';
import 'package:offlience_website/features/legal/core/terms_of_service_content.dart';
import 'package:offlience_website/features/legal/widgets/legal_page_scaffold.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LegalPageScaffold(
      title: TermsOfServiceContent.title,
      effectiveDate: TermsOfServiceContent.effectiveDate,
      intro: TermsOfServiceContent.intro,
      sections: TermsOfServiceContent.sections,
    );
  }
}
