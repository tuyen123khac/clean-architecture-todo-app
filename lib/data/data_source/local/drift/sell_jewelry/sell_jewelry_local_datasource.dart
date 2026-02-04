import 'package:drift/drift.dart';

import '../app_database.dart';

abstract class SellJewelryLocalDatasource {
  MultiSelectable<SellJewelryTableData> getAll();

  Future<SellJewelryTableData?> getById(String id);

  Future<void> insert(Insertable<SellJewelryTableData> row);

  Future<void> upsert(
    Insertable<SellJewelryTableData> row, {
    required int additionalStock,
  });

  Future<int> updateById(
    String id,
    SellJewelryTableCompanion companion,
  );

  Future<int> deleteById(String id);

  Future<void> deleteAll();

  /// Get all items with pending sync status
  Future<List<SellJewelryTableData>> getPendingSyncItems();

  /// Update sync status to synced
  Future<int> markAsSynced(String id);
}
