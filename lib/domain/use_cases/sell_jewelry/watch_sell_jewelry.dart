import '../../repositories/sell_jewelry/sell_jewelry_repository.dart';
import '../../entities/sell_jewelry/sell_jewelry_entity.dart';

class WatchSellJewelry {
  final SellJewelryRepository _repository;

  const WatchSellJewelry(this._repository);

  Stream<List<SellJewelryEntity>> call() {
    return _repository.watchAllJewelry();
  }
}
