import '../../../application/use_case/use_case.dart';
import '../../entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../repositories/buy_jewelry/buy_jewelry_repository.dart';

class WatchWishlist extends StreamUseCase<List<BuyJewelryEntity>, NoParams> {
  final BuyJewelryRepository _repository;

  const WatchWishlist(this._repository);

  @override
  Stream<List<BuyJewelryEntity>> call([NoParams? params]) {
    return _repository.watchWishlist();
  }
}
