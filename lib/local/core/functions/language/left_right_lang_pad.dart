import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/class/hive_keys.dart';
import 'package:proj/local/core/constant/app_size.dart';

EdgeInsets leftRightLangPad(BuildContext context) {
  Box authBox = Hive.box(HiveBoxes.authBox);
  if (authBox.get(HiveKeys.language) == null) {
    if (Get.deviceLocale!.languageCode.contains("ar")) {
      return EdgeInsets.only(left: AppSize.screenWidth(context) / 2, right: 10);
    } else {
      return EdgeInsets.only(right: AppSize.screenWidth(context) / 2, left: 10);
    }
  } else {
    if (authBox.get(HiveKeys.language) == "ar") {
      return EdgeInsets.only(left: AppSize.screenWidth(context) / 2, right: 10);
    } else {
      return EdgeInsets.only(right: AppSize.screenWidth(context) / 2, left: 10);
    }
  }
}
