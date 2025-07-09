import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  HiveService._();

  static bool _isInitialized = false;
  static late Box<bool> isFirstTime;

  static Future<void> init() async {
    if (!_isInitialized) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      _isInitialized = true;
    }
    isFirstTime = await HiveService.openHiveBox<bool>(
      HiveBoxesNames.isFirstTime,
    );
  }

  static Future<Box<T>> openHiveBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box(boxName);
  }
}
