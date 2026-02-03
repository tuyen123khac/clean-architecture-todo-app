import '../../entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../../data/data_source/network/models/buy_jewelry/buy_jewelry_item_dto.dart';
import '../../../data/data_source/network/models/res_wrapper.dart';

abstract class BuyJewelryRepository {
  // Network operations
  Future<ResWrapper<List<BuyJewelryItemDto>>> getJewelryList();

  // Wishlist local operations
  Future<List<BuyJewelryEntity>> getAllWishlist();
  Stream<List<BuyJewelryEntity>> watchWishlist();
  Future<void> addToWishlist(BuyJewelryEntity jewelry);
  Future<void> removeFromWishlist(String id);
  Future<void> clearWishlist();
}
