import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:offlience_website/features/landing_page.dart';
import 'package:offlience_website/features/legal/core/legal_routes.dart';
import 'package:offlience_website/features/legal/privacy_policy_page.dart';
import 'package:offlience_website/features/legal/terms_of_service_page.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

const _appTitle = 'Andrei Osipau — Software Developer';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  SystemChrome.setApplicationSwitcherDescription(
    const ApplicationSwitcherDescription(
      label: _appTitle,
      primaryColor: 0xFF0B121A,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.navy),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const LandingPage(),
        LegalRoutes.privacyPolicy: (_) => const PrivacyPolicyPage(),
        LegalRoutes.terms: (_) => const TermsOfServicePage(),
      },
    );
  }
}
