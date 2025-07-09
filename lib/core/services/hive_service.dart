import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  HiveService._();

  static bool _isInitialized = false;
  static late Box isFirstTime;

  static Future<void> init() async {
    if (!_isInitialized) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      _isInitialized = true;
    }
    isFirstTime = await HiveService.openHiveBox(HiveBoxesNames.isFirstTime);
  }

  static Future<Box> openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }
    return Hive.box(boxName);
  }
}
