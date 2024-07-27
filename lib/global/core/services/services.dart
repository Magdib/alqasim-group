import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../local/core/class/hive_box.dart';
import '../../../local/core/class/hive_keys.dart';

class AppServices extends GetxService {
  //i use it for initialize all data i need instead of initialize it in the main function
  static String userId = '';
  late Box authBox;
  Future<AppServices> init() async {
    await Hive.initFlutter();
    authBox = await Hive.openBox(HiveBoxes.authBox);
    // if (box.get(HiveKeys.userId) != null) {
    //   userId = box.get(HiveKeys.userId);
    //   debugPrint("user id  $userId");
    // }
    // box.put(HiveKeys.showAd, false);
    log("user id  $userId");
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
