import '../../repositories/buy_jewelry/buy_jewelry_repository.dart';

class RemoveFromWishlist {
  final BuyJewelryRepository _repository;

  RemoveFromWishlist(this._repository);

  Future<void> call(String id) {
    return _repository.removeFromWishlist(id);
  }
}
