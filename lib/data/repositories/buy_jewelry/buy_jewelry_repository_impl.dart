import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../domain/entities/buy_jewelry/jewelry_category_enum_entity.dart';
import '../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';
import '../../data_source/local/drift/app_database.dart';
import '../../data_source/local/drift/buy_jewelry/buy_jewelry_wishlist_local_datasource.dart';
import '../../data_source/network/exceptions/base_exception.dart';
import '../../data_source/network/models/buy_jewelry/buy_jewelry_item_dto.dart';
import '../../data_source/network/models/res_wrapper.dart';
import '../../data_source/network/remote_data_source.dart';
import '../../../domain/repositories/buy_jewelry/buy_jewelry_repository.dart';

class BuyJewelryRepositoryImpl implements BuyJewelryRepository {
  final RemoteDataSource _remoteDataSource;
  final BuyJewelryWishlistLocalDatasource _wishlistLocalDatasource;

  BuyJewelryRepositoryImpl(this._remoteDataSource, this._wishlistLocalDatasource);

  @override
  Future<ResWrapper<List<BuyJewelryItemDto>>> getJewelryList() async {
    try {
      return await _remoteDataSource.getJewelry();
    } on BaseException {
      rethrow;
    } catch (e) {
      throw UnknownException(e);
    }
  }

  @override
  Future<List<BuyJewelryEntity>> getAllWishlist() async {
    final rows = await _wishlistLocalDatasource.getAll().get();
    return rows.map(_mapTableDataToEntity).toList();
  }

  @override
  Stream<List<BuyJewelryEntity>> watchWishlist() {
    return _wishlistLocalDatasource.getAll().watch().map((rows) {
      return rows.map(_mapTableDataToEntity).toList();
    });
  }

  @override
  Future<void> addToWishlist(BuyJewelryEntity jewelry) async {
    final companion = _mapEntityToCompanion(jewelry);
    await _wishlistLocalDatasource.add(companion);
  }

  @override
  Future<void> removeFromWishlist(String id) async {
    await _wishlistLocalDatasource.deleteById(id);
  }

  @override
  Future<void> clearWishlist() async {
    await _wishlistLocalDatasource.deleteAll();
  }

  BuyJewelryEntity _mapTableDataToEntity(BuyJewelryWishlistTableData data) {
    return BuyJewelryEntity(
      id: data.id,
      name: data.name,
      category: JewelryCategoryEnumEntity.fromString(data.category),
      price: data.price,
      originalPrice: data.originalPrice,
      imageUrl: data.imageUrl,
      weight: data.weight,
      size: data.size,
      material: data.material,
      stock: data.stock,
      rating: data.rating,
      reviewCount: data.reviewCount,
      description: data.description,
      features: _decodeFeatures(data.features),
      isCertified: data.isCertified,
      isFavorite: true,
    );
  }

  BuyJewelryWishlistTableCompanion _mapEntityToCompanion(BuyJewelryEntity entity) {
    return BuyJewelryWishlistTableCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      category: Value(entity.category.name),
      price: Value(entity.price),
      originalPrice: Value(entity.originalPrice),
      imageUrl: Value(entity.imageUrl),
      weight: Value(entity.weight),
      size: Value(entity.size),
      material: Value(entity.material),
      stock: Value(entity.stock),
      rating: Value(entity.rating),
      reviewCount: Value(entity.reviewCount),
      description: Value(entity.description),
      features: Value(_encodeFeatures(entity.features)),
      isCertified: Value(entity.isCertified),
    );
  }

  String _encodeFeatures(List<String> features) {
    return jsonEncode(features);
  }

  List<String> _decodeFeatures(String featuresJson) {
    try {
      final decoded = jsonDecode(featuresJson);
      if (decoded is List) {
        return decoded.cast<String>();
      }
      return [];
    } catch (_) {
      return [];
    }
  }
}
