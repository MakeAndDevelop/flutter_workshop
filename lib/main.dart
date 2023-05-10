import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/talks/pages/home_page.dart';
import 'generated/app_localizations.dart';
import 'ui/theme/theme.dart';

void main() {
  runApp(const DevEventsApp());
}

class DevEventsApp extends StatelessWidget {
  const DevEventsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Events',
      theme: AppTheme.defaultTheme(context),
      localizationsDelegates: const [
        // Our own localization delegate
        AppLocalizations.delegate,
        // Built-in localization of basic text for default widgets (date pickers, etc.)
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
