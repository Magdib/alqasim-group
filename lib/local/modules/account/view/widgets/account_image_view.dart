import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:proj/Local/Core/Constant/Colors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/account/controller/account_controller.dart';
import 'package:proj/local/modules/account/model/enums/account_image_state.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

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
          onTap: () => controller.pickAccountBackImage(),
          child: Container(
            decoration: BoxDecoration(
              color: controller.accountBackImage == null
                  ? AppColors.lGreyD
                  : AppColors.lGrey,
              image: controller.accountBackImage != null
                  ? DecorationImage(
                      image: CachedNetworkImageProvider(
                          controller.accountBackImage!))
                  : null,
              boxShadow: [BoxShadow(color: AppColors.lBlack, blurRadius: 4.r)],
            ),
            height: AppSize.screenHight(context) / 4,
            width: AppSize.screenWidth(context),
            alignment: Alignment.center,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: controller.accountImage != null &&
                          controller.imageStatusRequest != StatusRequest.loading
                      ? () => controller.pickAccountImage()
                      : null,
                  child: Container(
                      height: 90.h,
                      width: AppSize.screenWidth(context) >=
                              AppSize.tabletBreakPoint
                          ? 68.w
                          : 95.w,
                      // radius: 50.r,
                      // backgroundColor: AppColors.primaryColor,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: controller.accountImage == null
                            ? AppColors.primaryColor
                            : AppColors.white,
                        boxShadow: [
                          BoxShadow(color: AppColors.lBlack, blurRadius: 4.r)
                        ],
                      ),
                      child:
                          controller.imageStatusRequest == StatusRequest.loading
                              ? SpinKitFadingCircle(
                                  size: 50.r,
                                  color: AppColors.white,
                                )
                              : (controller.accountImageState ==
                                      AccountImageState.none
                                  ? Icon(
                                      Icons.person_outline,
                                      color: AppColors.white,
                                      size: 50.r,
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
                                                  fontSize: 45.h),
                                        )
                                      : CustomCachedNetImage(
                                          imageUrl: controller.accountImage!,
                                          height: 90.h,
                                          width: AppSize.screenWidth(context) >=
                                                  AppSize.tabletBreakPoint
                                              ? 68.w
                                              : 95.w,
                                          borderRadius: 50.r,
                                          fit: BoxFit.cover,
                                          canReDownload: false,
                                        ))),
                ),
                if (controller.accountImage == null &&
                    controller.imageStatusRequest != StatusRequest.loading)
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: MaterialButton(
                        onPressed: () => controller.pickAccountImage(),
                        padding: EdgeInsets.zero,
                        minWidth: AppSize.screenWidth(context) >=
                                AppSize.tabletBreakPoint
                            ? 32.w
                            : 45.w,
                        height: 45.h,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r)),
                        color: AppColors.white,
                        child: Icon(
                          Icons.edit,
                          color: AppColors.primaryColor,
                          size: 24.r,
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
