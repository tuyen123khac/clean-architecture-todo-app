import 'api_client.dart';
import 'models/sell_transaction_dto.dart';

abstract class SellRemoteDataSource {
  Future<void> syncSellTransaction(SellTransactionDto dto);
}

class SellRemoteDataSourceImpl implements SellRemoteDataSource {
  final ApiClient apiClient;

  SellRemoteDataSourceImpl(this.apiClient);

  @override
  Future<void> syncSellTransaction(SellTransactionDto dto) async {
    await apiClient.dio.post<void>(
      '/sell-transactions',
      data: dto.toJson(),
    );
  }
}
