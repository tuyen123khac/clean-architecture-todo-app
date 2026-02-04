import '../../../application/use_case/use_case.dart';
import '../../entities/sell_jewelry/sell_jewelry_entity.dart';
import '../../repositories/sell_jewelry/sell_jewelry_repository.dart';

class GetPendingSellJewelry
    extends UseCase<List<SellJewelryEntity>, NoParams> {
  final SellJewelryRepository _repository;

  const GetPendingSellJewelry(this._repository);

  @override
  Future<List<SellJewelryEntity>> call([NoParams? params]) {
    return _repository.getPendingJewelry();
  }
}
