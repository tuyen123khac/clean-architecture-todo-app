import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../../domain/use_cases/sell_jewelry/sync_sell_jewelry.dart';
import '../../../base_bloc/base_cubit.dart';
import 'global_background_state.dart';

class GlobalBackgroundBloc extends BaseCubit<GlobalBackgroundState> {
  final SyncSellJewelry _syncSellJewelry;
  final InternetConnection _internetConnection;

  Timer? _syncTimer;
  StreamSubscription<InternetStatus>? _connectivitySubscription;

  static const Duration _syncInterval = Duration(minutes: 1);

  GlobalBackgroundBloc(
    this._syncSellJewelry,
    this._internetConnection,
  ) : super(const GlobalBackgroundState());

  // ==================== Lifecycle ====================

  void initState() {
    _startSyncTimer();
    _subscribeToConnectivity();
    _checkInitialConnectivity();
  }

  @override
  Future<void> close() {
    _syncTimer?.cancel();
    _connectivitySubscription?.cancel();
    return super.close();
  }

  // ==================== Connectivity ====================

  Future<void> _checkInitialConnectivity() async {
    final isConnected = await _internetConnection.hasInternetAccess;
    emit(state.copyWith(isOnline: isConnected));

    if (isConnected) {
      // Initial sync on startup if online
      _performSync();
    }
  }

  void _subscribeToConnectivity() {
    _connectivitySubscription = _internetConnection.onStatusChange.listen(
      (status) {
        final isOnline = status == InternetStatus.connected;
        emit(state.copyWith(isOnline: isOnline));

        // Trigger sync when device comes online
        if (isOnline) {
          _performSync();
        }
      },
    );
  }

  // ==================== Sync Timer ====================

  void _startSyncTimer() {
    _syncTimer = Timer.periodic(_syncInterval, (_) {
      if (state.isOnline && state.syncStatus != SyncStatus.syncing) {
        _performSync();
      }
    });
  }

  // ==================== Sync Operations ====================

  /// Perform sync of all pending items
  Future<void> _performSync() async {
    if (state.syncStatus == SyncStatus.syncing) return;
    if (!state.isOnline) return;

    emit(state.copyWith(
      syncStatus: SyncStatus.syncing,
      lastSyncError: () => null,
    ));

    try {
      await _syncSellJewelry.syncAllPending();
      final remainingPending = await _syncSellJewelry.getPendingItems();

      emit(state.copyWith(
        syncStatus: SyncStatus.completed,
        pendingSyncCount: remainingPending.length,
        lastSyncError: () => null,
        lastSyncedAt: () => DateTime.now(),
      ));

      // Reset to idle after a short delay
      Future.delayed(const Duration(seconds: 2), () {
        if (!isClosed) {
          emit(state.copyWith(syncStatus: SyncStatus.idle));
        }
      });
    } catch (e) {
      emit(state.copyWith(
        syncStatus: SyncStatus.error,
        lastSyncError: () => e.toString(),
      ));

      // Reset to idle after error
      Future.delayed(const Duration(seconds: 5), () {
        if (!isClosed) {
          emit(state.copyWith(syncStatus: SyncStatus.idle));
        }
      });
    }
  }

  /// Trigger immediate sync (called after local DB update)
  void triggerSync() {
    if (state.isOnline) {
      _performSync();
    }
  }

  /// Update pending count (called from sell jewelry bloc)
  void updatePendingCount(int count) {
    emit(state.copyWith(pendingSyncCount: count));
  }
}
