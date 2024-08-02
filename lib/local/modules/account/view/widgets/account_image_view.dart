import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/Local/Core/Constant/Colors.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/account/controller/account_controller.dart';
import 'package:proj/local/modules/account/model/enums/account_image_state.dart';

class AccountImageView extends StatelessWidget {
  const AccountImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: GetBuilder<AccountController>(
        builder: (controller) => GestureDetector(
          onTap: controller.accountBackImage == null
              ? () => controller.pickAccountBackImage()
              : null,
          child: Container(
            decoration: BoxDecoration(
              color: controller.accountBackImage == null
                  ? AppColors.lGreyD
                  : AppColors.lGrey,
              image: controller.accountBackImage != null
                  ? DecorationImage(
                      image: FileImage(File(controller.accountBackImage!)),
                      fit: BoxFit.contain,
                    )
                  : null,
              boxShadow: const [
                BoxShadow(color: AppColors.lBlack, blurRadius: 5)
              ],
            ),
            height: AppSize.screenHight(context) / 4,
            width: AppSize.screenWidth(context),
            alignment: Alignment.center,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: controller.accountImage != null
                      ? () => controller.pickAccountImage()
                      : null,
                  child: Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: controller.accountImage == null
                              ? AppColors.primaryColor
                              : AppColors.white,
                          boxShadow: const [
                            BoxShadow(color: AppColors.lBlack, blurRadius: 5)
                          ],
                          image: controller.accountImage != null
                              ? DecorationImage(
                                  image: FileImage(
                                    File(controller.accountImage!),
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null),
                      child:
                          controller.accountImageState == AccountImageState.none
                              ? const Icon(
                                  Icons.person_outline,
                                  color: AppColors.white,
                                  size: 50,
                                )
                              : controller.accountImageState ==
                                      AccountImageState.login
                                  ? Text(
                                      controller.userName[0],
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              color: AppColors.white,
                                              fontSize: 45),
                                    )
                                  : null),
                ),
                if (controller.accountImage == null)
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: MaterialButton(
                        onPressed: () => controller.pickAccountImage(),
                        padding: EdgeInsets.zero,
                        minWidth: 45,
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45)),
                        color: AppColors.white,
                        child: const Icon(
                          Icons.edit,
                          color: AppColors.primaryColor,
                        ),
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
