import 'package:todo_app/data/data_source/network/jewelry_remote_data_source.dart';
import 'package:todo_app/presentation/base_bloc/base_cubit.dart';

import '../../../../domain/entities/buy_jewelry/jewelry_entity.dart';
import '../widgets/jewelry_filter_bottom_sheet.dart';
import 'buy_jewelry_state.dart';

class BuyJewelryBloc extends BaseCubit<BuyJewelryState> {
  BuyJewelryBloc(this._jewelryRemoteDataSource)
      : super(BuyJewelryState(jewelryList: [], jewelryListOriginal: []));

  final JewelryRemoteDataSource _jewelryRemoteDataSource;

  void initState() {
    fetchJewelryList();
  }

  Future<void> fetchJewelryList() async {
    emit(state.copyWith(screenStatus: BuyJewelryScreenStatus.loading));

    try {
      final list = await _jewelryRemoteDataSource.fetchJewelryCatalog();
      emit(state.copyWith(
        jewelryList: list,
        jewelryListOriginal: list,
        screenStatus: BuyJewelryScreenStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(screenStatus: BuyJewelryScreenStatus.error));
    }
  }

  void toggleFavorite(int index) {
    final currentList = state.jewelryList;
    final item = currentList[index];

    // Update in original list
    final originalIndex = state.jewelryListOriginal.indexWhere((e) => e.id == item.id);
    final updatedOriginal = List<JewelryEntity>.from(state.jewelryListOriginal);
    if (originalIndex != -1) {
      updatedOriginal[originalIndex] = updatedOriginal[originalIndex].copyWith(
        isFavorite: !item.isFavorite,
      );
    }

    // Update in filtered list
    final updatedList = List<JewelryEntity>.from(currentList);
    updatedList[index] = updatedList[index].copyWith(
      isFavorite: !item.isFavorite,
    );

    emit(state.copyWith(
      jewelryList: updatedList,
      jewelryListOriginal: updatedOriginal,
    ));
  }

  void selectTab(JewelryTab tab) {
    emit(state.copyWith(selectedTab: tab));
  }

  void applyFilters(JewelryFilterState filterState) {
    var filteredList = List<JewelryEntity>.from(state.jewelryListOriginal);

    // Filter by favorites
    if (filterState.showFavoritesOnly) {
      filteredList = filteredList.where((item) => item.isFavorite).toList();
    }

    // Filter by price range
    filteredList = _filterByPriceRange(filteredList, filterState.priceRange);

    // Filter by category
    filteredList = _filterByCategory(filteredList, filterState.category);

    // Sort
    filteredList = _sortList(filteredList, filterState.sortBy);

    emit(state.copyWith(
      jewelryList: filteredList,
      filterState: filterState,
    ));
  }

  List<JewelryEntity> _filterByPriceRange(
    List<JewelryEntity> list,
    PriceRange range,
  ) {
    switch (range) {
      case PriceRange.all:
        return list;
      case PriceRange.under10m:
        return list.where((item) => item.price < 10000000).toList();
      case PriceRange.from10mTo30m:
        return list.where((item) => item.price >= 10000000 && item.price < 30000000).toList();
      case PriceRange.from30mTo50m:
        return list.where((item) => item.price >= 30000000 && item.price < 50000000).toList();
      case PriceRange.above50m:
        return list.where((item) => item.price >= 50000000).toList();
    }
  }

  List<JewelryEntity> _filterByCategory(
    List<JewelryEntity> list,
    JewelryCategory category,
  ) {
    switch (category) {
      case JewelryCategory.all:
        return list;
      case JewelryCategory.vangSJC:
        return list.where((item) => item.category == 'Vàng SJC').toList();
      case JewelryCategory.vang24K:
        return list.where((item) => item.category == 'Vàng 24K').toList();
      case JewelryCategory.vang18K:
        return list.where((item) => item.category == 'Vàng 18K').toList();
      case JewelryCategory.vang14K:
        return list.where((item) => item.category == 'Vàng 14K').toList();
      case JewelryCategory.vangTrang:
        return list.where((item) => item.category == 'Vàng Trắng').toList();
      case JewelryCategory.daQuy:
        return list.where((item) => item.category == 'Đá Quý').toList();
    }
  }

  List<JewelryEntity> _sortList(List<JewelryEntity> list, SortBy sortBy) {
    final sortedList = List<JewelryEntity>.from(list);
    switch (sortBy) {
      case SortBy.nameAZ:
        sortedList.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortBy.priceLowToHigh:
        sortedList.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortBy.priceHighToLow:
        sortedList.sort((a, b) => b.price.compareTo(a.price));
        break;
    }
    return sortedList;
  }
}
