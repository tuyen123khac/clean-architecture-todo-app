import '../../../application/use_case/use_case.dart';
import '../../repositories/sell_jewelry/sell_jewelry_repository.dart';
import '../../entities/sell_jewelry/sell_jewelry_entity.dart';

class AddSellJewelryParams {
  final SellJewelryEntity entity;
  final int quantity;

  const AddSellJewelryParams({
    required this.entity,
    required this.quantity,
  });
}

class AddSellJewelry extends UseCase<void, AddSellJewelryParams> {
  final SellJewelryRepository _repository;

  const AddSellJewelry(this._repository);

  @override
  Future<void> call(AddSellJewelryParams params) async {
    await _repository.upsertJewelry(params.entity, quantity: params.quantity);
  }
}
