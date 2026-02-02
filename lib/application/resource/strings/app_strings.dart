import '../../../presentation/l10n/app_localizations.dart';
import '../../../presentation/navigation/app_navigation.dart';

//Run this command to generate new locale strings
//flutter gen-l10n
class AppStrings {
  static AppLocalizations getLocalization() {
    // fixme, to many null check operators
    return AppLocalizations.of(AppNavigation.navigatorKey.currentContext!)!;
  }

  static String replaceValue = '@value';

  static String get home => getLocalization().home;
  static String get appName => getLocalization().appName;
  static String get appDesc => getLocalization().appDesc;
  static String get contactSalesTeam => getLocalization().contactSalesTeam;
  static String get buyJewelry => getLocalization().buyJewelry;
  static String get sellYourJewelry => getLocalization().sellYourJewelry;
  static String get salesTeam => getLocalization().salesTeam;
  static String get expertJewelryConsultants => getLocalization().expertJewelryConsultants;
  static String get callNow => getLocalization().callNow;
}
