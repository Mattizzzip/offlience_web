import 'package:flutter/material.dart';
import 'package:offlience_website/features/contact/core/contact_catalog.dart';
import 'package:offlience_website/features/contact/widgets/contact_form.dart';
import 'package:offlience_website/features/contact/widgets/contact_section_header.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width < 720 ? 12 : 24,
        vertical: MediaQuery.sizeOf(context).width < 720 ? 40 : 56,
      ),
      child: Column(
        children: [
          const ContactSectionHeader(
            title: ContactCatalog.sectionTitle,
            description: ContactCatalog.sectionDescription,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).width < 720 ? 28 : 40),
          const Center(child: ContactForm()),
        ],
      ),
    );
  }
}
