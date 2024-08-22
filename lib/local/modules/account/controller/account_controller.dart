import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/class/hive_keys.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/account/data/account_data.dart';
import 'package:proj/local/modules/account/model/account_pages_model.dart';
import 'package:proj/local/modules/account/model/enums/account_image_state.dart';
import 'package:proj/local/modules/auth/login/model/login_model.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class AccountController extends GetxController {
  String? accountImage;
  String? accountBackImage;
  AccountImageState accountImageState = AccountImageState.none;
  AccountImageState accountBackImageState = AccountImageState.none;
  StatusRequest imageStatusRequest = StatusRequest.none;
  StatusRequest backImageStatusRequest = StatusRequest.none;
  late String userName;
  late List<AccountPagesModel> upperList;
  late List<AccountPagesModel> lowerList;
  Box authBox = Hive.box(HiveBoxes.authBox);
  Box<LoginModel> loginDataBox = Hive.box(HiveBoxes.loginDataBox);
  late LoginModel loginData;
  String? token;
  pickAccountImage() async {
    if (token != null) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageStatusRequest = StatusRequest.loading;
        update();
        AccountData signInData = AccountData(Get.find());
        var response = await signInData.uploadUserImage(
            getLanguage().languageCode, image.path, token!);
        response.fold((l) {
          if (l.runtimeType == NetworkError) {
            AppToasts.errorToast("...لا يوجد اتصال بالإنترنت".tr);
          } else {
            AppToasts.errorToast(l.message);
          }
          imageStatusRequest = StatusRequest.none;

          update();
        }, (r) {
          imageStatusRequest = StatusRequest.none;
          update();
          log(r['message']);
// loginData.image =
        });
        accountImageState = AccountImageState.image;
      }
      update();
    } else {
      Get.toNamed(AppRoutes.signInPageRoute);
      AppToasts.errorToast("قم بتسجيل الدخول للمتابعة".tr);
    }
  }

  pickAccountBackImage() async {
    if (token != null) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        accountBackImage = image.path;
        accountBackImageState = AccountImageState.image;
      }
      update();
    } else {
      Get.toNamed(AppRoutes.signInPageRoute);
      AppToasts.errorToast("قم بتسجيل الدخول للمتابعة".tr);
    }
  }

  defineLists() async {
    token = authBox.get(HiveKeys.token);

    loginDataBox = Hive.box(HiveBoxes.loginDataBox);

    if (token != null) {
      loginData = loginDataBox.getAt(0)!;
      userName = loginData.username;
      if (loginData.image.isEmpty) {
        accountImageState = AccountImageState.login;
      }
    }
    upperList = [
      AccountPagesModel(
          title: "إعدادات الحساب".tr,
          icon: Icons.account_circle_outlined,
          route: token != null
              ? AppRoutes.editAccountPageRoute
              : AppRoutes.signInPageRoute),
      AccountPagesModel(
          title: "مدوّنة".tr,
          icon: Icons.people_alt_outlined,
          link: "https://alqassimgroup.net/blog"),
    ];
    lowerList = [
      AccountPagesModel(
          title: "اتصل بنا".tr,
          icon: Icons.support_agent_outlined,
          link: "https://alqassimgroup.net/contact"),
      AccountPagesModel(
          title: "الأحكام والشروط".tr,
          icon: Icons.policy,
          link: "https://alqassimgroup.net/terms-&-condition"),
      AccountPagesModel(
          title: "سياسة الخصوصية".tr,
          icon: Icons.lock_outline,
          link: "https://alqassimgroup.net/privacy-policy"),
      AccountPagesModel(
          title: "التعليمات".tr,
          icon: Icons.perm_device_info_rounded,
          link: "https://alqassimgroup.net/faq"),
      AccountPagesModel(
          title: "الصور المحفوظة".tr,
          icon: Icons.image_outlined,
          route: AppRoutes.savedImagesPageRoute),
      AccountPagesModel(
          title: "تذاكر الدعم الفني".tr,
          icon: Bootstrap.ticket_detailed_fill,
          route: token != null
              ? AppRoutes.ticketsPageRoute
              : AppRoutes.signInPageRoute),
    ];
    if (token != null) {
      lowerList.add(
        AccountPagesModel(
          title: "تسجيل الخروج".tr,
          icon: Icons.logout,
        ),
      );
    }
    update();
  }

  logout() {
    authBox.delete(HiveKeys.token);
    loginDataBox.clear();
    accountBackImage = null;
    accountBackImageState = AccountImageState.none;
    accountImage = null;
    accountImageState = AccountImageState.none;
    defineLists();
    MainPageController mainPageController = Get.find();
    mainPageController.handleAfterLogout();
    AppToasts.successToast("تم تسجيل الخروج بنجاح".tr);
  }

  @override
  void onInit() {
    defineLists();
    super.onInit();
  }
}
