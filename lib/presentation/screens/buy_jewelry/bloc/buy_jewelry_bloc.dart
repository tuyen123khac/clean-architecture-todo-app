import 'dart:async';

import '../../../../application/resource/strings/app_strings.dart';
import '../../../../data/data_source/network/exceptions/base_exception.dart';
import '../../../../domain/entities/buy_jewelry/jewelry_category_enum_entity.dart';
import '../../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../../../domain/use_cases/buy_jewelry/add_to_wishlist.dart';
import '../../../../domain/use_cases/buy_jewelry/get_all_wishlist.dart';
import '../../../../domain/use_cases/buy_jewelry/get_jewelry_list.dart';
import '../../../../domain/use_cases/buy_jewelry/remove_from_wishlist.dart';
import '../../../../domain/use_cases/buy_jewelry/watch_wishlist.dart';
import '../../../base_bloc/base_cubit.dart';
import '../widgets/buy_jewelry_filter_bottom_sheet.dart';
import '../widgets/buy_jewelry_sort_bottom_sheet.dart';
import 'buy_jewelry_state.dart';

class BuyJewelryBloc extends BaseCubit<BuyJewelryState> {
  final GetJewelryList _getJewelryList;
  final GetAllWishlist _getAllWishlist;
  final WatchWishlist _watchWishlist;
  final AddToWishlist _addToWishlist;
  final RemoveFromWishlist _removeFromWishlist;

  StreamSubscription<List<BuyJewelryEntity>>? _wishlistSubscription;

  BuyJewelryBloc(
    this._getJewelryList,
    this._getAllWishlist,
    this._watchWishlist,
    this._addToWishlist,
    this._removeFromWishlist,
  ) : super(const BuyJewelryState());

  Future<void> initState() async {
    // First, get snapshot of wishlist from local DB
    await _loadWishlistSnapshot();
    // Then subscribe to watch for future changes
    _subscribeToWishlist();
    // Finally, fetch jewelry list from API
    _fetchBuyJewelryList();
  }

  @override
  Future<void> close() {
    _wishlistSubscription?.cancel();
    return super.close();
  }

  Future<void> _loadWishlistSnapshot() async {
    try {
      final wishlist = await _getAllWishlist.call();
      emit(state.copyWith(buyJewelryWishList: wishlist));
    } catch (_) {
      emit(state.copyWith(buyJewelryWishList: []));
    }
  }

  void _subscribeToWishlist() {
    _wishlistSubscription = _watchWishlist.call().listen((wishlist) {
      emit(state.copyWith(buyJewelryWishList: wishlist));
      _updateFavoritesFromWishlist(wishlist);
    });
  }

  void _updateFavoritesFromWishlist(List<BuyJewelryEntity> wishlist) {
    if (state.buyJewelryListOriginal.isEmpty) return;

    final wishlistIds = wishlist.map((e) => e.id).toSet();

    final updatedOriginal = state.buyJewelryListOriginal.map((jewelry) {
      return jewelry.copyWith(isFavorite: wishlistIds.contains(jewelry.id));
    }).toList();

    final updatedList = state.buyJewelryList.map((jewelry) {
      return jewelry.copyWith(isFavorite: wishlistIds.contains(jewelry.id));
    }).toList();

    emit(
      state.copyWith(
        buyJewelryList: updatedList,
        buyJewelryListOriginal: updatedOriginal,
      ),
    );
  }

