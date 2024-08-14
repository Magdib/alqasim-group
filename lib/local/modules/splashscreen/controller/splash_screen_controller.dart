import 'package:get/get.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
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

  @override
  void onInit() {
    Get.put(MainPageController(), permanent: true);
    super.onInit();
  }

  @override
  void onReady() async {
    await videoPlayerController.initialize();
    update();
    await videoPlayerController.play();
    goToHomePage();
    super.onReady();
  }
}
