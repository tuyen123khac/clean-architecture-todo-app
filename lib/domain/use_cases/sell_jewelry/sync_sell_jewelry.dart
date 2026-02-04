import '../../entities/sell_jewelry/sell_jewelry_entity.dart';
import '../../repositories/sell_jewelry/sell_jewelry_repository.dart';

/// Use case for syncing pending sell jewelry items to the server.
class SyncSellJewelry {
  final SellJewelryRepository _repository;

  SyncSellJewelry(this._repository);

  /// Get all pending items that need to be synced
  Future<List<SellJewelryEntity>> getPendingItems() {
    return _repository.getPendingJewelry();
  }

  /// Sync a single item to server and handle post-sync logic
  /// - If stock = 0, delete the item after successful sync
  /// - Otherwise, mark as synced
  Future<void> syncItem(SellJewelryEntity entity) async {
    await _repository.syncToServer(entity);

    if (entity.stock <= 0) {
      // Delete items with 0 stock after successful sync
      await _repository.deleteJewelry(entity.id);
    } else {
      await _repository.markAsSynced(entity.id);
    }
  }

  /// Sync all pending items
  /// Returns the number of successfully synced items
  Future<int> syncAllPending() async {
    final pendingItems = await _repository.getPendingJewelry();
    int syncedCount = 0;

    for (final item in pendingItems) {
      try {
        await _repository.syncToServer(item);

        if (item.stock <= 0) {
          // Delete items with 0 stock after successful sync
          await _repository.deleteJewelry(item.id);
        } else {
          await _repository.markAsSynced(item.id);
        }

        syncedCount++;
      } catch (_) {
        // Continue with next item on failure
        // Will be retried on next sync cycle
      }
    }

    return syncedCount;
  }
}
