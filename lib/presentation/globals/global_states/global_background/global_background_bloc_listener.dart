import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'global_background_bloc.dart';
import 'global_background_state.dart';

class GlobalBackgroundBlocListener extends BlocListener<GlobalBackgroundBloc, GlobalBackgroundState> {
  const GlobalBackgroundBlocListener({
    super.key,
    required super.listener,
    super.child,
    super.listenWhen,
  });
}

/// Convenience widget that listens to sync status changes
class GlobalBackgroundSyncStatusListener extends StatelessWidget {
  final void Function(BuildContext context, SyncStatus status) onSyncStatusChanged;
  final Widget child;

  const GlobalBackgroundSyncStatusListener({
    super.key,
    required this.onSyncStatusChanged,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<GlobalBackgroundBloc, GlobalBackgroundState>(
      listenWhen: (previous, current) => previous.syncStatus != current.syncStatus,
      listener: (context, state) => onSyncStatusChanged(context, state.syncStatus),
      child: child,
    );
  }
}
