import '../../entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../repositories/buy_jewelry/buy_jewelry_repository.dart';

class WatchWishlist {
  final BuyJewelryRepository _repository;

  WatchWishlist(this._repository);

  Stream<List<BuyJewelryEntity>> call() {
    return _repository.watchWishlist();
  }
}
