import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeTitle => 'Talks';

  @override
  String get date => 'Date:';

  @override
  String get time => 'Time:';

  @override
  String get selectLanguage => 'Select language';
}
