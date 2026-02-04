import '../../../application/use_case/use_case.dart';
import '../../repositories/buy_jewelry/buy_jewelry_repository.dart';

class RemoveFromWishlist extends UseCase<void, String> {
  final BuyJewelryRepository _repository;

  const RemoveFromWishlist(this._repository);

  @override
  Future<void> call(String params) {
    return _repository.removeFromWishlist(params);
  }
}
