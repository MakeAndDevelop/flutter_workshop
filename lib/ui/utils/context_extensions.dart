import 'package:flutter/material.dart';

import '../../generated/app_localizations.dart';

extension ContextExtensions on BuildContext {
  /// Shorthand to retrieve the current them data
  ThemeData get theme => Theme.of(this);

  /// Shorthand to retrieve the current localizations
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