  Future<void> _fetchBuyJewelryList() async {
    emit(
      state.copyWith(
        screenStatus: BuyJewelryScreenStatus.loading,
        errorMessage: () => null,
      ),
    );

    try {
      final jewelryList = await _getJewelryList.call();

      // Merge with wishlist to mark favorites
      final wishlistIds = state.buyJewelryWishList.map((e) => e.id).toSet();
      final mergedList = jewelryList.map((jewelry) {
        return jewelry.copyWith(isFavorite: wishlistIds.contains(jewelry.id));
      }).toList();

      // Apply default sorting
      final sortedList = _sortList(mergedList, state.sortBy);

      emit(
        state.copyWith(
          buyJewelryList: sortedList,
          buyJewelryListOriginal: mergedList,
          screenStatus: BuyJewelryScreenStatus.success,
          errorMessage: () => null,
        ),
      );
    } catch (e) {
      // Even on error, show success if wishlist has items (offline mode)
      if (state.buyJewelryWishList.isNotEmpty) {
        emit(
          state.copyWith(
            screenStatus: BuyJewelryScreenStatus.success,
            errorMessage: () => null,
          ),
        );
      } else {
        emit(
          state.copyWith(
            screenStatus: BuyJewelryScreenStatus.error,
            errorMessage: () => _getErrorMessage(e),
          ),
        );
      }
    }
  }

  Future<void> retry() async {
    await _fetchBuyJewelryList();
  }

  Future<void> toggleFavorite(int index) async {
    final displayList = state.displayList;
    if (index >= displayList.length) return;

    final item = displayList[index];
    final isAdding = !item.isFavorite;

    // UI is updated locally in BuyJewelryCard via setState
    // State will be synced via _updateFavoritesFromWishlist when DB watch triggers

    try {
      if (isAdding) {
        await _addToWishlist.call(item.copyWith(isFavorite: true));
      } else {
        await _removeFromWishlist.call(item.id);
      }
    } catch (_) {
      // On error, the watch subscription will restore correct state
    }
  }

  void selectTab(BuyJewelryTab tab) {
    emit(state.copyWith(selectedTab: tab));
  }

  Future<void> toggleFavoriteInWishlist(String itemId) async {
    // UI is updated locally in BuyJewelryCard via setState
    // State will be synced via _subscribeToWishlist when DB watch triggers

    try {
      await _removeFromWishlist.call(itemId);
    } catch (_) {
      // On error, the watch subscription will restore correct state
    }
  }

  void applyFilters(BuyJewelryFilterState filterState) {
    var filteredList = List<BuyJewelryEntity>.from(
      state.buyJewelryListOriginal,
    );

    // Filter by favorites
    if (filterState.showFavoritesOnly) {
      filteredList = filteredList.where((item) => item.isFavorite).toList();
    }

    // Filter by price range
    filteredList = _filterByPriceRange(filteredList, filterState.priceRange);

    // Filter by category
    filteredList = _filterByCategory(filteredList, filterState.category);

    // Sort with current sort state
    filteredList = _sortList(filteredList, state.sortBy);

    emit(
      state.copyWith(buyJewelryList: filteredList, filterState: filterState),
    );
  }

  void applySorting(SortBy sortBy) {
    final sortedList = _sortList(state.buyJewelryList, sortBy);
    emit(state.copyWith(buyJewelryList: sortedList, sortBy: sortBy));
  }

  List<BuyJewelryEntity> _filterByPriceRange(
    List<BuyJewelryEntity> list,
    PriceRange range,
  ) {
    switch (range) {
      case PriceRange.all:
        return list;
      case PriceRange.under10m:
        return list.where((item) => item.price < 10000000).toList();
      case PriceRange.from10mTo30m:
        return list
            .where((item) => item.price >= 10000000 && item.price < 30000000)
            .toList();
      case PriceRange.from30mTo50m:
        return list
            .where((item) => item.price >= 30000000 && item.price < 50000000)
            .toList();
      case PriceRange.above50m:
        return list.where((item) => item.price >= 50000000).toList();
    }
  }

  List<BuyJewelryEntity> _filterByCategory(
    List<BuyJewelryEntity> list,
    JewelryCategoryEnumEntity? category,
  ) {
    if (category == null) return list;
    return list.where((item) => item.category == category).toList();
  }

  List<BuyJewelryEntity> _sortList(List<BuyJewelryEntity> list, SortBy sortBy) {
    final sortedList = List<BuyJewelryEntity>.from(list);
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

  String _getErrorMessage(Object error) {
    if (error is NetworkException) {
      return AppStrings.networkError;
    }
    return AppStrings.somethingWentWrong;
  }
}
