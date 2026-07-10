import 'package:offlience_website/features/legal/core/legal_section.dart';

class PrivacyPolicyContent {
  PrivacyPolicyContent._();

  static const String title = 'Privacy Policy';
  static const String effectiveDate = 'Effective Date: July 10, 2026';

  static const String intro =
      'This Privacy Policy explains how Individual Entrepreneur ANDREI OSIPAU '
      '("we," "us," or "our") handles information when you use our website '
      'contact form.';

  static const List<LegalSection> sections = [
    LegalSection(
      title: '1. Data Controller',
      body: 'The data controller responsible for your personal data is:',
      bullets: [
        'Name: Individual Entrepreneur ANDREI OSIPAU',
        'Business ID / Tax Number: 302373429',
        'Country of Registration: Georgia',
        'Legal Address: Georgia, Tbilisi city, Chugureti district, Tsotne Dadiani street N 7, commercial space Nb229, floor 2',
        'Email: info@offlience.com',
      ],
    ),
    LegalSection(
      title: '2. Information We Collect',
      body: 'When you use our contact form, you may provide us with:',
      bullets: [
        'Name or organization',
        'Mobile phone number',
        'Project description (any information you choose to include)',
      ],
    ),
    LegalSection(
      title: '3. How Your Data is Processed (No Backend Storage)',
      body:
          'We do not operate a backend server or database to store your data. '
          'When you fill out the contact form and click "Send message", the data '
          'is packaged into an email format and transferred directly to your '
          'device\'s native mail client. The data is only transmitted to us if '
          'you actively send that email to info@offlience.com. We do not store, '
          'log, or track your inputs on this website.',
    ),
    LegalSection(
      title: '4. Purpose of Processing',
      body:
          'We only use the information you send via email to respond to your '
          'business inquiries, discuss potential cooperation, and provide '
          'software development services.',
    ),
    LegalSection(
      title: '5. Your Rights',
      body:
          'Under Georgian and international data protection laws, you have the '
          'right to access, correct, or request the deletion of the emails and '
          'personal data you have sent us. To exercise these rights, contact us '
          'at info@offlience.com.',
    ),
  ];
}
