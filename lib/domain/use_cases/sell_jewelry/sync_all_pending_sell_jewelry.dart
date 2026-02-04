import '../../../application/use_case/use_case.dart';
import '../../repositories/sell_jewelry/sell_jewelry_repository.dart';

/// Use case for syncing all pending sell jewelry items to the server.
/// Returns the number of successfully synced items.
class SyncAllPendingSellJewelry extends UseCase<int, NoParams> {
  final SellJewelryRepository _repository;

  const SyncAllPendingSellJewelry(this._repository);

  @override
  Future<int> call([NoParams? params]) async {
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
