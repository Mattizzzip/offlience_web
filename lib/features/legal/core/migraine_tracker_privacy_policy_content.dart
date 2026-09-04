import 'package:offlience_website/features/legal/core/legal_section.dart';

class MigraineTrackerPrivacyPolicyContent {
  MigraineTrackerPrivacyPolicyContent._();

  static const String title = 'Privacy Policy';
  static const String subtitle = 'Migraine, Aura & Pill Tracker';
  static const String effectiveDate = 'Effective date: 4 September 2026';
  static const String documentTitle =
      'Privacy Policy — Migraine, Aura & Pill Tracker';

  static const String intro =
      'This Privacy Policy explains how Individual Entrepreneur Andrei Osipau '
      '("we", "us") handles information in the mobile application **Migraine, '
      'Aura & Pill Tracker** (also shown in the app as Migraine Control) for '
      'iOS and Android.\n\n'
      'The app is a personal self-tracking tool. It does not diagnose, '
      'prescribe treatment, or replace medical advice.';

  static const List<LegalSection> sections = [
    LegalSection(
      title: '1. We do not collect your data',
      body:
          'We do not operate an account system, cloud backend, analytics '
          'service, crash reporter, or advertising network for this app.\n\n'
          'We do not transmit your personal or health information from the '
          'device to us or to our partners in a way that would let us access '
          'it later. In Apple\'s App Store Connect terms, this means **we do '
          'not collect data from this app**.\n\n'
          'Opening this Privacy Policy or the Terms of Use from the app '
          'launches your device\'s browser and visits '
          '[offlience.com](https://offlience.com). That website visit is not a '
          'transfer of your diary, profile, or medication data.',
    ),
    LegalSection(
      title: '2. Information stored only on your device',
      body:
          'You may enter information so the app can work on your phone or '
          'tablet. That information stays in local storage on the device '
          '(SQLite and related local files). We cannot see it.\n\n'
          'Depending on how you use the app, this may include:',
      bulletGroups: [
        LegalBulletGroup(
          heading: 'Profile',
          items: [
            'First name and last name',
            'Date of birth',
            'Optional profile photo (copied onto the device)',
          ],
        ),
        LegalBulletGroup(
          heading: 'Health diary (entered by you)',
          items: [
            'Calendar marks: migraine, aura, headache, medication taken',
            'Aura types, duration, and notes',
            'Pain intensity',
            'Triggers (for example stress, sleep, alcohol, weather, menstruation, or a note you type)',
            'Medication names, doses, and schedules',
            'Daily medication records',
          ],
        ),
        LegalBulletGroup(
          heading: 'App settings',
          items: [
            'Language preference',
            'Onboarding and disclaimer acknowledgements',
            'Reminder settings',
          ],
        ),
      ],
      trailingBody:
          'This information is used only to show the calendar, analytics, '
          'reminders, and reports **on your device**.',
    ),
    LegalSection(
      title: '3. Permissions',
      body: 'The app may ask the system for:',
      table: LegalTable(
        headers: ['Permission', 'Why'],
        rows: [
          ['Notifications', 'Medication reminders at times you set'],
          ['Photo library', 'Choosing a profile photo'],
        ],
      ),
      trailingBody:
          'The iOS binary includes a file-picker library used to import a '
          'backup (ZIP or JSON). That library links camera and location APIs, '
          'so the App Store requires purpose strings in Info.plist. **The app '
          'does not use your location and does not track you.** Profile photos '
          'are chosen with the system photo picker, not by uploading images to '
          'us.\n\n'
          'You can deny permissions. The diary still works; reminders or a '
          'profile photo may be unavailable.',
    ),
    LegalSection(
      title: '4. Sharing, export, and import',
      body:
          'You can export a PDF report, CSV, or ZIP backup and share it '
          'through the system share sheet (for example Files, Mail, or another '
          'app you choose).\n\n'
          'That sharing is **your action**. We do not receive the file. Anyone '
          'you send it to will see the contents you exported (including '
          'profile and health data). Treat backups as sensitive.\n\n'
          'You can import a backup you previously exported. Import replaces '
          'local data on that device.\n\n'
          'We do not sell or share your information with advertisers, data '
          'brokers, or other third parties.',
    ),
    LegalSection(
      title: '5. Tracking and advertising',
      body: 'The app does not:',
      bullets: [
        'track you across other companies\' apps or websites',
        'use the Advertising Identifier (IDFA)',
        'show ads',
        'use App Tracking Transparency',
        'include analytics or marketing SDKs',
      ],
    ),
    LegalSection(
      title: '6. Children',
      body:
          'The app is not directed at children under 13. We do not knowingly '
          'collect information from children. Date of birth is stored only on '
          'the device if you enter it.',
    ),
    LegalSection(
      title: '7. Security and deletion',
      body:
          'Data remains on the device you use. Protect the device with a '
          'passcode, Face ID, or another lock. Uninstalling the app, or '
          'clearing the app\'s data in system settings, deletes local data.\n\n'
          'We cannot recover data from a lost device or an uninstalled app. '
          'Keep a backup if you need a copy.',
    ),
    LegalSection(
      title: '8. Changes',
      body:
          'If this policy changes, we will update the effective date and the '
          'version published at [https://offlience.com/migraine_tracker/privacy_policy](https://offlience.com/migraine_tracker/privacy_policy). '
          'Material changes will be reflected in the app store listing or in '
          'the app when required.',
    ),
    LegalSection(
      title: '9. Contact',
      body:
          'Developer: Individual Entrepreneur Andrei Osipau\n\n'
          'Website: [https://offlience.com](https://offlience.com)',
    ),
  ];
}
