import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/features/profile/data/model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  bool _isHiveInitialized = false;
  bool _isSecureStorageInitialized = false;
  static FlutterSecureStorage? _secureStorage;

  late Box isFirstTimeBox;
  late Box isLoggedInBox;
  late Box userRoleBox;
  late Box themeModeBox;
  late Box<UserData> userDataBox;

  Future<void> init() async {
    await _initHive();
    await _initSecureStorage();
  }

  Future<void> _initHive() async {
    if (_isHiveInitialized) return;
    await Hive.initFlutter();
    await _openHiveBoxes();
    _isHiveInitialized = true;
  }

  Future<void> _openHiveBoxes() async {
    isFirstTimeBox = await openHiveBox(StorageServiceBoxNames.isFirstTime);
    isLoggedInBox = await openHiveBox(StorageServiceBoxNames.isLoggedIn);
    userRoleBox = await openHiveBox(StorageServiceBoxNames.userRole);
    themeModeBox = await openHiveBox(StorageServiceBoxNames.themeMode);
    userDataBox = await Hive.openBox<UserData>(StorageServiceBoxNames.userData);
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

  // User data methods
  Future<void> saveUserData(User user) async {
    await userDataBox.put(StorageServiceKeys.kUserData, user.data);
  }

  UserData? getUserData() {
    return userDataBox.get(StorageServiceKeys.kUserData);
  }

  Future<void> deleteUserData() async {
    await userDataBox.delete(StorageServiceKeys.kUserData);
  }

  bool get hasUserData => userDataBox.containsKey(StorageServiceKeys.kUserData);
}
