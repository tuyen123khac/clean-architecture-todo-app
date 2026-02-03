import 'dart:async';

import '../../../application/use_case/use_case.dart';
import '../../../data/data_source/network/models/sales_member/sales_member_dto.dart';
import '../../repositories/sales_member/sales_member_repository.dart';
import 'get_sales_members_params.dart';
import 'get_sales_members_result.dart';

class GetSalesMembers extends UseCase<GetSalesMembersResult, GetSalesMembersParams> {
  final SalesMemberRepository _repository;

  const GetSalesMembers(this._repository);

  @override
  Future<GetSalesMembersResult> call(GetSalesMembersParams params) async {
    final response = await _repository.getSalesMembers(params);
    return GetSalesMembersResult(
      data: response.data.map((e) => e.toEntity()).toList(),
      total: response.total,
      page: response.page,
      limit: response.limit,
      hasMore: response.hasMore,
    );
  }
}
