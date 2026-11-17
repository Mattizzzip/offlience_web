import 'package:offlience_website/features/legal/core/legal_section.dart';

class PhotoGrafikPrivacyPolicyContent {
  PhotoGrafikPrivacyPolicyContent._();

  static const String title = 'Privacy Policy';
  static const String subtitle = 'PHOTO GRAFIK';
  static const String effectiveDate = 'Last updated: November 17, 2026';
  static const String documentTitle = 'Privacy Policy — PHOTO GRAFIK';

  static const String intro =
      '**PHOTO GRAFIK** ("the app") is a personal organizer for photographers. '
      'This policy explains what information the app handles and what it does '
      'not do.\n\n'
      'The app is offered by the developer of PHOTO GRAFIK ("we"). Contact: '
      '[info@offlience.com](mailto:info@offlience.com).';

  static const List<LegalSection> sections = [
    LegalSection(
      title: '1. Information stored on your device',
      body:
          'The app stores the following only on your iPhone, in the app\'s '
          'private storage:',
      bullets: [
        'Your photographer profile: name, profile photo, and language',
        'Bookings you create: client name, location, date and time, shoot type, price, currency, delivery deadline, client contacts, gallery link, and notes',
        'Shoot types and currencies you add',
        'Your reminder settings',
      ],
      trailingBody:
          'We do not operate an account system. We do not receive, upload, or '
          'store this information on a server. We cannot see it.\n\n'
          'Client details you type in are kept for your own use. You are '
          'responsible for having a proper reason to store your clients\' '
          'contact details on your device.',
    ),
    LegalSection(
      title: '2. Information we do not collect',
      body: 'We do not collect:',
      bullets: [
        'Analytics, advertising identifiers, or usage statistics',
        'Location',
        'Contacts from your address book (a phone number is stored only if you type it into a booking)',
        'Payment information',
      ],
      trailingBody:
          'The app does not sell personal information and does not share it '
          'with advertisers or data brokers.',
    ),
    LegalSection(
      title: '3. Photos',
      body:
          'You can choose a profile photo with the system photo picker. The '
          'app receives only the image you select, compresses it, and saves it '
          'on the device as part of your profile. It does not browse the rest '
          'of your photo library and does not upload the image.',
    ),
    LegalSection(
      title: '4. Notifications',
      body:
          'If you turn on reminders, the app asks for permission to send local '
          'notifications. Reminders are scheduled on your device. They are not '
          'sent through our servers. You can turn them off in the app or in '
          'iOS Settings.',
    ),
    LegalSection(
      title: '5. Links and calls',
      body:
          'A gallery link opens in the in-app browser. A phone number you '
          'saved can open the Phone app. Those actions are handled by iOS. '
          'Pages you open on the web are governed by that site\'s own policy, '
          'not this one.',
    ),
    LegalSection(
      title: '6. How long information stays',
      body:
          'Information remains on the device until you delete a booking, '
          'change your profile, or delete the app. Deleting the app removes '
          'its local data from that device. We have no copy to delete for '
          'you.\n\n'
          'Backups made by iOS (for example iCloud Backup) may include the '
          'app\'s data. Those backups are controlled by Apple and your Apple '
          'ID settings.',
    ),
    LegalSection(
      title: '7. Children',
      body:
          'PHOTO GRAFIK is not directed at children under 13, and we do not '
          'knowingly collect personal information from children.',
    ),
    LegalSection(
      title: '8. Changes',
      body:
          'If this policy changes, the updated version will be posted with a '
          'new "Last updated" date. Continued use of the app after the update '
          'means you accept the revised policy.',
    ),
    LegalSection(
      title: '9. Contact',
      body:
          'Questions about this policy: '
          '[info@offlience.com](mailto:info@offlience.com).',
    ),
  ];
}
