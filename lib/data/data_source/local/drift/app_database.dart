import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'buy_jewelry/buy_jewelry_wishlist_table.dart';
import 'sell_jewelry/sell_jewelry_table.dart';

part 'app_database.g.dart';

/// See: https://drift.simonbinder.eu/setup/
@DriftDatabase(tables: [SellJewelryTable, BuyJewelryWishlistTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from < 2) {
            await migrator.createTable(buyJewelryWishlistTable);
          }
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'app_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
