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
  static String get details => getLocalization().details;
  static String get inStock => getLocalization().inStock;
  static String get reviews => getLocalization().reviews;
  static String get weight => getLocalization().weight;
  static String get size => getLocalization().size;
  static String get material => getLocalization().material;
  static String get premiumMaterial => getLocalization().premiumMaterial;
  static String get certifiedAuthentic => getLocalization().certifiedAuthentic;
  static String get description => getLocalization().description;
  static String get features => getLocalization().features;
  static String get addToCart => getLocalization().addToCart;
  static String get chooseHowToSort => getLocalization().chooseHowToSort;
  static String get sellItems => getLocalization().sellItems;
  static String get online => getLocalization().online;
  static String get offline => getLocalization().offline;
  static String get synced => getLocalization().synced;
  static String itemsInInventory(int count) => getLocalization().itemsInInventory(count);
  static String itemsPendingSync(int count) => getLocalization().itemsPendingSync(count);
  static String get bulkSelect => getLocalization().bulkSelect;
  static String stockCount(int count) => getLocalization().stockCount(count);
  static String get quantityToSell => getLocalization().quantityToSell;
  static String itemsToSell(int count) => getLocalization().itemsToSell(count);
  static String estimatedPrice(String price) => getLocalization().estimatedPrice(price);
  static String get sellNow => getLocalization().sellNow;
  static String get buy => getLocalization().buy;
  static String get confirmPurchase => getLocalization().confirmPurchase;
  static String get quantity => getLocalization().quantity;
  static String get totalCost => getLocalization().totalCost;
  static String get payment => getLocalization().payment;
  static String get cancel => getLocalization().cancel;
  static String get purchaseSuccess => getLocalization().purchaseSuccess;
  static String get purchaseFailed => getLocalization().purchaseFailed;

  // Sell Jewelry CRUD
  static String get addNewJewelry => getLocalization().addNewJewelry;
  static String get editJewelry => getLocalization().editJewelry;
  static String get jewelryName => getLocalization().jewelryName;
  static String get enterJewelryName => getLocalization().enterJewelryName;
  static String get price => getLocalization().price;
  static String get stock => getLocalization().stock;
  static String get imageUrl => getLocalization().imageUrl;
  static String get saveChanges => getLocalization().saveChanges;
  static String get addJewelry => getLocalization().addJewelry;
  static String get nameRequired => getLocalization().nameRequired;
  static String get priceRequired => getLocalization().priceRequired;
  static String get invalidPrice => getLocalization().invalidPrice;
  static String get stockRequired => getLocalization().stockRequired;
  static String get invalidStock => getLocalization().invalidStock;
  static String get deleteItem => getLocalization().deleteItem;
  static String deleteItemConfirmation(String name) => getLocalization().deleteItemConfirmation(name);
  static String get delete => getLocalization().delete;
  static String itemDeleted(String name) => getLocalization().itemDeleted(name);
  static String get undo => getLocalization().undo;
  static String get itemRestored => getLocalization().itemRestored;
  static String get clearSelection => getLocalization().clearSelection;
  static String get noItemsInInventory => getLocalization().noItemsInInventory;
  static String get tapToAddFirstItem => getLocalization().tapToAddFirstItem;
  static String get confirmSale => getLocalization().confirmSale;
  static String get totalItems => getLocalization().totalItems;
  static String get estimatedRevenue => getLocalization().estimatedRevenue;
  static String get confirmSell => getLocalization().confirmSell;
  static String get saleSuccess => getLocalization().saleSuccess;
  static String get saleFailed => getLocalization().saleFailed;
  static String get bulkDelete => getLocalization().bulkDelete;
  static String get selectAll => getLocalization().selectAll;
  static String itemsSelected(int count) => getLocalization().itemsSelected(count);
  static String itemsDeletedCount(int count) => getLocalization().itemsDeletedCount(count);
  static String deleteItemsConfirmation(int count) => getLocalization().deleteItemsConfirmation(count);
  static String get thisFieldIsRequired => getLocalization().thisFieldIsRequired;
  static String enterExample(String example) => getLocalization().enterExample(example);

  // Buy Jewelry
  static String get noItemsInWishlist => getLocalization().noItemsInWishlist;
  static String get noItemsFound => getLocalization().noItemsFound;
  static String get addToWishlist => getLocalization().addToWishlist;

  // Sync
  static String get sync => getLocalization().sync;
  static String get syncSubtitle => getLocalization().syncSubtitle;
  static String get syncNow => getLocalization().syncNow;
  static String get syncing => getLocalization().syncing;
  static String get syncFailed => getLocalization().syncFailed;
  static String get syncSuccess => getLocalization().syncSuccess;
  static String get tapToRetrySync => getLocalization().tapToRetrySync;
  static String lastSynced(String time) => getLocalization().lastSynced(time);
  static String get neverSynced => getLocalization().neverSynced;

  // Notifications
  static String get notifications => getLocalization().notifications;
  static String get noNotifications => getLocalization().noNotifications;
  static String get noNotificationsSubtitle => getLocalization().noNotificationsSubtitle;
  static String get clearAll => getLocalization().clearAll;
  static String get pendingSync => getLocalization().pendingSync;
  static String itemsRestored(int count) => getLocalization().itemsRestored(count);
}
