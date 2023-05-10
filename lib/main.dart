import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'features/home/home.dart';
import 'features/localization/state/localization_model.dart';
import 'features/talks/state/talks_model.dart';
import 'features/talks/talk_detail_page.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalizationModel()),
        ChangeNotifierProvider(create: (context) => TalksModel()..getTalks()),
      ],
      child: Consumer<LocalizationModel>(
        builder: (context, localization, child) {
          return MaterialApp.router(
            title: 'Dev Events',
            theme: AppTheme.defaultTheme(context),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: localization.locale,
            routerConfig: _router,
          );
        },
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'talks/:talkId',
          builder: (context, state) => TalkDetailPage(talkId: int.parse(state.pathParameters['talkId'] ?? '-1')),
        ),
      ],
    ),
  ],
);
