import 'package:drift/drift.dart';

class SellJewelryTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  RealColumn get price => real()();
  TextColumn get imageUrl => text().nullable()();
  IntColumn get stock => integer().withDefault(const Constant(0))();
  TextColumn get weight => text().nullable()();
  TextColumn get size => text().nullable()();
  TextColumn get material => text().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
