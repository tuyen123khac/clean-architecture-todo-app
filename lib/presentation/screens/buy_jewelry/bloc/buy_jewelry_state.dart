import '../../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';
import '../widgets/buy_jewelry_filter_bottom_sheet.dart';
import '../widgets/buy_jewelry_sort_bottom_sheet.dart';

enum BuyJewelryScreenStatus { initial, loading, success, error }

enum BuyJewelryTab { allItems, wishlist }

class BuyJewelryState {
  /// Original list from API (backup for reset/filter)
  final List<BuyJewelryEntity> buyJewelryListOriginal;

  /// Filtered/sorted list for All Items tab
  final List<BuyJewelryEntity> buyJewelryList;

  /// Wishlist from local DB
  final List<BuyJewelryEntity> buyJewelryWishList;

  final BuyJewelryScreenStatus screenStatus;
  final BuyJewelryFilterState filterState;
  final SortBy sortBy;
  final BuyJewelryTab selectedTab;
  final String? errorMessage;

  const BuyJewelryState({
    this.buyJewelryListOriginal = const [],
    this.buyJewelryList = const [],
    this.buyJewelryWishList = const [],
    this.screenStatus = BuyJewelryScreenStatus.initial,
    this.filterState = const BuyJewelryFilterState(),
    this.sortBy = SortBy.priceHighToLow,
    this.selectedTab = BuyJewelryTab.allItems,
    this.errorMessage,
  });

  BuyJewelryState copyWith({
    List<BuyJewelryEntity>? buyJewelryListOriginal,
    List<BuyJewelryEntity>? buyJewelryList,
    List<BuyJewelryEntity>? buyJewelryWishList,
    BuyJewelryScreenStatus? screenStatus,
    BuyJewelryFilterState? filterState,
    SortBy? sortBy,
    BuyJewelryTab? selectedTab,
    String? Function()? errorMessage,
  }) {
    return BuyJewelryState(
      buyJewelryListOriginal: buyJewelryListOriginal ?? this.buyJewelryListOriginal,
      buyJewelryList: buyJewelryList ?? this.buyJewelryList,
      buyJewelryWishList: buyJewelryWishList ?? this.buyJewelryWishList,
      screenStatus: screenStatus ?? this.screenStatus,
      filterState: filterState ?? this.filterState,
      sortBy: sortBy ?? this.sortBy,
      selectedTab: selectedTab ?? this.selectedTab,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }
}
