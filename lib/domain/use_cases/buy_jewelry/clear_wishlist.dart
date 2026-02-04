import '../../../application/use_case/use_case.dart';
import '../../repositories/buy_jewelry/buy_jewelry_repository.dart';

class ClearWishlist extends UseCase<void, NoParams> {
  final BuyJewelryRepository _repository;

  const ClearWishlist(this._repository);

  @override
  Future<void> call([NoParams? params]) {
    return _repository.clearWishlist();
  }
}
