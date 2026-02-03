import '../../../application/use_case/use_case.dart';
import '../../repositories/sell_jewelry/sell_jewelry_repository.dart';

class DeleteAllSellJewelry extends UseCase<void, NoParams> {
  final SellJewelryRepository _repository;

  const DeleteAllSellJewelry(this._repository);

  @override
  Future<void> call(NoParams params) async {
    await _repository.deleteAllJewelry();
  }
}
