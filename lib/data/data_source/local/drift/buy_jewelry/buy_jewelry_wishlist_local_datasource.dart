import 'package:drift/drift.dart';

import '../app_database.dart';

abstract class BuyJewelryWishlistLocalDatasource {

  MultiSelectable<BuyJewelryWishlistTableData> getAll();

  Future<void> add(Insertable<BuyJewelryWishlistTableData> row);

  Future<int> updateById(
    String id,
    BuyJewelryWishlistTableCompanion companion,
  );

  Future<int> deleteById(String id);

  Future<void> deleteAll();
}
