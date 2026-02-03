import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/data/data_source/network/dio_client.dart';
import 'package:todo_app/data/data_source/network/models/sales_member/sales_member_dto.dart';

import 'endpoints/network_urls.dart';
import 'models/buy_jewelry/buy_jewelry_item_dto.dart';
import 'models/paginated_res_wrapper.dart';
import 'models/res_wrapper.dart';

part 'remote_data_source.g.dart';

@RestApi()
abstract class RemoteDataSource {
  factory RemoteDataSource(DioClient dio, {String baseUrl}) = _RemoteDataSource;

  @GET(NetworkUrls.salesTeam)
  Future<PaginatedResWrapper<List<SalesMemberDto>>> getSalesTeam({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('minAge') int? minAge,
    @Query('maxAge') int? maxAge,
    @Query('gender') String? gender,
  });

  @GET(NetworkUrls.jewelry)
  Future<ResWrapper<List<BuyJewelryItemDto>>> getJewelry();
}
