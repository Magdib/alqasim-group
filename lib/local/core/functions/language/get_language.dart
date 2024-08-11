import 'dart:ui';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/class/hive_keys.dart';

Locale getLanguage() {
  String? local = Hive.box(HiveBoxes.authBox).get(HiveKeys.language);
  return local == null ? Get.deviceLocale! : Locale(local);
}
