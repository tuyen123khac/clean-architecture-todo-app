enum SyncStatus { idle, syncing, completed, error }

class GlobalBackgroundState {
  final bool isOnline;
  final SyncStatus syncStatus;
  final int pendingSyncCount;
  final String? lastSyncError;
  final DateTime? lastSyncedAt;

  const GlobalBackgroundState({
    this.isOnline = true,
    this.syncStatus = SyncStatus.idle,
    this.pendingSyncCount = 0,
    this.lastSyncError,
    this.lastSyncedAt,
  });

  GlobalBackgroundState copyWith({
    bool? isOnline,
    SyncStatus? syncStatus,
    int? pendingSyncCount,
    String? Function()? lastSyncError,
    DateTime? Function()? lastSyncedAt,
  }) {
    return GlobalBackgroundState(
      isOnline: isOnline ?? this.isOnline,
      syncStatus: syncStatus ?? this.syncStatus,
      pendingSyncCount: pendingSyncCount ?? this.pendingSyncCount,
      lastSyncError: lastSyncError != null ? lastSyncError() : this.lastSyncError,
      lastSyncedAt: lastSyncedAt != null ? lastSyncedAt() : this.lastSyncedAt,
    );
  }
}
