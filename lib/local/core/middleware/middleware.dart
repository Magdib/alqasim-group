import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:proj/global/core/services/services.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/class/hive_keys.dart';
import 'package:proj/local/core/routes/routes.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  AppServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.authBox.get(HiveKeys.startState) == "1") {
      Hive.box(HiveBoxes.authBox).close();
      return const RouteSettings(name: AppRoutes.homePageRoute);
    } else {
      Hive.box(HiveBoxes.authBox).close();
      return null;
    }
  }
}
