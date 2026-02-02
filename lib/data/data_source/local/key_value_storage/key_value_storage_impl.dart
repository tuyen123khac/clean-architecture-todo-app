import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'key_value_storage.dart';

class KeyValueStorageImpl extends KeyValueStorage {
  static const String _prefix = '@@mobile';

  final String key;
  final FlutterSecureStorage _storage;

  const KeyValueStorageImpl._(this.key, this._storage);

  const KeyValueStorageImpl(
    FlutterSecureStorage storage, [
    String key = 'default',
  ]) : this._(key, storage);

  String get _userEmailKey => '$_prefix/$key/userEmail';

  @override
  Future<void> removeUserEmail() async {
    await _storage.delete(key: _userEmailKey);
  }
}
