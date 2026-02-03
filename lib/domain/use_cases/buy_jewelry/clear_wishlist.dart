import '../../repositories/buy_jewelry/buy_jewelry_repository.dart';

class ClearWishlist {
  final BuyJewelryRepository _repository;

  ClearWishlist(this._repository);

  Future<void> call() {
    return _repository.clearWishlist();
  }
}
