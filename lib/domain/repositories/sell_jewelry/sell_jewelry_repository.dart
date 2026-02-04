import '../../entities/sell_jewelry/sell_jewelry_entity.dart';

abstract class SellJewelryRepository {
  // ==================== Local DB Operations ====================
  Future<List<SellJewelryEntity>> getAllJewelry();
  Stream<List<SellJewelryEntity>> watchAllJewelry();
  Future<void> addJewelry(SellJewelryEntity entity);
  Future<void> upsertJewelry(SellJewelryEntity entity, {required int quantity});
  Future<void> updateJewelry(SellJewelryEntity entity);
  Future<void> deleteJewelry(String id);
  Future<void> deleteAllJewelry();

  // ==================== Sync Operations ====================
  Future<List<SellJewelryEntity>> getPendingJewelry();
  Future<void> syncToServer(SellJewelryEntity entity);
  Future<void> markAsSynced(String id);
}
