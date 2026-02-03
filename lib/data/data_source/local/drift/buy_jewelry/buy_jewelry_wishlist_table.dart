import 'package:drift/drift.dart';

class BuyJewelryWishlistTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  RealColumn get price => real()();
  RealColumn get originalPrice => real().nullable()();
  TextColumn get imageUrl => text()();
  TextColumn get weight => text().nullable()();
  TextColumn get size => text().nullable()();
  TextColumn get material => text().nullable()();
  IntColumn get stock => integer().withDefault(const Constant(0))();
  RealColumn get rating => real().withDefault(const Constant(0.0))();
  IntColumn get reviewCount => integer().withDefault(const Constant(0))();
  TextColumn get description => text().nullable()();
  TextColumn get features => text().withDefault(const Constant('[]'))();
  BoolColumn get isCertified => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
