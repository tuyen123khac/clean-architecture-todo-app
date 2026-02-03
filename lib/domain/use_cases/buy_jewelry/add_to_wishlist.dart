import '../../entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../repositories/buy_jewelry/buy_jewelry_repository.dart';

class AddToWishlist {
  final BuyJewelryRepository _repository;

  AddToWishlist(this._repository);

  Future<void> call(BuyJewelryEntity jewelry) {
    return _repository.addToWishlist(jewelry);
  }
}
