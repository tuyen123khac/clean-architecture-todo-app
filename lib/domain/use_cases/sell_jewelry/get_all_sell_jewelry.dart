import '../../../application/use_case/use_case.dart';
import '../../repositories/sell_jewelry/sell_jewelry_repository.dart';
import '../../entities/sell_jewelry/sell_jewelry_entity.dart';

class GetAllSellJewelry extends UseCase<List<SellJewelryEntity>, NoParams> {
  final SellJewelryRepository _repository;

  const GetAllSellJewelry(this._repository);

  @override
  Future<List<SellJewelryEntity>> call([NoParams? params]) async {
    return _repository.getAllJewelry();
  }
}
