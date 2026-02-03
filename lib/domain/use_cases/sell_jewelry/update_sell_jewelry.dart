import '../../../application/use_case/use_case.dart';
import '../../repositories/sell_jewelry/sell_jewelry_repository.dart';
import '../../entities/sell_jewelry/sell_jewelry_entity.dart';

class UpdateSellJewelry extends UseCase<void, SellJewelryEntity> {
  final SellJewelryRepository _repository;

  const UpdateSellJewelry(this._repository);

  @override
  Future<void> call(SellJewelryEntity params) async {
    await _repository.updateJewelry(params);
  }
}
