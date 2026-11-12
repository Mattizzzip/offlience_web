import 'package:offlience_website/features/legal/core/legal_section.dart';

class AquaMergePrivacyPolicyContent {
  AquaMergePrivacyPolicyContent._();

  static const String title = 'Privacy Policy';
  static const String subtitle = 'Aqua Merging';
  static const String effectiveDate = 'Effective date: 12 November 2026';
  static const String documentTitle = 'Privacy Policy — Aqua Merging';

  static const String intro =
      'This Privacy Policy describes how Individual Entrepreneur Andrei Osipau '
      '("we", "us", or "our") collects, uses, and discloses information when '
      'you use the mobile game **Aqua Merging** (the "Game") on iOS and '
      'Android.\n\n'
      'By using the Game, you agree to this Privacy Policy.';

  static const List<LegalSection> sections = [
    LegalSection(
      title: '1. Information Collection and Use',
      body:
          'We do not ask you to create an account. You do not need to give us '
          'your full name, physical address, phone number, or email address to '
          'play Aqua Merging.\n\n'
          'The Game may keep the following on your device so it can run:',
      bullets: [
        'Gameplay progress and levels reached',
        'Settings stored by the Game',
      ],
      trailingBody:
          'That information stays on your device. We do not operate an account '
          'system or our own server that receives it, and we do not sell it.\n\n'
          'The current version of the Game does not collect advertising '
          'identifiers (IDFA on iOS or the Google Advertising ID on Android), '
          'your IP address, or crash logs for our own use, and it does not use '
          'your data to show advertisements.\n\n'
          'Opening this Privacy Policy from the Game opens '
          '[offlience.com](https://offlience.com) in your browser. That visit '
          'does not upload your gameplay progress.',
    ),
    LegalSection(
      title: '2. Third-Party Services',
      body:
          'The Game is built with **Unity** and is distributed through the '
          '**Apple App Store** and **Google Play**. When you download the Game '
          'or use the store, Apple or Google may process information under '
          'their own privacy policies. We do not control those practices.\n\n'
          'Their policies:',
      bullets: [
        '[Apple Privacy Policy](https://www.apple.com/legal/privacy/)',
        '[Google Privacy Policy](https://policies.google.com/privacy)',
        '[Unity Privacy Policy](https://unity.com/legal/privacy-policy)',
      ],
      trailingBody:
          'The current version of the Game does **not** integrate advertising, '
          'analytics, or crash-reporting services. It does not use Apple Game '
          'Center, Unity Ads, Unity Analytics, Google AdMob, AppLovin, '
          'ironSource, or Firebase (Analytics or Crashlytics), and those '
          'services do not receive data from the Game.\n\n'
          'If we add a service that collects information, we will update this '
          'page before that version is released.',
    ),
    LegalSection(
      title: '3. In-App Purchases',
      body:
          'Aqua Merging may offer in-app purchases. Payments are processed by '
          'the **Apple App Store** or **Google Play**. We do not collect, '
          'process, or store your credit card details or bank account '
          'information.',
    ),
    LegalSection(
      title: '4. Cookies and Similar Technologies',
      body:
          'The Game does not use cookies. It also does not include advertising '
          'or analytics software that would use cookies, advertising '
          'identifiers, or similar tracking technologies inside the Game.\n\n'
          'You can still reset or limit the advertising ID in your device '
          'settings: **Settings → Privacy & Security → Tracking** on iOS, or '
          '**Settings → Google → Ads** on Android.',
    ),
    LegalSection(
      title: '5. Children\'s Privacy',
      body:
          'Aqua Merging is intended for a general audience. We do not knowingly '
          'collect personal information from children under 13 (or under 16 in '
          'certain jurisdictions, such as the EU).\n\n'
          'If you are a parent or legal guardian and believe your child has '
          'provided us with personal information, contact us at '
          '[info@offlience.com](mailto:info@offlience.com). If we learn that we '
          'have collected personal information from a child without the consent '
          'required by law, we will delete it.',
    ),
    LegalSection(
      title: '6. Data Security',
      body:
          'We use commercially reasonable means to protect information. '
          'Gameplay data described in this policy is stored on your device. '
          'Uninstalling the Game, or clearing its data in system settings, '
          'removes that local copy. We do not keep a server copy we can '
          'restore.\n\n'
          'No method of transmission over the Internet or method of electronic '
          'storage is completely secure, and we cannot guarantee absolute '
          'security.',
    ),
    LegalSection(
      title: '7. Changes to This Privacy Policy',
      body:
          'We may update this Privacy Policy from time to time. The version '
          'published at '
          '[https://offlience.com/aqua_merge_privacy](https://offlience.com/aqua_merge_privacy) '
          'is the current one. Updates apply when they are posted on this '
          'page. Please review it periodically. The effective date above shows '
          'when this version took effect.',
    ),
    LegalSection(
      title: '8. Contact',
      body:
          'Developer: Individual Entrepreneur Andrei Osipau\n\n'
          'Email: [info@offlience.com](mailto:info@offlience.com)\n\n'
          'Website: [https://offlience.com](https://offlience.com)',
    ),
  ];
}
