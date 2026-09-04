import 'package:flutter/material.dart';
import 'package:offlience_website/features/landing_page.dart';
import 'package:offlience_website/features/legal/core/legal_routes.dart';
import 'package:offlience_website/features/legal/migraine_tracker_privacy_policy_page.dart';
import 'package:offlience_website/features/legal/migraine_tracker_terms_of_use_page.dart';
import 'package:offlience_website/features/legal/privacy_policy_page.dart';
import 'package:offlience_website/features/legal/terms_of_service_page.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final name = LegalRoutes.normalize(settings.name);
    return MaterialPageRoute<void>(
      settings: RouteSettings(name: name, arguments: settings.arguments),
      builder: (_) => pageFor(name),
    );
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(String initialRoute) {
    final name = LegalRoutes.normalize(initialRoute);
    return [
      MaterialPageRoute<void>(
        settings: RouteSettings(name: name),
        builder: (_) => pageFor(name),
      ),
    ];
  }

  static Widget pageFor(String? name) {
    switch (LegalRoutes.normalize(name)) {
      case LegalRoutes.privacyPolicy:
        return const PrivacyPolicyPage();
      case LegalRoutes.terms:
        return const TermsOfServicePage();
      case LegalRoutes.migraineTrackerPrivacyPolicy:
        return const MigraineTrackerPrivacyPolicyPage();
      case LegalRoutes.migraineTrackerPrivacyPolicyRu:
        return const MigraineTrackerPrivacyPolicyPage(russian: true);
      case LegalRoutes.migraineTrackerTermsOfUse:
        return const MigraineTrackerTermsOfUsePage();
      case LegalRoutes.migraineTrackerTermsOfUseRu:
        return const MigraineTrackerTermsOfUsePage(russian: true);
      case '/':
      default:
        return const LandingPage();
    }
  }
}
