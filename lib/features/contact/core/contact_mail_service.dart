import 'package:offlience_website/features/contact/core/contact_catalog.dart';
import 'package:offlience_website/features/contact/core/contact_form_data.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMailService {
  const ContactMailService({
    this.recipient = ContactCatalog.recipientEmail,
  });

  final String recipient;

  Future<bool> send(ContactFormData data) async {
    final subject = Uri.encodeComponent(
      'Project inquiry from ${data.name}',
    );
    final body = Uri.encodeComponent(_buildBody(data));
    final uri = Uri.parse('mailto:$recipient?subject=$subject&body=$body');

    if (!await canLaunchUrl(uri)) {
      return false;
    }

    return launchUrl(uri);
  }

  String _buildBody(ContactFormData data) {
    return '''
${data.name}
${data.phone}

${data.projectDescription}
''';
  }
}
