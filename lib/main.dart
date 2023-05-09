import 'package:flutter/material.dart';

import 'features/talks/pages/home_page.dart';
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
      home: const HomePage(),
    );
  }
}
