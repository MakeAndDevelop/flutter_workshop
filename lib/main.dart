import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/home/home.dart';
import 'features/localization/state/localization_model.dart';
import 'generated/app_localizations.dart';
import 'ui/theme/app_theme.dart';
import 'ui/theme/theme.dart';

void main() {
  runApp(const DevEventsApp());
}

class DevEventsApp extends StatelessWidget {
  const DevEventsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocalizationModel(),
      child: Consumer<LocalizationModel>(
        builder: (context, localization, child) {
          return MaterialApp(
            title: 'Dev Events',
            theme: AppTheme.defaultTheme(context),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: localization.locale,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
