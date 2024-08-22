import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_device_id/flutter_device_id.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/auth/login/model/login_model.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/modules/home/data/home_data.dart';
import 'package:video_player/video_player.dart';

class SplashScreenController extends GetxController {
  VideoPlayerController videoPlayerController = VideoPlayerController.asset(
    "assets/videos/intro.mp4",
  );
  goToHomePage() async {
    await Future.delayed(Duration(seconds: 11));
    await videoPlayerController.dispose();
    Get.offNamed(AppRoutes.homePageRoute);
  }

  sendToken() async {
    Box<LoginModel> loginDataBox =
        await Hive.openBox<LoginModel>(HiveBoxes.loginDataBox);
    HomeData homeData = HomeData(Get.find());
    String? fireBaseToken = await FirebaseMessaging.instance.getToken();
    final _flutterDeviceIdPlugin = FlutterDeviceId();
    String? deviceId = await _flutterDeviceIdPlugin.getDeviceId();
    // var response;
    // if (deviceId != null && fireBaseToken != null) {
    //   if (loginDataBox.isEmpty) {
    //     response = await homeData.sendFirebaseToken(
    //         getLanguage().languageCode, fireBaseToken, deviceId);
    //   } else {
    //     response = await homeData.sendFirebaseToken(getLanguage().languageCode,
    //         fireBaseToken, deviceId, loginDataBox.getAt(0)!.id.toString());
    //   }
    // }
    // response.fold((l) {
    //   log(l);
    // }, (r) async {
    //   log(r);
    // });
  }

  @override
  void onInit() {
    Get.put(MainPageController(), permanent: true);
    super.onInit();
  }

  @override
  void onReady() async {
    sendToken();
    await videoPlayerController.initialize();
    update();
    await videoPlayerController.play();
    goToHomePage();
    super.onReady();
  }
}
