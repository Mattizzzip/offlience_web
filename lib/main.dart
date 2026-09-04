import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:offlience_website/features/app_router.dart';
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
      initialRoute:
          WidgetsBinding.instance.platformDispatcher.defaultRouteName,
      onGenerateRoute: AppRouter.onGenerateRoute,
      onGenerateInitialRoutes: AppRouter.onGenerateInitialRoutes,
    );
  }
}
