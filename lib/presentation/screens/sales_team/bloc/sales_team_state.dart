import '../../../../domain/entities/sales_member/sales_member_entity.dart';
import '../widgets/sales_team_filter_bottom_sheet.dart';

enum SalesTeamScreenStatus {
  initial,
  loading,
  loadingMore,
  loadMoreFailed,
  success,
  error,
}

class SalesTeamState {
  final List<SalesMemberEntity> salesMembers;
  final SalesTeamScreenStatus screenStatus;
  final SalesTeamFilterState filterState;
  final int currentPage;
  final int itemsPerPage;
  final int total;
  final bool hasMoreData;
  final String? errorMessage;
  final String? errorLoadMore;

  const SalesTeamState({
    required this.salesMembers,
    this.screenStatus = SalesTeamScreenStatus.initial,
    this.filterState = const SalesTeamFilterState(),
    this.currentPage = 1,
    this.itemsPerPage = 5,
    this.total = 0,
    this.hasMoreData = true,
    this.errorMessage,
    this.errorLoadMore,
  });

  SalesTeamState copyWith({
    List<SalesMemberEntity>? salesMembers,
    SalesTeamScreenStatus? screenStatus,
    SalesTeamFilterState? filterState,
    int? currentPage,
    int? itemsPerPage,
    int? total,
    bool? hasMoreData,
    String? Function()? errorMessage,
    String? Function()? errorLoadMore,
  }) {
    return SalesTeamState(
      salesMembers: salesMembers ?? this.salesMembers,
      screenStatus: screenStatus ?? this.screenStatus,
      filterState: filterState ?? this.filterState,
      currentPage: currentPage ?? this.currentPage,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      total: total ?? this.total,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      errorLoadMore: errorLoadMore != null
          ? errorLoadMore()
          : this.errorLoadMore,
    );
  }
}
