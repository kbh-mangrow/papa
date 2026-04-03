import 'package:idb_shim/idb.dart';
import 'package:idb_shim/idb_browser.dart';

/*
  await IndexedDb.set('test', "고길동");
  final s = await IndexedDb.get('test');
  if (s != null) {
    FlutterToast.showx(s);
  }
   */


class IndexedDb {
  static const _dbName = 'bong2025z';
  static const _storeName = 'hoyo2025x';
  static const _dbVersion = 1;

  static IdbFactory get _idbFactory {
    final factory = getIdbFactory();
    if (factory == null) {
      throw UnsupportedError('IndexedDB is not supported in this browser.');
    }
    return factory;
  }

  static Future<Database> _openDb() async {
    return await _idbFactory.open(_dbName, version: _dbVersion,
      onUpgradeNeeded: (e) {
        final db = e.database;
        if (!db.objectStoreNames.contains(_storeName)) {
          db.createObjectStore(_storeName);
        }
      },
    );
  }

  static Future<void> set(String key, dynamic value) async {
    final db = await _openDb();
    final txn = db.transaction(_storeName, idbModeReadWrite);
    final store = txn.objectStore(_storeName);
    await store.put(value, key);
    await txn.completed;
    db.close();
  }

  static Future<dynamic> get(String key) async {
    final db = await _openDb();
    final txn = db.transaction(_storeName, idbModeReadOnly);
    final store = txn.objectStore(_storeName);
    final value = await store.getObject(key);
    await txn.completed;
    db.close();
    return value;
  }

  static Future<void> delete(String key) async {
    final db = await _openDb();
    final txn = db.transaction(_storeName, idbModeReadWrite);
    final store = txn.objectStore(_storeName);
    await store.delete(key);
    await txn.completed;
    db.close();
  }

  static Future<void> clearAll() async {
    final db = await _openDb();
    final txn = db.transaction(_storeName, idbModeReadWrite);
    final store = txn.objectStore(_storeName);
    await store.clear();
    await txn.completed;
    db.close();
  }
}