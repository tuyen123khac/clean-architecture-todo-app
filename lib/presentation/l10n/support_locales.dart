import 'dart:ui';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localizations.dart';
import 'locale_enum.dart';

final supportLocales = [
  Locale(LocaleEnum.vi.value), // Vietnamese
  Locale(LocaleEnum.en.value), // English
];

final localeDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
