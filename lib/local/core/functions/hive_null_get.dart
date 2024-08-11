import 'package:hive/hive.dart';
import 'package:proj/local/core/class/hive_box.dart';

hiveNullGet(String key, dynamic nullValue) {
  Box authBox = Hive.box(HiveBoxes.authBox);
  dynamic value = authBox.get(key);
  return value == null ? nullValue : value;
}
