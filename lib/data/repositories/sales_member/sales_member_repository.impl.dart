import 'package:todo_app/data/data_source/network/models/sales_member/sales_member_dto.dart';
import 'package:todo_app/data/data_source/network/remote_data_source.dart';

import '../../../domain/use_cases/sales_member/get_sales_members_params.dart';
import '../../data_source/network/exceptions/base_exception.dart';
import '../../data_source/network/models/paginated_res_wrapper.dart';
import '../../../domain/repositories/sales_member/sales_member_repository.dart';

class SalesMemberRepositoryImpl extends SalesMemberRepository {
  final RemoteDataSource _remoteDataSource;
  SalesMemberRepositoryImpl(this._remoteDataSource);

  @override
  Future<PaginatedResWrapper<List<SalesMemberDto>>> getSalesMembers(
    GetSalesMembersParams params,
  ) async {
    try {
      final response = await _remoteDataSource.getSalesTeam(
        page: params.page,
        limit: params.limit,
        minAge: params.minAge,
        maxAge: params.maxAge,
        gender: params.gender,
      );
      return response;
    } on BaseException {
      rethrow;
    } catch (e) {
      throw UnknownException(e);
    }
  }
}
