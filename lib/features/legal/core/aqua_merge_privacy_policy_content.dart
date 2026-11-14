import 'package:offlience_website/features/legal/core/legal_section.dart';

class AquaMergePrivacyPolicyContent {
  AquaMergePrivacyPolicyContent._();

  static const String title = 'Privacy Policy';
  static const String subtitle = 'Aqua Merge';
  static const String effectiveDate = 'Last updated: November 14, 2026';
  static const String documentTitle = 'Privacy Policy — Aqua Merge';

  static const String intro =
      'This policy explains how **AquaMerge** ("we", "us") handles information '
      'when you play **Aqua Merge**, the mobile game published for Android and '
      'iOS with the application ID **com.aquamerging.game**.';

  static const List<LegalSection> sections = [
    LegalSection(
      title: '1. Who we are',
      bullets: [
        'Developer: AquaMerge',
        'Game: Aqua Merge',
        'Contact: [info@offlience.com](mailto:info@offlience.com)',
      ],
    ),
    LegalSection(
      title: '2. The short version',
      body:
          'Aqua Merge is an offline puzzle. Your score, settings, and language '
          'stay on your device. We do not create accounts, and we do not '
          'receive that information.',
    ),
    LegalSection(
      title: '3. Information stored on your device',
      body:
          'The game saves the following in local storage on your phone or '
          'tablet:',
      bullets: [
        'your best score',
        'the play mode you last chose',
        'sound volume',
        'whether vibration is on',
        'the language you chose, English or Russian',
        'whether you have finished the tutorial',
        'level-progress values used by the game',
      ],
      trailingBody:
          'This information is used only to run the game: to remember a '
          'record, keep your settings, and show the right language. It is not '
          'sent to us. There is no account and no server copy.\n\n'
          'You can delete it by clearing the app\'s storage or by uninstalling '
          'Aqua Merge. After that, we have nothing left to delete, because we '
          'never received it.',
    ),
    LegalSection(
      title: '4. Information we do not collect',
      body:
          'We do not collect your name, email address, phone number, contacts, '
          'photos, or precise location. We do not collect advertising '
          'identifiers, and we do not ask you to sign in.\n\n'
          'The game has no ads and no in-app purchases, so we do not receive '
          'payment card details. Store purchases, if you pay the store for the '
          'app itself, are handled by Apple or Google under their own '
          'policies.\n\n'
          'We do not use third-party analytics, attribution, advertising, or '
          'crash-reporting services. We do not sell personal information, and '
          'we do not share it for advertising.',
    ),
    LegalSection(
      title: '5. Device features',
      body:
          'If vibration is on, the game vibrates the device when you connect '
          'drops and when a chain pops. That signal stays on the device.\n\n'
          'Aqua Merge can be played without an internet connection. We do not '
          'upload gameplay, scores, or settings.\n\n'
          'The game does not ask for access to your camera, microphone, '
          'photos, contacts, or location, and it does not request permission '
          'to track you across other companies\' apps.',
    ),
    LegalSection(
      title: '6. Children',
      body:
          'Aqua Merge is a general-audience puzzle and may be played by '
          'children. We do not ask for a player\'s age. We do not knowingly '
          'collect personal information from children under 13, or under 16 '
          'where that is the local age. A parent can remove everything the '
          'game has stored by uninstalling it or clearing its data.',
    ),
    LegalSection(
      title: '7. Your choices',
      body:
          'You can change the language, volume, and vibration inside the game. '
          'You can erase local data from the device settings, or by '
          'uninstalling the app.\n\n'
          'If you write to '
          '[info@offlience.com](mailto:info@offlience.com), we will answer '
          'privacy questions. We cannot look up or correct a score from our '
          'side, because that score is stored only on your device.',
    ),
    LegalSection(
      title: '8. Europe, the United Kingdom, and Switzerland',
      body:
          'We do not process your gameplay or settings on our servers. '
          'Information that stays on your device is there so the game can '
          'remember how you play. You control it through the device.',
    ),
    LegalSection(
      title: '9. California',
      body:
          'We do not sell or share personal information as those terms are '
          'used in the California Consumer Privacy Act. We do not use '
          'sensitive personal information for advertising.',
    ),
    LegalSection(
      title: '10. Stores and the game engine',
      body:
          'Aqua Merge is built with the Unity engine. In this version, Unity '
          'Analytics, Unity Ads, in-app purchases, and Unity crash reporting '
          'are turned off. We do not set those services up to collect gameplay '
          'or device data about you.\n\n'
          'Apple and Google handle your store account, the download, and any '
          'store diagnostics under their own policies:',
      bullets: [
        '[Apple](https://www.apple.com/legal/privacy/)',
        '[Google](https://policies.google.com/privacy)',
      ],
    ),
    LegalSection(
      title: '11. Changes',
      body:
          'If we change this policy, we will update the date at the top. If we '
          'ever begin collecting personal information, we will update this '
          'policy first and describe what is collected, why, and who receives '
          'it.',
    ),
    LegalSection(
      title: '12. Contact',
      body:
          'AquaMerging\n\n'
          'Email: [info@offlience.com](mailto:info@offlience.com)',
    ),
  ];
}
