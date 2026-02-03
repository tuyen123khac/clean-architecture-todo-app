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
  static String get appSlogan => getLocalization().appSlogan;
  static String get appDesc => getLocalization().appDesc;
  static String get contactSalesTeam => getLocalization().contactSalesTeam;
  static String get buyJewelry => getLocalization().buyJewelry;
  static String get sellYourJewelry => getLocalization().sellYourJewelry;
  static String get salesTeam => getLocalization().salesTeam;
  static String get expertJewelryConsultants => getLocalization().expertJewelryConsultants;
  static String get callNow => getLocalization().callNow;
  static String get salesTeamSubtitle => getLocalization().salesTeamSubtitle;
  static String get buyJewelrySubtitle => getLocalization().buyJewelrySubtitle;
  static String get sellYourJewelrySubtitle => getLocalization().sellYourJewelrySubtitle;
  static String get jewelry => getLocalization().jewelry;
  static String itemsAvailable(int count) => getLocalization().itemsAvailable(count);
  static String get view => getLocalization().view;
  static String get filters => getLocalization().filters;
  static String get refineYourSearch => getLocalization().refineYourSearch;
  static String get showFavoritesOnly => getLocalization().showFavoritesOnly;
  static String get wishlistedItems => getLocalization().wishlistedItems;
  static String get priceRange => getLocalization().priceRange;
  static String get allPrices => getLocalization().allPrices;
  static String get under10m => getLocalization().under10m;
  static String get from10mTo30m => getLocalization().from10mTo30m;
  static String get from30mTo50m => getLocalization().from30mTo50m;
  static String get above50m => getLocalization().above50m;
  static String get category => getLocalization().category;
  static String get allCategories => getLocalization().allCategories;
  static String get sjcGold => getLocalization().sjcGold;
  static String get gold24K => getLocalization().gold24K;
  static String get gold18K => getLocalization().gold18K;
  static String get gold14K => getLocalization().gold14K;
  static String get whiteGold => getLocalization().whiteGold;
  static String get gemstone => getLocalization().gemstone;
  static String get sortBy => getLocalization().sortBy;
  static String get nameAZ => getLocalization().nameAZ;
  static String get priceLowToHigh => getLocalization().priceLowToHigh;
  static String get priceHighToLow => getLocalization().priceHighToLow;
  static String get resetAll => getLocalization().resetAll;
  static String get applyFilters => getLocalization().applyFilters;
  static String get allItems => getLocalization().allItems;
  static String get wishlist => getLocalization().wishlist;
  static String get ageRange => getLocalization().ageRange;
  static String get yearsOld => getLocalization().yearsOld;
  static String get gender => getLocalization().gender;
  static String get all => getLocalization().all;
  static String get male => getLocalization().male;
  static String get female => getLocalization().female;
  static String get other => getLocalization().other;
  static String get noMoreData => getLocalization().noMoreData;
  static String consultantsAvailable(int count) => getLocalization().consultantsAvailable(count);

  static String get salesManager => getLocalization().salesTitleSalesManager;
  static String get salesSpecialist => getLocalization().salesTitleSalesSpecialist;
  static String get seniorSalesRep => getLocalization().salesTitleSeniorSalesRep;
  static String get salesTeamLead => getLocalization().salesTitleSalesTeamLead;
  static String get salesRep => getLocalization().salesTitleSalesRep;
  static String get networkError => getLocalization().networkError;
  static String get somethingWentWrong => getLocalization().somethingWentWrong;
  static String get retry => getLocalization().retry;
  static String get failedToLoadMore => getLocalization().failedToLoadMore;
}
