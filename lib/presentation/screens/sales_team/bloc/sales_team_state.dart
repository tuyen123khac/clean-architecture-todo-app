import '../../../../domain/entities/sales_team/sales_person_entity.dart';
import '../widgets/sales_team_filter_bottom_sheet.dart';

enum SalesTeamScreenStatus { initial, loading, loadingMore, success, error }

class SalesTeamState {
  final List<SalesPersonEntity> salesTeam;
  final List<SalesPersonEntity> allSalesTeam;
  final SalesTeamScreenStatus screenStatus;
  final SalesTeamFilterState filterState;
  final int currentPage;
  final int itemsPerPage;
  final bool hasMoreData;

  SalesTeamState({
    required this.salesTeam,
    required this.allSalesTeam,
    this.screenStatus = SalesTeamScreenStatus.initial,
    this.filterState = const SalesTeamFilterState(),
    this.currentPage = 1,
    this.itemsPerPage = 5,
    this.hasMoreData = true,
  });

  SalesTeamState copyWith({
    List<SalesPersonEntity>? salesTeam,
    List<SalesPersonEntity>? allSalesTeam,
    SalesTeamScreenStatus? screenStatus,
    SalesTeamFilterState? filterState,
    int? currentPage,
    int? itemsPerPage,
    bool? hasMoreData,
  }) {
    return SalesTeamState(
      salesTeam: salesTeam ?? this.salesTeam,
      allSalesTeam: allSalesTeam ?? this.allSalesTeam,
      screenStatus: screenStatus ?? this.screenStatus,
      filterState: filterState ?? this.filterState,
      currentPage: currentPage ?? this.currentPage,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
      hasMoreData: hasMoreData ?? this.hasMoreData,
    );
  }
}
