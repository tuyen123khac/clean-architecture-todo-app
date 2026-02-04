import 'package:drift/drift.dart';

import '../../data_source/local/drift/app_database.dart';
import '../../data_source/local/drift/sell_jewelry/sell_jewelry_local_datasource.dart';
import '../../data_source/network/models/sell_jewelry/sell_jewelry_sync_request_dto.dart';
import '../../data_source/network/remote_data_source.dart';
import '../../../domain/entities/buy_jewelry/jewelry_category_enum_entity.dart';
import '../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';
import '../../../domain/repositories/sell_jewelry/sell_jewelry_repository.dart';

class SellJewelryRepositoryImpl implements SellJewelryRepository {
  final SellJewelryLocalDatasource _localDatasource;
  final RemoteDataSource _remoteDataSource;

  SellJewelryRepositoryImpl(this._localDatasource, this._remoteDataSource);

  static SellJewelryEntity _rowToEntity(SellJewelryTableData row) {
    return SellJewelryEntity(
      id: row.id,
      name: row.name,
      category: JewelryCategoryEnumEntity.fromString(row.category),
      price: row.price,
      imageUrl: row.imageUrl,
      stock: row.stock,
      quantityToSell: 0, // In-memory state only, not persisted
      weight: row.weight,
      size: row.size,
      material: row.material,
      syncStatus: SellJewelrySyncStatus.values.firstWhere(
        (e) => e.name == row.syncStatus,
        orElse: () => SellJewelrySyncStatus.synced,
      ),
      createdAt: row.createdAt,
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
      weight: Value(e.weight),
      size: Value(e.size),
      material: Value(e.material),
      syncStatus: Value(e.syncStatus.name),
      createdAt: Value(e.createdAt),
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

  // ==================== Sync Operations ====================

  @override
  Future<List<SellJewelryEntity>> getPendingJewelry() async {
    final rows = await _localDatasource.getPendingSyncItems();
    return rows.map(_rowToEntity).toList();
  }

  @override
  Future<void> syncToServer(SellJewelryEntity entity) async {
    final request = SellJewelrySyncRequestDto(
      id: entity.id,
      name: entity.name,
      category: entity.category.name,
      price: entity.price,
      stock: entity.stock,
    );
    await _remoteDataSource.syncSellJewelry(request);
  }

  @override
  Future<void> markAsSynced(String id) async {
    await _localDatasource.markAsSynced(id);
  }
}
