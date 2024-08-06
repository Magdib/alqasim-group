import 'package:get/get.dart';
import 'package:proj/local/modules/auth/login/controller/login_controller.dart';
import 'package:proj/local/modules/auth/login/view/pages/forgot_pas_email_page.dart';
import 'package:proj/local/modules/auth/login/view/pages/login_page.dart';
import 'package:proj/local/modules/auth/shared/pages/otp_page.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';
import 'package:proj/local/modules/carspage/controller/seller_page_controller.dart';
import 'package:proj/local/modules/carspage/view/pages/seller_cars_page.dart';
import 'package:proj/local/modules/home/view/pages/main_page.dart';
import 'package:proj/local/modules/OnBoarding/controller/on_boarding_controller.dart';
import 'package:proj/local/modules/auth/signup/controller/sign_up_controller.dart';
import 'package:proj/local/core/middleware/middleware.dart';
import 'package:proj/local/modules/OnBoarding/view/pages/OnBoarding.dart';
import 'package:proj/local/modules/auth/signup/view/pages/sign_up.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/modules/carsdetails/view/pages/car_details.dart';

class AppRoutes {
  static const String mainRoute = "/";
  static const String signInPageRoute = "/signInPage";
  static const String signUpPageRoute = "/signUpPage";
  static const String homePageRoute = "/homePage";
  static const String carDetailsPageRoute = "/carDetailsPage";
  static const String forgotPassEmailPageRoute = "/ForgotPassEmailPage";
  static const String otpPageRoute = "/otpPage";
  static const String sellerCarsPageRoute = "/SellerCarsPage";
}

List<GetPage> pages = [
  GetPage(
      name: AppRoutes.mainRoute,
      page: () => const OnBoarding(),
      binding: BindingsBuilder.put(
        () => OnBoardingController(),
      ),
      middlewares: [MyMiddleWare()]),
  GetPage(
    name: AppRoutes.signUpPageRoute,
    binding: BindingsBuilder.put(() => SignUpController()),
    page: () => const SignUp(),
  ),
  GetPage(
    name: AppRoutes.signInPageRoute,
    binding: BindingsBuilder.put(() => LoginController()),
    page: () => const LoginPage(),
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
      )),
  GetPage(
    name: AppRoutes.forgotPassEmailPageRoute,
    page: () => const ForgotPassEmailPage(),
  ),
  GetPage(
    name: AppRoutes.otpPageRoute,
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 500),
    page: () => const OtpPage(),
  ),
  GetPage(
      name: AppRoutes.sellerCarsPageRoute,
      page: () => const SellerCarsPage(),
      binding: BindingsBuilder.put(
        () => SellerPageController(),
      ))
];
