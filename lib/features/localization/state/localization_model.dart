import 'dart:ui';

import 'package:flutter/foundation.dart';

class LocalizationModel extends ChangeNotifier {
  Locale _locale = const Locale('en');

  // Only expose readonly access to state
  Locale get locale => _locale;
  List<Locale> get supportedLocales => const [Locale('en'), Locale('nl')];

  // Allow state modification only through defined actions
  void setLocale(Locale locale) {
    if (_locale.languageCode != locale.languageCode) {
      _locale = locale;
      notifyListeners();
    }
  }
}
