import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/sales_member/sales_member_entity.dart';
import 'sales_team_bloc.dart';
import 'sales_team_state.dart';

class SalesTeamStatusSelector
    extends BlocSelector<SalesTeamBloc, SalesTeamState, SalesTeamScreenStatus> {
  SalesTeamStatusSelector({
    super.key,
    required Widget Function(SalesTeamScreenStatus) builder,
  }) : super(
          selector: (state) => state.screenStatus,
          builder: (_, status) => builder(status),
        );
}

class SalesTeamListSelector
    extends BlocSelector<SalesTeamBloc, SalesTeamState, List<SalesMemberEntity>> {
  SalesTeamListSelector({
    super.key,
    required Widget Function(List<SalesMemberEntity>) builder,
  }) : super(
          selector: (state) => state.salesMembers,
          builder: (_, salesTeamList) => builder(salesTeamList),
        );
}

class SalesTeamTotalSelector
    extends BlocSelector<SalesTeamBloc, SalesTeamState, int> {
  SalesTeamTotalSelector({
    super.key,
    required Widget Function(int total) builder,
  }) : super(
          selector: (state) => state.total,
          builder: (_, total) => builder(total),
        );
}

class SalesTeamPaginationSelector extends BlocSelector<SalesTeamBloc,
    SalesTeamState,
    ({bool hasMore, bool isLoadingMore, bool loadMoreFailed, String? errorLoadMore})> {
  SalesTeamPaginationSelector({
    super.key,
    required Widget Function(
      bool hasMore,
      bool isLoadingMore,
      bool loadMoreFailed,
      String? errorLoadMore,
    ) builder,
  }) : super(
          selector: (state) => (
            hasMore: state.hasMoreData,
            isLoadingMore:
                state.screenStatus == SalesTeamScreenStatus.loadingMore,
            loadMoreFailed:
                state.screenStatus == SalesTeamScreenStatus.loadMoreFailed,
            errorLoadMore: state.errorLoadMore,
          ),
          builder: (_, data) => builder(
            data.hasMore,
            data.isLoadingMore,
            data.loadMoreFailed,
            data.errorLoadMore,
          ),
        );
}

class SalesTeamErrorSelector
    extends BlocSelector<SalesTeamBloc, SalesTeamState, String?> {
  SalesTeamErrorSelector({
    super.key,
    required Widget Function(String? errorMessage) builder,
  }) : super(
          selector: (state) => state.errorMessage,
          builder: (_, errorMessage) => builder(errorMessage),
        );
}
