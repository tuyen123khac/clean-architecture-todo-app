import 'package:todo_app/presentation/base_bloc/base_cubit.dart';

import '../../../../application/resource/strings/app_strings.dart';
import '../../../../data/data_source/network/exceptions/base_exception.dart';
import '../../../../domain/use_cases/sales_member/get_sales_members.dart';
import '../../../../domain/use_cases/sales_member/get_sales_members_params.dart';
import '../widgets/sales_team_filter_bottom_sheet.dart';
import 'sales_team_state.dart';

class SalesTeamBloc extends BaseCubit<SalesTeamState> {
  final GetSalesMembers _getSalesMembers;

  SalesTeamBloc(this._getSalesMembers)
      : super(const SalesTeamState(salesMembers: []));

  void initState() {
    _initSalesMembers();
  }

  Future<void> _initSalesMembers() async {
    emit(state.copyWith(
      screenStatus: SalesTeamScreenStatus.loading,
      errorMessage: () => null,
      errorLoadMore: () => null,
    ));

    try {
      final params = _buildParams(page: 1);
      final result = await _getSalesMembers.call(params);

      emit(state.copyWith(
        salesMembers: result.data,
        screenStatus: SalesTeamScreenStatus.success,
        currentPage: result.page,
        total: result.total,
        hasMoreData: result.hasMore,
        errorMessage: () => null,
      ));
    } catch (e) {
      emit(state.copyWith(
        screenStatus: SalesTeamScreenStatus.error,
        errorMessage: () => _getErrorMessage(e),
      ));
    }
  }

  Future<void> retry() async {
    await _initSalesMembers();
  }

  Future<void> loadMore() async {
    if (!state.hasMoreData ||
        state.screenStatus == SalesTeamScreenStatus.loadingMore) {
      return;
    }

    emit(state.copyWith(
      screenStatus: SalesTeamScreenStatus.loadingMore,
      errorLoadMore: () => null,
    ));

    try {
      final nextPage = state.currentPage + 1;
      final params = _buildParams(page: nextPage);
      final result = await _getSalesMembers.call(params);

      emit(state.copyWith(
        salesMembers: [...state.salesMembers, ...result.data],
        screenStatus: SalesTeamScreenStatus.success,
        currentPage: result.page,
        total: result.total,
        hasMoreData: result.hasMore,
        errorLoadMore: () => null,
      ));
    } catch (e) {
      emit(state.copyWith(
        screenStatus: SalesTeamScreenStatus.loadMoreFailed,
        errorLoadMore: () => _getErrorMessage(e),
      ));
    }
  }

  Future<void> retryLoadMore() async {
    await loadMore();
  }

  Future<void> applyFilters(SalesTeamFilterState filterState) async {
    emit(state.copyWith(
      screenStatus: SalesTeamScreenStatus.loading,
      filterState: filterState,
      errorMessage: () => null,
      errorLoadMore: () => null,
    ));

    try {
      final params = _buildParams(page: 1, filterState: filterState);
      final result = await _getSalesMembers.call(params);

      emit(state.copyWith(
        salesMembers: result.data,
        screenStatus: SalesTeamScreenStatus.success,
        currentPage: result.page,
        total: result.total,
        hasMoreData: result.hasMore,
        errorMessage: () => null,
      ));
    } catch (e) {
      emit(state.copyWith(
        screenStatus: SalesTeamScreenStatus.error,
        errorMessage: () => _getErrorMessage(e),
      ));
    }
  }

  String _getErrorMessage(Object error) {
    if (error is NetworkException) {
      return AppStrings.networkError;
    }
    return AppStrings.somethingWentWrong;
  }

  GetSalesMembersParams _buildParams({
    required int page,
    SalesTeamFilterState? filterState,
  }) {
    final filter = filterState ?? state.filterState;

    return GetSalesMembersParams(
      page: page,
      limit: state.itemsPerPage,
      minAge: filter.ageRange.start.round(),
      maxAge: filter.ageRange.end.round(),
      gender: filter.gender?.name,
    );
  }
}
