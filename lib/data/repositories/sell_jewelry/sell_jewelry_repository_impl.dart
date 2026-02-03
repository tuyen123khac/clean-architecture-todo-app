import 'package:drift/drift.dart';

import '../../data_source/local/drift/app_database.dart';
import '../../data_source/local/drift/sell_jewelry/sell_jewelry_local_datasource.dart';
import '../../../domain/entities/buy_jewelry/jewelry_category_enum_entity.dart';
import '../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';
import '../../../domain/repositories/sell_jewelry/sell_jewelry_repository.dart';

class SellJewelryRepositoryImpl implements SellJewelryRepository {
  final SellJewelryLocalDatasource _localDatasource;

  SellJewelryRepositoryImpl(this._localDatasource);

  static SellJewelryEntity _rowToEntity(SellJewelryTableData row) {
    return SellJewelryEntity(
      id: row.id,
      name: row.name,
      category: JewelryCategoryEnumEntity.fromString(row.category),
      price: row.price,
      imageUrl: row.imageUrl,
      stock: row.stock,
      quantityToSell: row.quantityToSell,
      weight: row.weight,
      size: row.size,
      material: row.material,
      syncStatus: SellJewelrySyncStatus.values.firstWhere(
        (e) => e.name == row.syncStatus,
        orElse: () => SellJewelrySyncStatus.synced,
      ),
    );
  }

  static SellJewelryTableCompanion _entityToCompanion(SellJewelryEntity e) {
    return SellJewelryTableCompanion.insert(
      id: e.id,
      name: e.name,
      category: e.category.name,
      price: e.price,
      imageUrl: Value(e.imageUrl),
      stock: Value(e.stock),
      quantityToSell: Value(e.quantityToSell),
      weight: Value(e.weight),
      size: Value(e.size),
      material: Value(e.material),
      syncStatus: Value(e.syncStatus.name),
    );
  }

  @override
  Future<List<SellJewelryEntity>> getAllJewelry() async {
    final rows = await _localDatasource.getAll().get();
    return rows.map(_rowToEntity).toList();
  }

  @override
  Stream<List<SellJewelryEntity>> watchAllJewelry() {
    return _localDatasource.getAll().watch().map((rows) {
      return rows.map(_rowToEntity).toList();
    });
  }

  @override
  Future<void> addJewelry(SellJewelryEntity entity) async {
    await _localDatasource.insert(_entityToCompanion(entity));
  }

  @override
  Future<void> upsertJewelry(
    SellJewelryEntity entity, {
    required int quantity,
  }) async {
    await _localDatasource.upsert(
      _entityToCompanion(entity),
      additionalStock: quantity,
    );
  }

  @override
  Future<void> updateJewelry(SellJewelryEntity entity) async {
    await _localDatasource.updateById(
      entity.id,
      SellJewelryTableCompanion(
        name: Value(entity.name),
        category: Value(entity.category.name),
        price: Value(entity.price),
        imageUrl: Value(entity.imageUrl),
        stock: Value(entity.stock),
        quantityToSell: Value(entity.quantityToSell),
        weight: Value(entity.weight),
        size: Value(entity.size),
        material: Value(entity.material),
        syncStatus: Value(entity.syncStatus.name),
      ),
    );
  }

  @override
  Future<void> deleteJewelry(String id) async {
    await _localDatasource.deleteById(id);
  }

  @override
  Future<void> deleteAllJewelry() async {
    await _localDatasource.deleteAll();
  }
}
