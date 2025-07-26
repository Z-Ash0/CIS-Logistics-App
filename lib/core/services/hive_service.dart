import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static bool _isInitialized = false;
  late Box isFirstTimeBox;
  late Box isLoggedInBox;
  late Box userRoleBox;
  late Box themeModeBox;

  Future<void> init() async {
    if (!_isInitialized) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      _isInitialized = true;
    }
    await _openHiveBoxes();
  }

  Future<void> _openHiveBoxes() async {
    isFirstTimeBox = await openHiveBox(HiveBoxesNames.isFirstTime);
    isLoggedInBox = await openHiveBox(HiveBoxesNames.isLoggedIn);
    userRoleBox = await openHiveBox(HiveBoxesNames.userRole);
    themeModeBox = await openHiveBox(HiveBoxesNames.themeMode);
  }

  Future<Box> openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }
    return Hive.box(boxName);
  }
}
