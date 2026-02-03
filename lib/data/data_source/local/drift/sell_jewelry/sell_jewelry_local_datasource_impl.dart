import 'package:drift/drift.dart';

import '../app_database.dart';
import 'sell_jewelry_local_datasource.dart';

/// Drift implementation of [SellJewelryLocalDatasource].
class SellJewelryLocalDatasourceImpl implements SellJewelryLocalDatasource {
  final AppDatabase _db;

  SellJewelryLocalDatasourceImpl(this._db);

  @override
  MultiSelectable<SellJewelryTableData> getAll() {
    return _db.select(_db.sellJewelryTable);
  }

  @override
  Future<SellJewelryTableData?> getById(String id) async {
    return (_db.select(_db.sellJewelryTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  @override
  Future<void> insert(Insertable<SellJewelryTableData> row) async {
    await _db.into(_db.sellJewelryTable).insert(row);
  }

  @override
  Future<void> upsert(
    Insertable<SellJewelryTableData> row, {
    required int additionalStock,
  }) async {
    final companion = row as SellJewelryTableCompanion;
    final id = companion.id.value;

    final existing = await getById(id);

    if (existing != null) {
      await (_db.update(_db.sellJewelryTable)..where((t) => t.id.equals(id)))
          .write(
        SellJewelryTableCompanion(
          stock: Value(existing.stock + additionalStock),
        ),
      );
    } else {
      await _db.into(_db.sellJewelryTable).insert(
            row,
            mode: InsertMode.insertOrReplace,
          );
    }
  }

  @override
  Future<int> updateById(
    String id,
    SellJewelryTableCompanion companion,
  ) async {
    return (_db.update(_db.sellJewelryTable)..where((t) => t.id.equals(id)))
        .write(companion);
  }

  @override
  Future<int> deleteById(String id) async {
    return (_db.delete(_db.sellJewelryTable)..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Future<void> deleteAll() async {
    await _db.delete(_db.sellJewelryTable).go();
  }
}
