import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'global_background_bloc.dart';
import 'global_background_state.dart';

class GlobalBackgroundSyncStatusSelector
    extends BlocSelector<GlobalBackgroundBloc, GlobalBackgroundState, SyncStatus> {
  GlobalBackgroundSyncStatusSelector({
    super.key,
    required Widget Function(SyncStatus) builder,
  }) : super(
          selector: (state) => state.syncStatus,
          builder: (_, status) => builder(status),
        );
}

class GlobalBackgroundOnlineSelector
    extends BlocSelector<GlobalBackgroundBloc, GlobalBackgroundState, bool> {
  GlobalBackgroundOnlineSelector({
    super.key,
    required Widget Function(bool) builder,
  }) : super(
          selector: (state) => state.isOnline,
          builder: (_, isOnline) => builder(isOnline),
        );
}

class GlobalBackgroundPendingCountSelector
    extends BlocSelector<GlobalBackgroundBloc, GlobalBackgroundState, int> {
  GlobalBackgroundPendingCountSelector({
    super.key,
    required Widget Function(int) builder,
  }) : super(
          selector: (state) => state.pendingSyncCount,
          builder: (_, count) => builder(count),
        );
}

class GlobalBackgroundLastSyncedSelector
    extends BlocSelector<GlobalBackgroundBloc, GlobalBackgroundState, DateTime?> {
  GlobalBackgroundLastSyncedSelector({
    super.key,
    required Widget Function(DateTime?) builder,
  }) : super(
          selector: (state) => state.lastSyncedAt,
          builder: (_, lastSyncedAt) => builder(lastSyncedAt),
        );
}
