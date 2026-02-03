// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SellJewelryTableTable extends SellJewelryTable
    with TableInfo<$SellJewelryTableTable, SellJewelryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SellJewelryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<String> weight = GeneratedColumn<String>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
    'size',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _materialMeta = const VerificationMeta(
    'material',
  );
  @override
  late final GeneratedColumn<String> material = GeneratedColumn<String>(
    'material',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('synced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    price,
    imageUrl,
    stock,
    weight,
    size,
    material,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sell_jewelry_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SellJewelryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('stock')) {
      context.handle(
        _stockMeta,
        stock.isAcceptableOrUnknown(data['stock']!, _stockMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    }
    if (data.containsKey('material')) {
      context.handle(
        _materialMeta,
        material.isAcceptableOrUnknown(data['material']!, _materialMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SellJewelryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SellJewelryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      stock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weight'],
      ),
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}size'],
      ),
      material: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $SellJewelryTableTable createAlias(String alias) {
    return $SellJewelryTableTable(attachedDatabase, alias);
  }
}

class SellJewelryTableData extends DataClass
    implements Insertable<SellJewelryTableData> {
  final String id;
  final String name;
  final String category;
  final double price;
  final String? imageUrl;
  final int stock;
  final String? weight;
  final String? size;
  final String? material;
  final String syncStatus;
  const SellJewelryTableData({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.imageUrl,
    required this.stock,
    this.weight,
    this.size,
    this.material,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['stock'] = Variable<int>(stock);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<String>(weight);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<String>(size);
    }
    if (!nullToAbsent || material != null) {
      map['material'] = Variable<String>(material);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  SellJewelryTableCompanion toCompanion(bool nullToAbsent) {
    return SellJewelryTableCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      price: Value(price),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      stock: Value(stock),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      material: material == null && nullToAbsent
          ? const Value.absent()
          : Value(material),
      syncStatus: Value(syncStatus),
    );
  }

  factory SellJewelryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SellJewelryTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      price: serializer.fromJson<double>(json['price']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      stock: serializer.fromJson<int>(json['stock']),
      weight: serializer.fromJson<String?>(json['weight']),
      size: serializer.fromJson<String?>(json['size']),
      material: serializer.fromJson<String?>(json['material']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'price': serializer.toJson<double>(price),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'stock': serializer.toJson<int>(stock),
      'weight': serializer.toJson<String?>(weight),
      'size': serializer.toJson<String?>(size),
      'material': serializer.toJson<String?>(material),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  SellJewelryTableData copyWith({
    String? id,
    String? name,
    String? category,
    double? price,
    Value<String?> imageUrl = const Value.absent(),
    int? stock,
    Value<String?> weight = const Value.absent(),
    Value<String?> size = const Value.absent(),
    Value<String?> material = const Value.absent(),
    String? syncStatus,
  }) => SellJewelryTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    price: price ?? this.price,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    stock: stock ?? this.stock,
    weight: weight.present ? weight.value : this.weight,
    size: size.present ? size.value : this.size,
    material: material.present ? material.value : this.material,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  SellJewelryTableData copyWithCompanion(SellJewelryTableCompanion data) {
    return SellJewelryTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      price: data.price.present ? data.price.value : this.price,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      stock: data.stock.present ? data.stock.value : this.stock,
      weight: data.weight.present ? data.weight.value : this.weight,
      size: data.size.present ? data.size.value : this.size,
      material: data.material.present ? data.material.value : this.material,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SellJewelryTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('stock: $stock, ')
          ..write('weight: $weight, ')
          ..write('size: $size, ')
          ..write('material: $material, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    category,
    price,
    imageUrl,
    stock,
    weight,
    size,
    material,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SellJewelryTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.price == this.price &&
          other.imageUrl == this.imageUrl &&
          other.stock == this.stock &&
          other.weight == this.weight &&
          other.size == this.size &&
          other.material == this.material &&
          other.syncStatus == this.syncStatus);
}

class SellJewelryTableCompanion extends UpdateCompanion<SellJewelryTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> category;
  final Value<double> price;
  final Value<String?> imageUrl;
  final Value<int> stock;
  final Value<String?> weight;
  final Value<String?> size;
  final Value<String?> material;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const SellJewelryTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.price = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.stock = const Value.absent(),
    this.weight = const Value.absent(),
    this.size = const Value.absent(),
    this.material = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SellJewelryTableCompanion.insert({
    required String id,
    required String name,
    required String category,
    required double price,
    this.imageUrl = const Value.absent(),
    this.stock = const Value.absent(),
    this.weight = const Value.absent(),
    this.size = const Value.absent(),
    this.material = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       price = Value(price);
  static Insertable<SellJewelryTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<double>? price,
    Expression<String>? imageUrl,
    Expression<int>? stock,
    Expression<String>? weight,
    Expression<String>? size,
    Expression<String>? material,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (price != null) 'price': price,
      if (imageUrl != null) 'image_url': imageUrl,
      if (stock != null) 'stock': stock,
      if (weight != null) 'weight': weight,
      if (size != null) 'size': size,
      if (material != null) 'material': material,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SellJewelryTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? category,
    Value<double>? price,
    Value<String?>? imageUrl,
    Value<int>? stock,
    Value<String?>? weight,
    Value<String?>? size,
    Value<String?>? material,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return SellJewelryTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      stock: stock ?? this.stock,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      material: material ?? this.material,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (weight.present) {
      map['weight'] = Variable<String>(weight.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (material.present) {
      map['material'] = Variable<String>(material.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SellJewelryTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('stock: $stock, ')
          ..write('weight: $weight, ')
          ..write('size: $size, ')
          ..write('material: $material, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BuyJewelryWishlistTableTable extends BuyJewelryWishlistTable
    with TableInfo<$BuyJewelryWishlistTableTable, BuyJewelryWishlistTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BuyJewelryWishlistTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originalPriceMeta = const VerificationMeta(
    'originalPrice',
  );
  @override
  late final GeneratedColumn<double> originalPrice = GeneratedColumn<double>(
    'original_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<String> weight = GeneratedColumn<String>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
    'size',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _materialMeta = const VerificationMeta(
    'material',
  );
  @override
  late final GeneratedColumn<String> material = GeneratedColumn<String>(
    'material',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _reviewCountMeta = const VerificationMeta(
    'reviewCount',
  );
  @override
  late final GeneratedColumn<int> reviewCount = GeneratedColumn<int>(
    'review_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _featuresMeta = const VerificationMeta(
    'features',
  );
  @override
  late final GeneratedColumn<String> features = GeneratedColumn<String>(
    'features',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _isCertifiedMeta = const VerificationMeta(
    'isCertified',
  );
  @override
  late final GeneratedColumn<bool> isCertified = GeneratedColumn<bool>(
    'is_certified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_certified" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    price,
    originalPrice,
    imageUrl,
    weight,
    size,
    material,
    stock,
    rating,
    reviewCount,
    description,
    features,
    isCertified,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buy_jewelry_wishlist_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<BuyJewelryWishlistTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('original_price')) {
      context.handle(
        _originalPriceMeta,
        originalPrice.isAcceptableOrUnknown(
          data['original_price']!,
          _originalPriceMeta,
        ),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    }
    if (data.containsKey('material')) {
      context.handle(
        _materialMeta,
        material.isAcceptableOrUnknown(data['material']!, _materialMeta),
      );
    }
    if (data.containsKey('stock')) {
      context.handle(
        _stockMeta,
        stock.isAcceptableOrUnknown(data['stock']!, _stockMeta),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('review_count')) {
      context.handle(
        _reviewCountMeta,
        reviewCount.isAcceptableOrUnknown(
          data['review_count']!,
          _reviewCountMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('features')) {
      context.handle(
        _featuresMeta,
        features.isAcceptableOrUnknown(data['features']!, _featuresMeta),
      );
    }
    if (data.containsKey('is_certified')) {
      context.handle(
        _isCertifiedMeta,
        isCertified.isAcceptableOrUnknown(
          data['is_certified']!,
          _isCertifiedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BuyJewelryWishlistTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BuyJewelryWishlistTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      originalPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}original_price'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weight'],
      ),
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}size'],
      ),
      material: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material'],
      ),
      stock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      reviewCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}review_count'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      features: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}features'],
      )!,
      isCertified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_certified'],
      )!,
    );
  }

  @override
  $BuyJewelryWishlistTableTable createAlias(String alias) {
    return $BuyJewelryWishlistTableTable(attachedDatabase, alias);
  }
}

class BuyJewelryWishlistTableData extends DataClass
    implements Insertable<BuyJewelryWishlistTableData> {
  final String id;
  final String name;
  final String category;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final String? weight;
  final String? size;
  final String? material;
  final int stock;
  final double rating;
  final int reviewCount;
  final String? description;
  final String features;
  final bool isCertified;
  const BuyJewelryWishlistTableData({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    this.weight,
    this.size,
    this.material,
    required this.stock,
    required this.rating,
    required this.reviewCount,
    this.description,
    required this.features,
    required this.isCertified,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || originalPrice != null) {
      map['original_price'] = Variable<double>(originalPrice);
    }
    map['image_url'] = Variable<String>(imageUrl);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<String>(weight);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<String>(size);
    }
    if (!nullToAbsent || material != null) {
      map['material'] = Variable<String>(material);
    }
    map['stock'] = Variable<int>(stock);
    map['rating'] = Variable<double>(rating);
    map['review_count'] = Variable<int>(reviewCount);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['features'] = Variable<String>(features);
    map['is_certified'] = Variable<bool>(isCertified);
    return map;
  }

  BuyJewelryWishlistTableCompanion toCompanion(bool nullToAbsent) {
    return BuyJewelryWishlistTableCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      price: Value(price),
      originalPrice: originalPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(originalPrice),
      imageUrl: Value(imageUrl),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      material: material == null && nullToAbsent
          ? const Value.absent()
          : Value(material),
      stock: Value(stock),
      rating: Value(rating),
      reviewCount: Value(reviewCount),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      features: Value(features),
      isCertified: Value(isCertified),
    );
  }

  factory BuyJewelryWishlistTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BuyJewelryWishlistTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      price: serializer.fromJson<double>(json['price']),
      originalPrice: serializer.fromJson<double?>(json['originalPrice']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      weight: serializer.fromJson<String?>(json['weight']),
      size: serializer.fromJson<String?>(json['size']),
      material: serializer.fromJson<String?>(json['material']),
      stock: serializer.fromJson<int>(json['stock']),
      rating: serializer.fromJson<double>(json['rating']),
      reviewCount: serializer.fromJson<int>(json['reviewCount']),
      description: serializer.fromJson<String?>(json['description']),
      features: serializer.fromJson<String>(json['features']),
      isCertified: serializer.fromJson<bool>(json['isCertified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'price': serializer.toJson<double>(price),
      'originalPrice': serializer.toJson<double?>(originalPrice),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'weight': serializer.toJson<String?>(weight),
      'size': serializer.toJson<String?>(size),
      'material': serializer.toJson<String?>(material),
      'stock': serializer.toJson<int>(stock),
      'rating': serializer.toJson<double>(rating),
      'reviewCount': serializer.toJson<int>(reviewCount),
      'description': serializer.toJson<String?>(description),
      'features': serializer.toJson<String>(features),
      'isCertified': serializer.toJson<bool>(isCertified),
    };
  }

  BuyJewelryWishlistTableData copyWith({
    String? id,
    String? name,
    String? category,
    double? price,
    Value<double?> originalPrice = const Value.absent(),
    String? imageUrl,
    Value<String?> weight = const Value.absent(),
    Value<String?> size = const Value.absent(),
    Value<String?> material = const Value.absent(),
    int? stock,
    double? rating,
    int? reviewCount,
    Value<String?> description = const Value.absent(),
    String? features,
    bool? isCertified,
  }) => BuyJewelryWishlistTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    price: price ?? this.price,
    originalPrice: originalPrice.present
        ? originalPrice.value
        : this.originalPrice,
    imageUrl: imageUrl ?? this.imageUrl,
    weight: weight.present ? weight.value : this.weight,
    size: size.present ? size.value : this.size,
    material: material.present ? material.value : this.material,
    stock: stock ?? this.stock,
    rating: rating ?? this.rating,
    reviewCount: reviewCount ?? this.reviewCount,
    description: description.present ? description.value : this.description,
    features: features ?? this.features,
    isCertified: isCertified ?? this.isCertified,
  );
  BuyJewelryWishlistTableData copyWithCompanion(
    BuyJewelryWishlistTableCompanion data,
  ) {
    return BuyJewelryWishlistTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      price: data.price.present ? data.price.value : this.price,
      originalPrice: data.originalPrice.present
          ? data.originalPrice.value
          : this.originalPrice,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      weight: data.weight.present ? data.weight.value : this.weight,
      size: data.size.present ? data.size.value : this.size,
      material: data.material.present ? data.material.value : this.material,
      stock: data.stock.present ? data.stock.value : this.stock,
      rating: data.rating.present ? data.rating.value : this.rating,
      reviewCount: data.reviewCount.present
          ? data.reviewCount.value
          : this.reviewCount,
      description: data.description.present
          ? data.description.value
          : this.description,
      features: data.features.present ? data.features.value : this.features,
      isCertified: data.isCertified.present
          ? data.isCertified.value
          : this.isCertified,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BuyJewelryWishlistTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('originalPrice: $originalPrice, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('weight: $weight, ')
          ..write('size: $size, ')
          ..write('material: $material, ')
          ..write('stock: $stock, ')
          ..write('rating: $rating, ')
          ..write('reviewCount: $reviewCount, ')
          ..write('description: $description, ')
          ..write('features: $features, ')
          ..write('isCertified: $isCertified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    category,
    price,
    originalPrice,
    imageUrl,
    weight,
    size,
    material,
    stock,
    rating,
    reviewCount,
    description,
    features,
    isCertified,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BuyJewelryWishlistTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.price == this.price &&
          other.originalPrice == this.originalPrice &&
          other.imageUrl == this.imageUrl &&
          other.weight == this.weight &&
          other.size == this.size &&
          other.material == this.material &&
          other.stock == this.stock &&
          other.rating == this.rating &&
          other.reviewCount == this.reviewCount &&
          other.description == this.description &&
          other.features == this.features &&
          other.isCertified == this.isCertified);
}

class BuyJewelryWishlistTableCompanion
    extends UpdateCompanion<BuyJewelryWishlistTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> category;
  final Value<double> price;
  final Value<double?> originalPrice;
  final Value<String> imageUrl;
  final Value<String?> weight;
  final Value<String?> size;
  final Value<String?> material;
  final Value<int> stock;
  final Value<double> rating;
  final Value<int> reviewCount;
  final Value<String?> description;
  final Value<String> features;
  final Value<bool> isCertified;
  final Value<int> rowid;
  const BuyJewelryWishlistTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.price = const Value.absent(),
    this.originalPrice = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.weight = const Value.absent(),
    this.size = const Value.absent(),
    this.material = const Value.absent(),
    this.stock = const Value.absent(),
    this.rating = const Value.absent(),
    this.reviewCount = const Value.absent(),
    this.description = const Value.absent(),
    this.features = const Value.absent(),
    this.isCertified = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BuyJewelryWishlistTableCompanion.insert({
    required String id,
    required String name,
    required String category,
    required double price,
    this.originalPrice = const Value.absent(),
    required String imageUrl,
    this.weight = const Value.absent(),
    this.size = const Value.absent(),
    this.material = const Value.absent(),
    this.stock = const Value.absent(),
    this.rating = const Value.absent(),
    this.reviewCount = const Value.absent(),
    this.description = const Value.absent(),
    this.features = const Value.absent(),
    this.isCertified = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       price = Value(price),
       imageUrl = Value(imageUrl);
  static Insertable<BuyJewelryWishlistTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<double>? price,
    Expression<double>? originalPrice,
    Expression<String>? imageUrl,
    Expression<String>? weight,
    Expression<String>? size,
    Expression<String>? material,
    Expression<int>? stock,
    Expression<double>? rating,
    Expression<int>? reviewCount,
    Expression<String>? description,
    Expression<String>? features,
    Expression<bool>? isCertified,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (price != null) 'price': price,
      if (originalPrice != null) 'original_price': originalPrice,
      if (imageUrl != null) 'image_url': imageUrl,
      if (weight != null) 'weight': weight,
      if (size != null) 'size': size,
      if (material != null) 'material': material,
      if (stock != null) 'stock': stock,
      if (rating != null) 'rating': rating,
      if (reviewCount != null) 'review_count': reviewCount,
      if (description != null) 'description': description,
      if (features != null) 'features': features,
      if (isCertified != null) 'is_certified': isCertified,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BuyJewelryWishlistTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? category,
    Value<double>? price,
    Value<double?>? originalPrice,
    Value<String>? imageUrl,
    Value<String?>? weight,
    Value<String?>? size,
    Value<String?>? material,
    Value<int>? stock,
    Value<double>? rating,
    Value<int>? reviewCount,
    Value<String?>? description,
    Value<String>? features,
    Value<bool>? isCertified,
    Value<int>? rowid,
  }) {
    return BuyJewelryWishlistTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      material: material ?? this.material,
      stock: stock ?? this.stock,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      description: description ?? this.description,
      features: features ?? this.features,
      isCertified: isCertified ?? this.isCertified,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (originalPrice.present) {
      map['original_price'] = Variable<double>(originalPrice.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (weight.present) {
      map['weight'] = Variable<String>(weight.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (material.present) {
      map['material'] = Variable<String>(material.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (reviewCount.present) {
      map['review_count'] = Variable<int>(reviewCount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (features.present) {
      map['features'] = Variable<String>(features.value);
    }
    if (isCertified.present) {
      map['is_certified'] = Variable<bool>(isCertified.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuyJewelryWishlistTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('originalPrice: $originalPrice, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('weight: $weight, ')
          ..write('size: $size, ')
          ..write('material: $material, ')
          ..write('stock: $stock, ')
          ..write('rating: $rating, ')
          ..write('reviewCount: $reviewCount, ')
          ..write('description: $description, ')
          ..write('features: $features, ')
          ..write('isCertified: $isCertified, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SellJewelryTableTable sellJewelryTable = $SellJewelryTableTable(
    this,
  );
  late final $BuyJewelryWishlistTableTable buyJewelryWishlistTable =
      $BuyJewelryWishlistTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    sellJewelryTable,
    buyJewelryWishlistTable,
  ];
}

typedef $$SellJewelryTableTableCreateCompanionBuilder =
    SellJewelryTableCompanion Function({
      required String id,
      required String name,
      required String category,
      required double price,
      Value<String?> imageUrl,
      Value<int> stock,
      Value<String?> weight,
      Value<String?> size,
      Value<String?> material,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$SellJewelryTableTableUpdateCompanionBuilder =
    SellJewelryTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> category,
      Value<double> price,
      Value<String?> imageUrl,
      Value<int> stock,
      Value<String?> weight,
      Value<String?> size,
      Value<String?> material,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$SellJewelryTableTableFilterComposer
    extends Composer<_$AppDatabase, $SellJewelryTableTable> {
  $$SellJewelryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SellJewelryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SellJewelryTableTable> {
  $$SellJewelryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SellJewelryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SellJewelryTableTable> {
  $$SellJewelryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<String> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get material =>
      $composableBuilder(column: $table.material, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$SellJewelryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SellJewelryTableTable,
          SellJewelryTableData,
          $$SellJewelryTableTableFilterComposer,
          $$SellJewelryTableTableOrderingComposer,
          $$SellJewelryTableTableAnnotationComposer,
          $$SellJewelryTableTableCreateCompanionBuilder,
          $$SellJewelryTableTableUpdateCompanionBuilder,
          (
            SellJewelryTableData,
            BaseReferences<
              _$AppDatabase,
              $SellJewelryTableTable,
              SellJewelryTableData
            >,
          ),
          SellJewelryTableData,
          PrefetchHooks Function()
        > {
  $$SellJewelryTableTableTableManager(
    _$AppDatabase db,
    $SellJewelryTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SellJewelryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SellJewelryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SellJewelryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<String?> weight = const Value.absent(),
                Value<String?> size = const Value.absent(),
                Value<String?> material = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SellJewelryTableCompanion(
                id: id,
                name: name,
                category: category,
                price: price,
                imageUrl: imageUrl,
                stock: stock,
                weight: weight,
                size: size,
                material: material,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String category,
                required double price,
                Value<String?> imageUrl = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<String?> weight = const Value.absent(),
                Value<String?> size = const Value.absent(),
                Value<String?> material = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SellJewelryTableCompanion.insert(
                id: id,
                name: name,
                category: category,
                price: price,
                imageUrl: imageUrl,
                stock: stock,
                weight: weight,
                size: size,
                material: material,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SellJewelryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SellJewelryTableTable,
      SellJewelryTableData,
      $$SellJewelryTableTableFilterComposer,
      $$SellJewelryTableTableOrderingComposer,
      $$SellJewelryTableTableAnnotationComposer,
      $$SellJewelryTableTableCreateCompanionBuilder,
      $$SellJewelryTableTableUpdateCompanionBuilder,
      (
        SellJewelryTableData,
        BaseReferences<
          _$AppDatabase,
          $SellJewelryTableTable,
          SellJewelryTableData
        >,
      ),
      SellJewelryTableData,
      PrefetchHooks Function()
    >;
typedef $$BuyJewelryWishlistTableTableCreateCompanionBuilder =
    BuyJewelryWishlistTableCompanion Function({
      required String id,
      required String name,
      required String category,
      required double price,
      Value<double?> originalPrice,
      required String imageUrl,
      Value<String?> weight,
      Value<String?> size,
      Value<String?> material,
      Value<int> stock,
      Value<double> rating,
      Value<int> reviewCount,
      Value<String?> description,
      Value<String> features,
      Value<bool> isCertified,
      Value<int> rowid,
    });
typedef $$BuyJewelryWishlistTableTableUpdateCompanionBuilder =
    BuyJewelryWishlistTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> category,
      Value<double> price,
      Value<double?> originalPrice,
      Value<String> imageUrl,
      Value<String?> weight,
      Value<String?> size,
      Value<String?> material,
      Value<int> stock,
      Value<double> rating,
      Value<int> reviewCount,
      Value<String?> description,
      Value<String> features,
      Value<bool> isCertified,
      Value<int> rowid,
    });

class $$BuyJewelryWishlistTableTableFilterComposer
    extends Composer<_$AppDatabase, $BuyJewelryWishlistTableTable> {
  $$BuyJewelryWishlistTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get originalPrice => $composableBuilder(
    column: $table.originalPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get features => $composableBuilder(
    column: $table.features,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCertified => $composableBuilder(
    column: $table.isCertified,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BuyJewelryWishlistTableTableOrderingComposer
    extends Composer<_$AppDatabase, $BuyJewelryWishlistTableTable> {
  $$BuyJewelryWishlistTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get originalPrice => $composableBuilder(
    column: $table.originalPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get features => $composableBuilder(
    column: $table.features,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCertified => $composableBuilder(
    column: $table.isCertified,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BuyJewelryWishlistTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $BuyJewelryWishlistTableTable> {
  $$BuyJewelryWishlistTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get originalPrice => $composableBuilder(
    column: $table.originalPrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get material =>
      $composableBuilder(column: $table.material, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get reviewCount => $composableBuilder(
    column: $table.reviewCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get features =>
      $composableBuilder(column: $table.features, builder: (column) => column);

  GeneratedColumn<bool> get isCertified => $composableBuilder(
    column: $table.isCertified,
    builder: (column) => column,
  );
}

class $$BuyJewelryWishlistTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BuyJewelryWishlistTableTable,
          BuyJewelryWishlistTableData,
          $$BuyJewelryWishlistTableTableFilterComposer,
          $$BuyJewelryWishlistTableTableOrderingComposer,
          $$BuyJewelryWishlistTableTableAnnotationComposer,
          $$BuyJewelryWishlistTableTableCreateCompanionBuilder,
          $$BuyJewelryWishlistTableTableUpdateCompanionBuilder,
          (
            BuyJewelryWishlistTableData,
            BaseReferences<
              _$AppDatabase,
              $BuyJewelryWishlistTableTable,
              BuyJewelryWishlistTableData
            >,
          ),
          BuyJewelryWishlistTableData,
          PrefetchHooks Function()
        > {
  $$BuyJewelryWishlistTableTableTableManager(
    _$AppDatabase db,
    $BuyJewelryWishlistTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BuyJewelryWishlistTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$BuyJewelryWishlistTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BuyJewelryWishlistTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<double?> originalPrice = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<String?> weight = const Value.absent(),
                Value<String?> size = const Value.absent(),
                Value<String?> material = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> reviewCount = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> features = const Value.absent(),
                Value<bool> isCertified = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BuyJewelryWishlistTableCompanion(
                id: id,
                name: name,
                category: category,
                price: price,
                originalPrice: originalPrice,
                imageUrl: imageUrl,
                weight: weight,
                size: size,
                material: material,
                stock: stock,
                rating: rating,
                reviewCount: reviewCount,
                description: description,
                features: features,
                isCertified: isCertified,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String category,
                required double price,
                Value<double?> originalPrice = const Value.absent(),
                required String imageUrl,
                Value<String?> weight = const Value.absent(),
                Value<String?> size = const Value.absent(),
                Value<String?> material = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> reviewCount = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> features = const Value.absent(),
                Value<bool> isCertified = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BuyJewelryWishlistTableCompanion.insert(
                id: id,
                name: name,
                category: category,
                price: price,
                originalPrice: originalPrice,
                imageUrl: imageUrl,
                weight: weight,
                size: size,
                material: material,
                stock: stock,
                rating: rating,
                reviewCount: reviewCount,
                description: description,
                features: features,
                isCertified: isCertified,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BuyJewelryWishlistTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BuyJewelryWishlistTableTable,
      BuyJewelryWishlistTableData,
      $$BuyJewelryWishlistTableTableFilterComposer,
      $$BuyJewelryWishlistTableTableOrderingComposer,
      $$BuyJewelryWishlistTableTableAnnotationComposer,
      $$BuyJewelryWishlistTableTableCreateCompanionBuilder,
      $$BuyJewelryWishlistTableTableUpdateCompanionBuilder,
      (
        BuyJewelryWishlistTableData,
        BaseReferences<
          _$AppDatabase,
          $BuyJewelryWishlistTableTable,
          BuyJewelryWishlistTableData
        >,
      ),
      BuyJewelryWishlistTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SellJewelryTableTableTableManager get sellJewelryTable =>
      $$SellJewelryTableTableTableManager(_db, _db.sellJewelryTable);
  $$BuyJewelryWishlistTableTableTableManager get buyJewelryWishlistTable =>
      $$BuyJewelryWishlistTableTableTableManager(
        _db,
        _db.buyJewelryWishlistTable,
      );
}
