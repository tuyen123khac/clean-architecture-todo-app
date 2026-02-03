import 'package:drift/drift.dart';

import '../app_database.dart';
import 'buy_jewelry_wishlist_local_datasource.dart';

class BuyJewelryWishlistLocalDatasourceImpl
    implements BuyJewelryWishlistLocalDatasource {
  final AppDatabase _db;

  BuyJewelryWishlistLocalDatasourceImpl(this._db);

  @override
  MultiSelectable<BuyJewelryWishlistTableData> getAll() {
    return _db.select(_db.buyJewelryWishlistTable);
  }

  @override
  Future<void> add(Insertable<BuyJewelryWishlistTableData> row) async {
    await _db.into(_db.buyJewelryWishlistTable).insert(
          row,
          mode: InsertMode.insertOrReplace,
        );
  }

  @override
  Future<int> updateById(
    String id,
    BuyJewelryWishlistTableCompanion companion,
  ) async {
    return (_db.update(_db.buyJewelryWishlistTable)
          ..where((t) => t.id.equals(id)))
        .write(companion);
  }

  @override
  Future<int> deleteById(String id) async {
    return (_db.delete(_db.buyJewelryWishlistTable)
          ..where((t) => t.id.equals(id)))
        .go();
  }

  @override
  Future<void> deleteAll() async {
    await _db.delete(_db.buyJewelryWishlistTable).go();
  }
}
