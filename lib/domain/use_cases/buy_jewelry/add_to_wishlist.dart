import '../../../application/use_case/use_case.dart';
import '../../entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../repositories/buy_jewelry/buy_jewelry_repository.dart';

class AddToWishlist extends UseCase<void, BuyJewelryEntity> {
  final BuyJewelryRepository _repository;

  const AddToWishlist(this._repository);

  @override
  Future<void> call(BuyJewelryEntity params) {
    return _repository.addToWishlist(params);
  }
}
