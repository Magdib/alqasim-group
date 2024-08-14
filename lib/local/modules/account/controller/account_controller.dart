import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/account/model/account_pages_model.dart';
import 'package:proj/local/modules/account/model/enums/account_image_state.dart';

class AccountController extends GetxController {
  String? accountImage;
  String? accountBackImage;
  AccountImageState accountImageState = AccountImageState.none;
  AccountImageState accountBackImageState = AccountImageState.none;
  String userName = "Magd";
  late List<AccountPagesModel> upperList;
  late List<AccountPagesModel> lowerList;
  pickAccountImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      accountImage = image.path;
      accountImageState = AccountImageState.image;
    }
    update();
  }

  pickAccountBackImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      accountBackImage = image.path;
      accountBackImageState = AccountImageState.image;
    }
    update();
  }

  defineLists() {
    upperList = [
      AccountPagesModel(
          title: "إعدادات الحساب".tr,
          icon: Icons.account_circle_outlined,
          route: AppRoutes.editAccountPageRoute),
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
          link:
              "https://alqassimgroup.net/%D8%A7%D9%84%D8%A3%D8%AD%D9%83%D8%A7%D9%85-%D9%88%D8%A7%D9%84%D8%B4%D8%B1%D9%88%D8%B7"),
      AccountPagesModel(
          title: "سياسة الخصوصية".tr,
          icon: Icons.lock_outline,
          link:
              "https://alqassimgroup.net/%D8%B3%D9%8A%D8%A7%D8%B3%D8%A9-%D8%A7%D9%84%D8%AE%D8%B5%D9%88%D8%B5%D9%8A%D8%A9"),
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
          route: AppRoutes.ticketsPageRoute),
      AccountPagesModel(
        title: "تسجيل الخروج".tr,
        icon: Icons.logout,
      ),
    ];
    update();
  }

  @override
  void onInit() {
    defineLists();
    super.onInit();
  }
}
