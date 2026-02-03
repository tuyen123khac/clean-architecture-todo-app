import '../../../application/use_case/use_case.dart';
import '../../repositories/sell_jewelry/sell_jewelry_repository.dart';

class DeleteSellJewelry extends UseCase<void, String> {
  final SellJewelryRepository _repository;

  const DeleteSellJewelry(this._repository);

  @override
  Future<void> call(String id) async {
    await _repository.deleteJewelry(id);
  }
}
