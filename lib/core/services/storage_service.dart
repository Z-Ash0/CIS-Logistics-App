import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class StorageService {
  bool _isHiveInitialized = false;
  bool _isSecureStorageInitialized = false;
  static FlutterSecureStorage? _secureStorage;

  late Box isFirstTimeBox;
  late Box isLoggedInBox;
  late Box userRoleBox;
  late Box themeModeBox;

  Future<void> init() async {
    await _initHive();
    await _initSecureStorage();
  }

  Future<void> _initHive() async {
    if (!_isHiveInitialized) return;
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await _openHiveBoxes();
    _isHiveInitialized = true;
  }

  Future<void> _openHiveBoxes() async {
    isFirstTimeBox = await openHiveBox(StorageServiceBoxNames.isFirstTime);
    isLoggedInBox = await openHiveBox(StorageServiceBoxNames.isLoggedIn);
    userRoleBox = await openHiveBox(StorageServiceBoxNames.userRole);
    themeModeBox = await openHiveBox(StorageServiceBoxNames.themeMode);
  }

  Future<Box> openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }
    return Hive.box(boxName);
  }

  Future<void> _initSecureStorage() async {
    if (_isSecureStorageInitialized) return;

    AndroidOptions androidOptions = const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    _secureStorage = FlutterSecureStorage(aOptions: androidOptions);
    _isSecureStorageInitialized = true;
  }

  Future<void> putSecure(String key, String value) async =>
      await _secureStorage?.write(key: key, value: value);

  Future<String?> getSecure(String key) async =>
      await _secureStorage?.read(key: key);

  Future<void> deleteSecure(String key) async =>
      await _secureStorage?.delete(key: key);

  Future<void> clearAllSecure() async => await _secureStorage?.deleteAll();
}
