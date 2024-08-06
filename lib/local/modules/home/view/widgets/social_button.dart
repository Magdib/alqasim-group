import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/modules/home/model/al_qassem_socials_model.dart';

class SocialButton extends GetView<MainPageController> {
  const SocialButton({
    super.key,
    required this.alQassemSocial,
    required this.index,
  });
  final AlQassemSocialsModel alQassemSocial;
  final int index;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 55,
        color: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        onPressed: () => controller.openSocial(index),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.appCustomRadius)),
        child: Icon(
          alQassemSocial.icon,
          color: AppColors.white,
          size: 22,
        ));
  }
}
