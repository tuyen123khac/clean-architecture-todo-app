import 'package:todo_app/data/data_source/network/to_call_remote_data_source.dart';
import 'package:todo_app/presentation/base_bloc/base_cubit.dart';

import '../../../../domain/entities/sales_team/sales_person_entity.dart';
import '../widgets/sales_team_filter_bottom_sheet.dart';
import 'sales_team_state.dart';

class SalesTeamBloc extends BaseCubit<SalesTeamState> {
  SalesTeamBloc(this._toCallRemoteDataSource)
      : super(SalesTeamState(salesTeam: [], allSalesTeam: []));

  final ToCallRemoteDataSource _toCallRemoteDataSource;

  void initState() {
    fetchSalesTeam();
  }

  Future<void> fetchSalesTeam() async {
    emit(state.copyWith(screenStatus: SalesTeamScreenStatus.loading));

    try {
      final list = await _toCallRemoteDataSource.fetchSalesTeam();
      final paginatedData = list.take(state.itemsPerPage).toList();
      emit(state.copyWith(
        salesTeam: paginatedData,
        allSalesTeam: list,
        screenStatus: SalesTeamScreenStatus.success,
        currentPage: 1,
        hasMoreData: list.length > state.itemsPerPage,
      ));
    } catch (_) {
      emit(state.copyWith(screenStatus: SalesTeamScreenStatus.error));
    }
  }

  Future<void> loadMore() async {
    if (!state.hasMoreData ||
        state.screenStatus == SalesTeamScreenStatus.loadingMore) {
      return;
    }

    emit(state.copyWith(screenStatus: SalesTeamScreenStatus.loadingMore));

    await Future.delayed(const Duration(milliseconds: 500));

    final filteredList = _getFilteredList(state.allSalesTeam);
    final nextPage = state.currentPage + 1;
    final endIndex = nextPage * state.itemsPerPage;
    final hasMore = endIndex < filteredList.length;

    final paginatedData = filteredList.take(endIndex).toList();

    emit(state.copyWith(
      salesTeam: paginatedData,
      screenStatus: SalesTeamScreenStatus.success,
      currentPage: nextPage,
      hasMoreData: hasMore,
    ));
  }

  void applyFilters(SalesTeamFilterState filterState) {
    final filteredList = _getFilteredList(state.allSalesTeam, filterState);
    final paginatedData = filteredList.take(state.itemsPerPage).toList();

    emit(state.copyWith(
      salesTeam: paginatedData,
      filterState: filterState,
      currentPage: 1,
      hasMoreData: filteredList.length > state.itemsPerPage,
      screenStatus: SalesTeamScreenStatus.success,
    ));
  }

  List<SalesPersonEntity> _getFilteredList(
    List<SalesPersonEntity> list, [
    SalesTeamFilterState? filterState,
  ]) {
    final filter = filterState ?? state.filterState;
    var filteredList = List<SalesPersonEntity>.from(list);

    // Filter by age range
    filteredList = filteredList.where((person) {
      return person.age >= filter.ageRange.start &&
          person.age <= filter.ageRange.end;
    }).toList();

    // Filter by gender
    if (filter.gender != GenderFilter.all) {
      filteredList = filteredList.where((person) {
        if (filter.gender == GenderFilter.male) {
          return person.gender == Gender.male;
        } else {
          return person.gender == Gender.female;
        }
      }).toList();
    }

    return filteredList;
  }
}
