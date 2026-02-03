import '../../../application/use_case/use_case.dart';
import '../../../data/data_source/network/models/buy_jewelry/buy_jewelry_item_dto.dart';
import '../../repositories/buy_jewelry/buy_jewelry_repository.dart';
import '../../entities/buy_jewelry/buy_jewelry_entity.dart';

class GetJewelryList extends UseCase<List<BuyJewelryEntity>, void> {
  final BuyJewelryRepository _repository;

  const GetJewelryList(this._repository);

  @override
  Future<List<BuyJewelryEntity>> call([void params]) async {
    final response = await _repository.getJewelryList();
    return response.data.map((dto) => dto.toEntity()).toList();
  }
}
