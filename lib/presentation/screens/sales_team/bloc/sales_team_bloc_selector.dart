import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/sales_team/sales_person_entity.dart';
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
    extends BlocSelector<SalesTeamBloc, SalesTeamState, List<SalesPersonEntity>> {
  SalesTeamListSelector({
    super.key,
    required Widget Function(List<SalesPersonEntity>) builder,
  }) : super(
          selector: (state) => state.salesTeam,
          builder: (_, salesTeamList) => builder(salesTeamList),
        );
}

class SalesTeamPaginationSelector
    extends BlocSelector<SalesTeamBloc, SalesTeamState, ({bool hasMore, bool isLoadingMore})> {
  SalesTeamPaginationSelector({
    super.key,
    required Widget Function(bool hasMore, bool isLoadingMore) builder,
  }) : super(
          selector: (state) => (
            hasMore: state.hasMoreData,
            isLoadingMore: state.screenStatus == SalesTeamScreenStatus.loadingMore,
          ),
          builder: (_, data) => builder(data.hasMore, data.isLoadingMore),
        );
}
