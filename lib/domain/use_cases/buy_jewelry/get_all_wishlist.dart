import '../../../application/use_case/use_case.dart';
import '../../entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../repositories/buy_jewelry/buy_jewelry_repository.dart';

class GetAllWishlist extends UseCase<List<BuyJewelryEntity>, NoParams> {
  final BuyJewelryRepository _repository;

  const GetAllWishlist(this._repository);

  @override
  Future<List<BuyJewelryEntity>> call([NoParams? params]) {
    return _repository.getAllWishlist();
  }
}
