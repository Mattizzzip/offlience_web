import 'package:offlience_website/features/legal/core/legal_section.dart';

class MigraineTrackerTermsOfUseContent {
  MigraineTrackerTermsOfUseContent._();

  static const String title = 'Terms of Use';
  static const String subtitle = 'Migraine, Aura & Pill Tracker';
  static const String effectiveDate = 'Effective date: 4 September 2026';
  static const String documentTitle =
      'Terms of Use — Migraine, Aura & Pill Tracker';

  static const String intro =
      'These Terms of Use ("Terms") are an agreement between you and '
      'Individual Entrepreneur Andrei Osipau ("we", "us") for use of the '
      'mobile application **Migraine, Aura & Pill Tracker** (also shown in '
      'the app as Migraine Control) for iOS and Android (the "App").\n\n'
      'By downloading or using the App, you agree to these Terms. If you do '
      'not agree, do not use the App.\n\n'
      'The Privacy Policy at [https://offlience.com/migraine_tracker/privacy_policy](https://offlience.com/migraine_tracker/privacy_policy) '
      'describes how information is handled.';

  static const List<LegalSection> sections = [
    LegalSection(
      title: '1. What the App is',
      body: 'The App is a **personal self-tracking tool**. You can:',
      bullets: [
        'record headache, migraine, and aura symptoms on a calendar',
        'note intensity, aura details, and triggers',
        'keep medication plans and local reminders',
        'view on-device analytics',
        'export a report or backup from the device',
      ],
      trailingBody:
          'The App does **not** provide medical advice, diagnosis, prognosis, '
          'or treatment. It is **not** a regulated medical device and is '
          '**not** a substitute for a doctor or emergency care.',
    ),
    LegalSection(
      title: '2. Medical disclaimer',
      body: 'You remain responsible for your health decisions.',
      bullets: [
        'Do not use the App to diagnose a condition or to change medication without a qualified clinician.',
        'Reminders are a convenience. They can fail (system settings, battery, focus modes, notification permission, or platform limits). Do not rely on them as your only way to take medicine.',
        'If you have sudden, severe, or unusual symptoms, seek professional or emergency care.',
      ],
      trailingBody:
          'On first use the App shows this disclaimer. You must acknowledge it '
          'to continue.',
    ),
    LegalSection(
      title: '3. License',
      body:
          'We grant you a personal, limited, non-exclusive, non-transferable, '
          'revocable license to install and use the App on devices you own or '
          'control, for your own non-commercial use, in line with these Terms '
          'and the App Store or Google Play terms.\n\n'
          'You may not copy, modify, reverse engineer, rent, or redistribute '
          'the App except as allowed by applicable law.',
    ),
    LegalSection(
      title: '4. Your data and backups',
      body:
          'All diary and profile data stay on your device unless **you** '
          'export or share them.\n\n'
          'You are responsible for:',
      bullets: [
        'the accuracy of what you enter',
        'keeping backups if you want a copy',
        'who you send exported PDF, CSV, or ZIP files to',
      ],
      trailingBody:
          'We cannot access, restore, or delete data on your device remotely. '
          'Uninstalling the App deletes local data.\n\n'
          'Imported backups replace existing local data. Check the file before '
          'you confirm.',
    ),
    LegalSection(
      title: '5. Acceptable use',
      body:
          'You agree not to use the App to break the law, harm others, or '
          'interfere with the App. The App is for your personal records, not '
          'for providing clinical services to patients.',
    ),
    LegalSection(
      title: '6. Age',
      body:
          'You must be old enough to enter a binding agreement where you live. '
          'If you are under 13, do not use the App.',
    ),
    LegalSection(
      title: '7. Intellectual property',
      body:
          'The App, name, logo, and related materials belong to Andrei Osipau '
          'or licensors. These Terms do not transfer ownership to you.',
    ),
    LegalSection(
      title: '8. Stores and third-party services',
      body:
          'Purchases, refunds, and installation are handled by Apple or Google '
          'under their terms. The App may open your browser for this Privacy '
          'Policy and these Terms. We are not responsible for other apps or '
          'services you use to share an export.',
    ),
    LegalSection(
      title: '9. Disclaimer of warranties',
      body:
          'The App is provided **"as is"** and **"as available"**, without '
          'warranties of any kind, to the maximum extent permitted by law. We '
          'do not warrant that reminders will fire on time, that analytics are '
          'clinically valid, or that the App will be uninterrupted or '
          'error-free.',
    ),
    LegalSection(
      title: '10. Limitation of liability',
      body:
          'To the maximum extent permitted by law, we are not liable for '
          'indirect, incidental, special, consequential, or punitive damages, '
          'or for loss of data, health outcomes, or missed medication, arising '
          'from your use of the App.\n\n'
          'Our total liability for any claim relating to the App is limited to '
          'the amount you paid for the App in the twelve months before the '
          'claim (or zero if the App was free).\n\n'
          'Nothing in these Terms excludes liability that cannot be excluded '
          'under applicable law.',
    ),
    LegalSection(
      title: '11. Changes and termination',
      body:
          'We may update the App or these Terms. The current Terms are '
          'published at [https://offlience.com/migraine_tracker/terms_of_use](https://offlience.com/migraine_tracker/terms_of_use). '
          'Continued use after an update means you accept the new Terms, '
          'unless applicable law requires otherwise.\n\n'
          'You may stop using the App at any time by uninstalling it. We may '
          'stop offering the App or a feature.',
    ),
    LegalSection(
      title: '12. Contact',
      body:
          'Developer: Individual Entrepreneur Andrei Osipau\n\n'
          'Website: [https://offlience.com](https://offlience.com)',
    ),
  ];
}
