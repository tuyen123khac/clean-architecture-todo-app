import '../../../../domain/entities/buy_jewelry/jewelry_entity.dart';
import 'api_client.dart';
import 'models/jewelry_item_dto.dart';

abstract class JewelryRemoteDataSource {
  Future<List<JewelryEntity>> fetchJewelryCatalog();
}

class JewelryRemoteDataSourceImpl implements JewelryRemoteDataSource {
  final ApiClient apiClient;

  JewelryRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<JewelryEntity>> fetchJewelryCatalog() async {
    final response =
        await apiClient.dio.get<Map<String, dynamic>>('/jewelry');
    final data = response.data;
    if (data == null || data['data'] == null) return [];

    final List list = data['data'] as List;
    return list
        .map((e) =>
            JewelryItemDto.fromJson(Map<String, dynamic>.from(e as Map)))
        .map(_toEntity)
        .toList();
  }

  JewelryEntity _toEntity(JewelryItemDto dto) {
    return JewelryEntity(
      id: dto.id,
      name: dto.name,
      category: dto.category,
      material: '',
      price: dto.price.toDouble(),
      imageUrl: '',
      isFavorite: false,
    );
  }
}
