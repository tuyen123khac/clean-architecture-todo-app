import '../../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';
import '../../../../domain/use_cases/buy_jewelry/add_to_wishlist.dart';
import '../../../../domain/use_cases/buy_jewelry/remove_from_wishlist.dart';
import '../../../../domain/use_cases/sell_jewelry/add_sell_jewelry.dart';
import '../../../base_bloc/base_cubit.dart';
import 'jewelry_detail_state.dart';

class JewelryDetailBloc extends BaseCubit<JewelryDetailState> {
  final AddToWishlist _addToWishlist;
  final RemoveFromWishlist _removeFromWishlist;
  final AddSellJewelry _addSellJewelry;

  JewelryDetailBloc(
    this._addToWishlist,
    this._removeFromWishlist,
    this._addSellJewelry,
  ) : super(const JewelryDetailState());

  void initState(BuyJewelryEntity jewelry) {
    emit(state.copyWith(
      jewelry: () => jewelry,
      isFavorite: jewelry.isFavorite,
    ));
  }

  Future<void> toggleFavorite() async {
    final jewelry = state.jewelry;
    if (jewelry == null) return;

    final newFavoriteState = !state.isFavorite;
    emit(state.copyWith(isFavorite: newFavoriteState));

    try {
      if (newFavoriteState) {
        await _addToWishlist.call(jewelry.copyWith(isFavorite: true));
      } else {
        await _removeFromWishlist.call(jewelry.id);
      }
    } catch (_) {
      // Revert on error
      emit(state.copyWith(isFavorite: !newFavoriteState));
    }
  }

  void incrementQuantity() {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  void decrementQuantity() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  void updateAppBarScroll(double scrollOffset, double expandedHeight) {
    final collapseRange = expandedHeight - 56.0;
    if (collapseRange <= 0) return;
    final opacity = (scrollOffset / collapseRange).clamp(0.0, 1.0);
    if (opacity != state.appBarTitleOpacity) {
      emit(state.copyWith(appBarTitleOpacity: opacity));
    }
  }

  Future<bool> purchaseJewelry(int quantity) async {
    final jewelry = state.jewelry;
    if (jewelry == null) return false;

    try {
      final sellJewelry = SellJewelryEntity(
        id: jewelry.id.toString(),
        name: jewelry.name,
        category: jewelry.category,
        price: jewelry.price,
        imageUrl: jewelry.imageUrl,
        stock: quantity,
        quantityToSell: 0,
        weight: jewelry.weight,
        size: jewelry.size,
        material: jewelry.material,
        syncStatus: SellJewelrySyncStatus.synced,
      );

      await _addSellJewelry.call(AddSellJewelryParams(
        entity: sellJewelry,
        quantity: quantity,
      ));

      // Remove from wishlist after successful purchase
      if (state.isFavorite) {
        await _removeFromWishlist.call(jewelry.id);
        emit(state.copyWith(isFavorite: false));
      }

      return true;
    } catch (_) {
      return false;
    }
  }
}
