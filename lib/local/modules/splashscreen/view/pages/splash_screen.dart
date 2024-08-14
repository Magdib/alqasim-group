import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/splashscreen/controller/splash_screen_controller.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
          height: AppSize.screenHight(context) - 30,
          width: AppSize.screenWidth(context),
          child: GetBuilder<SplashScreenController>(
              builder: (controller) =>
                  controller.videoPlayerController.value.isInitialized
                      ? VideoPlayer(controller.videoPlayerController)
                      : const SizedBox())),
    ));
  }
}
