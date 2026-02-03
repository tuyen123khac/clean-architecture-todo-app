import '../../use_cases/sales_member/get_sales_members_params.dart';
import '../../../data/data_source/network/models/paginated_res_wrapper.dart';
import '../../../data/data_source/network/models/sales_member/sales_member_dto.dart';

abstract class SalesMemberRepository {
  Future<PaginatedResWrapper<List<SalesMemberDto>>> getSalesMembers(
    GetSalesMembersParams params,
  );
}
