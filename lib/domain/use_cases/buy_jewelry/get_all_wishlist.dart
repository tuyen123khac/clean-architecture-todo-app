import '../../entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../repositories/buy_jewelry/buy_jewelry_repository.dart';

class GetAllWishlist {
  final BuyJewelryRepository _repository;

  GetAllWishlist(this._repository);

  Future<List<BuyJewelryEntity>> call() {
    return _repository.getAllWishlist();
  }
}
