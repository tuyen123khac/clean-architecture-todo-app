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
  /// **'< 10M'**
  String get under10m;

  /// No description provided for @from10mTo30m.
  ///
  /// In en, this message translates to:
  /// **'10 - 30M'**
  String get from10mTo30m;

  /// No description provided for @from30mTo50m.
  ///
  /// In en, this message translates to:
  /// **'30 - 50M'**
  String get from30mTo50m;

  /// No description provided for @above50m.
  ///
  /// In en, this message translates to:
  /// **'> 50M'**
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

  /// No description provided for @sjcGold.
  ///
  /// In en, this message translates to:
  /// **'SJC Gold'**
  String get sjcGold;

  /// No description provided for @gold24K.
  ///
  /// In en, this message translates to:
  /// **'24K Gold'**
  String get gold24K;

  /// No description provided for @gold18K.
  ///
  /// In en, this message translates to:
  /// **'18K Gold'**
  String get gold18K;

  /// No description provided for @gold14K.
  ///
  /// In en, this message translates to:
  /// **'14K Gold'**
  String get gold14K;

  /// No description provided for @whiteGold.
  ///
  /// In en, this message translates to:
  /// **'White Gold'**
  String get whiteGold;

  /// No description provided for @gemstone.
  ///
  /// In en, this message translates to:
  /// **'Gemstone'**
  String get gemstone;

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

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

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

  /// No description provided for @salesTitleSalesManager.
  ///
  /// In en, this message translates to:
  /// **'Sales Manager'**
  String get salesTitleSalesManager;

  /// No description provided for @salesTitleSalesSpecialist.
  ///
  /// In en, this message translates to:
  /// **'Sales Specialist'**
  String get salesTitleSalesSpecialist;

  /// No description provided for @salesTitleSeniorSalesRep.
  ///
  /// In en, this message translates to:
  /// **'Senior Sales Rep'**
  String get salesTitleSeniorSalesRep;

  /// No description provided for @salesTitleSalesTeamLead.
  ///
  /// In en, this message translates to:
  /// **'Sales Team Lead'**
  String get salesTitleSalesTeamLead;

  /// No description provided for @salesTitleSalesRep.
  ///
  /// In en, this message translates to:
  /// **'Sales Rep'**
  String get salesTitleSalesRep;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection'**
  String get networkError;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @failedToLoadMore.
  ///
  /// In en, this message translates to:
  /// **'Failed to load more'**
  String get failedToLoadMore;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @inStock.
  ///
  /// In en, this message translates to:
  /// **'in stock'**
  String get inStock;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'reviews'**
  String get reviews;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @material.
  ///
  /// In en, this message translates to:
  /// **'Material'**
  String get material;

  /// No description provided for @premiumMaterial.
  ///
  /// In en, this message translates to:
  /// **'Premium Material'**
  String get premiumMaterial;

  /// No description provided for @certifiedAuthentic.
  ///
  /// In en, this message translates to:
  /// **'Certified Authentic'**
  String get certifiedAuthentic;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @chooseHowToSort.
  ///
  /// In en, this message translates to:
  /// **'Choose how to sort items'**
  String get chooseHowToSort;

  /// No description provided for @sellItems.
  ///
  /// In en, this message translates to:
  /// **'Sell Jewelry'**
  String get sellItems;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @synced.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get synced;

  /// No description provided for @itemsInInventory.
  ///
  /// In en, this message translates to:
  /// **'{count} items in inventory'**
  String itemsInInventory(int count);

  /// No description provided for @itemsPendingSync.
  ///
  /// In en, this message translates to:
  /// **'{count} items pending sync'**
  String itemsPendingSync(int count);

  /// No description provided for @bulkSelect.
  ///
  /// In en, this message translates to:
  /// **'Bulk Select'**
  String get bulkSelect;

  /// No description provided for @stockCount.
  ///
  /// In en, this message translates to:
  /// **'Stock: {count}'**
  String stockCount(int count);

  /// No description provided for @quantityToSell.
  ///
  /// In en, this message translates to:
  /// **'Quantity to sell:'**
  String get quantityToSell;

  /// No description provided for @itemsToSell.
  ///
  /// In en, this message translates to:
  /// **'{count} items to sell'**
  String itemsToSell(int count);

  /// No description provided for @estimatedPrice.
  ///
  /// In en, this message translates to:
  /// **'Est. {price}'**
  String estimatedPrice(String price);

  /// No description provided for @sellNow.
  ///
  /// In en, this message translates to:
  /// **'Sell Now'**
  String get sellNow;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @confirmPurchase.
  ///
  /// In en, this message translates to:
  /// **'Confirm Purchase'**
  String get confirmPurchase;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @totalCost.
  ///
  /// In en, this message translates to:
  /// **'Total Cost'**
  String get totalCost;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @purchaseSuccess.
  ///
  /// In en, this message translates to:
  /// **'Purchase successful!'**
  String get purchaseSuccess;

  /// No description provided for @purchaseFailed.
  ///
  /// In en, this message translates to:
  /// **'Purchase failed. Please try again.'**
  String get purchaseFailed;

  /// No description provided for @addNewJewelry.
  ///
  /// In en, this message translates to:
  /// **'Add New Jewelry'**
  String get addNewJewelry;

  /// No description provided for @editJewelry.
  ///
  /// In en, this message translates to:
  /// **'Edit Jewelry'**
  String get editJewelry;

  /// No description provided for @jewelryName.
  ///
  /// In en, this message translates to:
  /// **'Jewelry Name'**
  String get jewelryName;

  /// No description provided for @enterJewelryName.
  ///
  /// In en, this message translates to:
  /// **'Enter jewelry name'**
  String get enterJewelryName;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stock;

  /// No description provided for @imageUrl.
  ///
  /// In en, this message translates to:
  /// **'Image URL'**
  String get imageUrl;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @addJewelry.
  ///
  /// In en, this message translates to:
  /// **'Add Jewelry'**
  String get addJewelry;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @priceRequired.
  ///
  /// In en, this message translates to:
  /// **'Price is required'**
  String get priceRequired;

  /// No description provided for @invalidPrice.
  ///
  /// In en, this message translates to:
  /// **'Invalid price'**
  String get invalidPrice;

  /// No description provided for @stockRequired.
  ///
  /// In en, this message translates to:
  /// **'Stock is required'**
  String get stockRequired;

  /// No description provided for @invalidStock.
  ///
  /// In en, this message translates to:
  /// **'Invalid stock'**
  String get invalidStock;

  /// No description provided for @deleteItem.
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get deleteItem;

  /// No description provided for @deleteItemConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String deleteItemConfirmation(String name);

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @itemDeleted.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" has been deleted'**
  String itemDeleted(String name);

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @itemRestored.
  ///
  /// In en, this message translates to:
  /// **'Item restored'**
  String get itemRestored;

  /// No description provided for @clearSelection.
  ///
  /// In en, this message translates to:
  /// **'Clear Selection'**
  String get clearSelection;

  /// No description provided for @noItemsInInventory.
  ///
  /// In en, this message translates to:
  /// **'No items in inventory'**
  String get noItemsInInventory;

  /// No description provided for @tapToAddFirstItem.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first item'**
  String get tapToAddFirstItem;

  /// No description provided for @confirmSale.
  ///
  /// In en, this message translates to:
  /// **'Confirm Sale'**
  String get confirmSale;

  /// No description provided for @totalItems.
  ///
  /// In en, this message translates to:
  /// **'Total Items'**
  String get totalItems;

  /// No description provided for @estimatedRevenue.
  ///
  /// In en, this message translates to:
  /// **'Estimated Revenue'**
  String get estimatedRevenue;

  /// No description provided for @confirmSell.
  ///
  /// In en, this message translates to:
  /// **'Confirm Sell'**
  String get confirmSell;

  /// No description provided for @saleSuccess.
  ///
  /// In en, this message translates to:
  /// **'Sale completed successfully!'**
  String get saleSuccess;

  /// No description provided for @saleFailed.
  ///
  /// In en, this message translates to:
  /// **'Sale failed. Please try again.'**
  String get saleFailed;

  /// No description provided for @bulkDelete.
  ///
  /// In en, this message translates to:
  /// **'Bulk Delete'**
  String get bulkDelete;

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectAll;

  /// No description provided for @itemsSelected.
  ///
  /// In en, this message translates to:
  /// **'{count} items selected'**
  String itemsSelected(int count);

  /// No description provided for @itemsDeletedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} items deleted'**
  String itemsDeletedCount(int count);

  /// No description provided for @deleteItemsConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {count} items?'**
  String deleteItemsConfirmation(int count);

  /// No description provided for @thisFieldIsRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get thisFieldIsRequired;

  /// No description provided for @enterExample.
  ///
  /// In en, this message translates to:
  /// **'e.g. {example}'**
  String enterExample(String example);

  /// No description provided for @noItemsInWishlist.
  ///
  /// In en, this message translates to:
  /// **'No items in wishlist'**
  String get noItemsInWishlist;

  /// No description provided for @noItemsFound.
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get noItemsFound;

  /// No description provided for @addToWishlist.
  ///
  /// In en, this message translates to:
  /// **'Add items to your wishlist'**
  String get addToWishlist;

  /// No description provided for @sync.
  ///
  /// In en, this message translates to:
  /// **'Sync'**
  String get sync;

  /// No description provided for @syncSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sync your data with server'**
  String get syncSubtitle;

  /// No description provided for @syncNow.
  ///
  /// In en, this message translates to:
  /// **'Sync Now'**
  String get syncNow;

  /// No description provided for @syncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get syncing;

  /// No description provided for @syncFailed.
  ///
  /// In en, this message translates to:
  /// **'Sync failed'**
  String get syncFailed;

  /// No description provided for @syncSuccess.
  ///
  /// In en, this message translates to:
  /// **'Sync completed'**
  String get syncSuccess;

  /// No description provided for @tapToRetrySync.
  ///
  /// In en, this message translates to:
  /// **'Tap to retry sync'**
  String get tapToRetrySync;

  /// No description provided for @lastSynced.
  ///
  /// In en, this message translates to:
  /// **'Last synced: {time}'**
  String lastSynced(String time);

  /// No description provided for @neverSynced.
  ///
  /// In en, this message translates to:
  /// **'Never synced'**
  String get neverSynced;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get noNotifications;

  /// No description provided for @noNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up!'**
  String get noNotificationsSubtitle;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @pendingSync.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pendingSync;

  /// No description provided for @itemsRestored.
  ///
  /// In en, this message translates to:
  /// **'{count} items restored'**
  String itemsRestored(int count);
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
