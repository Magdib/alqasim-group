import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:proj/local/core/routes/routes.dart';

class MyMiddleWare extends GetMiddleware {
  // @override
  // int? get priority => 1;
  // MyServices myServices = Get.find();
  // @override
  // RouteSettings? redirect(String? route) {
  //   if (myServices.authBox.get(HiveKeys.islogin) == "2") {
  //     Hive.box(HiveBoxes.authBox).close();
  //     return const RouteSettings(name: AppRoutes.mainPageRoute);
  //   } else if (myServices.authBox.get(HiveKeys.islogin) == "1") {
  //     Hive.box(HiveBoxes.authBox).close();
  //     return const RouteSettings(name: AppRoutes.signInRoute);
  //   } else {
  //     Hive.box(HiveBoxes.authBox).close();
  //     return null;
  //   }
  // }
}
