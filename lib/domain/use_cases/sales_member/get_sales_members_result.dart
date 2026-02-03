import '../../entities/sales_member/sales_member_entity.dart';

class GetSalesMembersResult {
  final List<SalesMemberEntity> data;
  final int total;
  final int page;
  final int limit;
  final bool hasMore;

  const GetSalesMembersResult({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
    required this.hasMore,
  });
}
