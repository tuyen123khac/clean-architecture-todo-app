import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Jewellogic'**
  String get appName;

  /// No description provided for @appSlogan.
  ///
  /// In en, this message translates to:
  /// **'Where Elegance Meets Eternity'**
  String get appSlogan;

  /// No description provided for @appDesc.
  ///
  /// In en, this message translates to:
  /// **'Copyright by Công ty vàng bạc đá quý Joblogic - Jewellogic'**
  String get appDesc;

  /// No description provided for @contactSalesTeam.
  ///
  /// In en, this message translates to:
  /// **'Contact Sales Team'**
  String get contactSalesTeam;

  /// No description provided for @buyJewelry.
  ///
  /// In en, this message translates to:
  /// **'Buy Jewelry'**
  String get buyJewelry;

  /// No description provided for @sellYourJewelry.
  ///
  /// In en, this message translates to:
  /// **'Sell Your Jewelry'**
  String get sellYourJewelry;

  /// No description provided for @salesTeam.
  ///
  /// In en, this message translates to:
  /// **'Sales Team'**
  String get salesTeam;

  /// No description provided for @expertJewelryConsultants.
  ///
  /// In en, this message translates to:
  /// **'Expert jewelry consultants'**
  String get expertJewelryConsultants;

  /// No description provided for @callNow.
  ///
  /// In en, this message translates to:
  /// **'Call now'**
  String get callNow;

  /// No description provided for @salesTeamSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Meet our expert jewelry consultants'**
  String get salesTeamSubtitle;

  /// No description provided for @buyJewelrySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Browse our jewelry collection'**
  String get buyJewelrySubtitle;

  /// No description provided for @sellYourJewelrySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get the best value for your pieces'**
  String get sellYourJewelrySubtitle;

  /// No description provided for @jewelry.
  ///
  /// In en, this message translates to:
  /// **'Jewelry'**
  String get jewelry;

  /// No description provided for @itemsAvailable.
  ///
  /// In en, this message translates to:
  /// **'{count} items available'**
  String itemsAvailable(int count);

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @refineYourSearch.
  ///
  /// In en, this message translates to:
  /// **'Refine your search'**
  String get refineYourSearch;

  /// No description provided for @showFavoritesOnly.
  ///
  /// In en, this message translates to:
  /// **'Show Favorites Only'**
  String get showFavoritesOnly;

  /// No description provided for @wishlistedItems.
  ///
  /// In en, this message translates to:
  /// **'Wishlisted Items'**
  String get wishlistedItems;

  /// No description provided for @priceRange.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get priceRange;

  /// No description provided for @allPrices.
  ///
  /// In en, this message translates to:
  /// **'All Prices'**
  String get allPrices;

  /// No description provided for @under10m.
  ///
  /// In en, this message translates to:
  /// **'< 10 triệu'**
  String get under10m;

  /// No description provided for @from10mTo30m.
  ///
  /// In en, this message translates to:
  /// **'10 - 30 triệu'**
  String get from10mTo30m;

  /// No description provided for @from30mTo50m.
  ///
  /// In en, this message translates to:
  /// **'30 - 50 triệu'**
  String get from30mTo50m;

  /// No description provided for @above50m.
  ///
  /// In en, this message translates to:
  /// **'> 50 triệu'**
  String get above50m;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @allCategories.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allCategories;

  /// No description provided for @vangSJC.
  ///
  /// In en, this message translates to:
  /// **'Vàng SJC'**
  String get vangSJC;

  /// No description provided for @vang24K.
  ///
  /// In en, this message translates to:
  /// **'Vàng 24K'**
  String get vang24K;

  /// No description provided for @vang18K.
  ///
  /// In en, this message translates to:
  /// **'Vàng 18K'**
  String get vang18K;

  /// No description provided for @vang14K.
  ///
  /// In en, this message translates to:
  /// **'Vàng 14K'**
  String get vang14K;

  /// No description provided for @vangTrang.
  ///
  /// In en, this message translates to:
  /// **'Vàng Trắng'**
  String get vangTrang;

  /// No description provided for @daQuy.
  ///
  /// In en, this message translates to:
  /// **'Đá Quý'**
  String get daQuy;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sortBy;

  /// No description provided for @nameAZ.
  ///
  /// In en, this message translates to:
  /// **'Name (A-Z)'**
  String get nameAZ;

  /// No description provided for @priceLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Price: Low to High'**
  String get priceLowToHigh;

  /// No description provided for @priceHighToLow.
  ///
  /// In en, this message translates to:
  /// **'Price: High to Low'**
  String get priceHighToLow;

  /// No description provided for @resetAll.
  ///
  /// In en, this message translates to:
  /// **'Reset All'**
  String get resetAll;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFilters;

  /// No description provided for @allItems.
  ///
  /// In en, this message translates to:
  /// **'All Items'**
  String get allItems;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @ageRange.
  ///
  /// In en, this message translates to:
  /// **'Age Range'**
  String get ageRange;

  /// No description provided for @yearsOld.
  ///
  /// In en, this message translates to:
  /// **'years old'**
  String get yearsOld;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @noMoreData.
  ///
  /// In en, this message translates to:
  /// **'No more data'**
  String get noMoreData;

  /// No description provided for @consultantsAvailable.
  ///
  /// In en, this message translates to:
  /// **'{count} consultants available'**
  String consultantsAvailable(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
