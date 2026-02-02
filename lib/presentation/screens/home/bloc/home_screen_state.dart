enum SyncState { none, syncing, synced, error }

class HomeScreenState {
  final DateTime? lastSyncTimestamp;

  HomeScreenState({this.lastSyncTimestamp});

  HomeScreenState copyWith({DateTime? lastSyncTimestamp}) {
    return HomeScreenState(
      lastSyncTimestamp: lastSyncTimestamp ?? this.lastSyncTimestamp,
    );
  }
}
