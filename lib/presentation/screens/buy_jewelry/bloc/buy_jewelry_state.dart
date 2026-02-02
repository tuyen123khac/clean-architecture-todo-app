import '../../../../domain/entities/buy_jewelry/jewelry_entity.dart';
import '../widgets/jewelry_filter_bottom_sheet.dart';

enum BuyJewelryScreenStatus { initial, loading, success, error }

enum JewelryTab { allItems, wishlist }

class BuyJewelryState {
  final List<JewelryEntity> jewelryList;
  final List<JewelryEntity> jewelryListOriginal;
  final BuyJewelryScreenStatus screenStatus;
  final JewelryFilterState filterState;
  final JewelryTab selectedTab;

  BuyJewelryState({
    required this.jewelryList,
    required this.jewelryListOriginal,
    this.screenStatus = BuyJewelryScreenStatus.initial,
    this.filterState = const JewelryFilterState(),
    this.selectedTab = JewelryTab.allItems,
  });

  List<JewelryEntity> get displayList {
    if (selectedTab == JewelryTab.wishlist) {
      return jewelryList.where((item) => item.isFavorite).toList();
    }
    return jewelryList;
  }

  int get wishlistCount {
    return jewelryListOriginal.where((item) => item.isFavorite).length;
  }

  BuyJewelryState copyWith({
    List<JewelryEntity>? jewelryList,
    List<JewelryEntity>? jewelryListOriginal,
    BuyJewelryScreenStatus? screenStatus,
    JewelryFilterState? filterState,
    JewelryTab? selectedTab,
  }) {
    return BuyJewelryState(
      jewelryList: jewelryList ?? this.jewelryList,
      jewelryListOriginal: jewelryListOriginal ?? this.jewelryListOriginal,
      screenStatus: screenStatus ?? this.screenStatus,
      filterState: filterState ?? this.filterState,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
