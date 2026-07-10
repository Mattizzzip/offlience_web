import 'package:url_launcher/url_launcher.dart';

class FooterLinkLauncher {
  const FooterLinkLauncher();

  Future<bool> openMailto(String email) {
    return launchUrl(Uri.parse('mailto:$email'));
  }
}
