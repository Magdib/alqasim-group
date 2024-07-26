import 'package:get/get.dart';
import 'package:proj/controllers/car_details_controller.dart';
import 'package:proj/controllers/main_page_controller.dart';
import 'package:proj/controllers/on_boarding_controller.dart';
import 'package:proj/controllers/sign_up_controller.dart';
import 'package:proj/view/pages/OnBoarding/OnBoarding.dart';
import 'package:proj/view/pages/auth/signup/sign_up.dart';
import 'package:proj/view/pages/home/main_page.dart';
import 'package:proj/view/pages/products/car_details.dart';

class AppRoutes {
  static const String mainRoute = "/";
  static const String signInPageRoute = "/signInPage";
  static const String homePageRoute = "/homePage";
  static const String carDetailsPageRoute = "/carDetailsPage";
}

List<GetPage> pages = [
  GetPage(
      name: AppRoutes.mainRoute,
      page: () => const OnBoarding(),
      binding: BindingsBuilder.put(
        () => OnBoardingController(),
      )),
  GetPage(
    name: AppRoutes.signInPageRoute,
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 800),
    binding: BindingsBuilder.put(() => SignUpController()),
    page: () => const SignUp(),
  ),
  GetPage(
      name: AppRoutes.homePageRoute,
      page: () => const MainPage(),
      binding: BindingsBuilder.put(
        () => MainPageController(),
      )),
  GetPage(
      name: AppRoutes.carDetailsPageRoute,
      page: () => const CarDetails(),
      binding: BindingsBuilder.put(
        () => CarDetailsController(),
      ))
];
