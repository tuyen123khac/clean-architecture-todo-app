import '../../../../domain/entities/sales_team/sales_person_entity.dart';
import 'api_client.dart';
import 'models/person_dto.dart';

abstract class ToCallRemoteDataSource {
  Future<List<SalesPersonEntity>> fetchSalesTeam();
}

class ToCallRemoteDataSourceImpl implements ToCallRemoteDataSource {
  final ApiClient apiClient;

  ToCallRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<SalesPersonEntity>> fetchSalesTeam() async {
    final response = await apiClient.dio.get<Map<String, dynamic>>('/to-call');
    final data = response.data;
    if (data == null || data['data'] == null) return [];

    final List list = data['data'] as List;
    return list
        .map((e) => PersonDto.fromJson(Map<String, dynamic>.from(e as Map)))
        .map(_toEntity)
        .toList();
  }

  SalesPersonEntity _toEntity(PersonDto dto) {
    return SalesPersonEntity(
      id: dto.id,
      name: dto.name,
      phone: dto.phoneNumber,
      age: 0,
      gender: Gender.other,
      description: dto.job,
      imageUrl: '',
    );
  }
}
