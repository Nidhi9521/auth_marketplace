import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

HiveManager? hiveBox;

///HiveManager
///
///This class contains methods and properties which stores app data permanently and
/// also have a method for accessing that data.
class HiveManager {
  late String boxName;
  LazyBox? box;

  HiveManager({required String boxName, required String path}) {
    this.boxName = boxName;
    Hive.init(path);
  }

  static Future<HiveManager> create({required String boxName}) async {
    final documentDirectory = await getApplicationDocumentsDirectory();

    return HiveManager(boxName: boxName, path: documentDirectory.path);
  }

  Future<dynamic> getValueForKey(String key, [dynamic defaultValue]) async {
    if (box == null) {
      box = await Hive.openLazyBox(boxName);
    }
    return box?.get(key, defaultValue: defaultValue);
  }

  Future<void> setValueForKey(dynamic value, String key) async {
    if (box == null) {
      box = await Hive.openLazyBox(boxName);
    }

    return box?.put(key, value);
  }

  Future<void> deleteValueForKey(String key) async {
    if (box == null) {
      box = await Hive.openLazyBox(boxName);
    }

    return box?.delete(key);
  }
}

class HiveKeys {
  static const String userDetail = "userDetail";
}

class HiveBoxName {
  static const String hiveBox = "HiveBox";
}
