import 'package:offlience_website/features/legal/core/legal_section.dart';

class TermsOfServiceContent {
  TermsOfServiceContent._();

  static const String title = 'Terms of Service';
  static const String effectiveDate = 'Effective Date: July 10, 2026';

  static const String intro =
      'Welcome to our website. These Terms of Service govern your use of the '
      'website operated by Individual Entrepreneur ANDREI OSIPAU.';

  static const List<LegalSection> sections = [
    LegalSection(
      title: '1. Acceptance of Terms',
      body:
          'By accessing this website and using our contact form, you agree to '
          'comply with and be bound by these Terms of Service. If you do not '
          'agree, please do not use the site.',
    ),
    LegalSection(
      title: '2. Website Ownership and Intellectual Property',
      body:
          'All content, design, graphics, and code on this website are the '
          'intellectual property of Individual Entrepreneur ANDREI OSIPAU. You '
          'may not reproduce, distribute, or use any materials without our '
          'prior written consent.',
    ),
    LegalSection(
      title: '3. Use of the Contact Form',
      body:
          'You agree to use the contact form solely for legitimate business '
          'inquiries regarding software development services. You are strictly '
          'prohibited from using the form to send spam, malicious code, or '
          'misleading information.',
    ),
    LegalSection(
      title: '4. Disclaimer of Warranties',
      body:
          'This website and its features are provided on an "as is" and "as '
          'available" basis without any warranties of any kind.',
    ),
    LegalSection(
      title: '5. Limitation of Liability',
      body:
          'Individual Entrepreneur ANDREI OSIPAU shall not be liable for any '
          'direct, indirect, or incidental damages arising out of your use or '
          'inability to use the website. Because our contact form relies on '
          'your local device\'s mail client to send messages, we are not '
          'responsible for any technical failures, non-delivery, or '
          'transmission errors caused by third-party email software or service '
          'providers.',
    ),
    LegalSection(
      title: '6. Governing Law',
      body:
          'These Terms shall be governed by and construed in accordance with '
          'the laws of Georgia. Any disputes arising under these Terms shall '
          'be subject to the exclusive jurisdiction of the courts in Tbilisi, '
          'Georgia.',
    ),
    LegalSection(
      title: '7. Contact Information',
      body:
          'For any questions regarding these Terms, please contact us at '
          'info@offlience.com.',
    ),
  ];
}
