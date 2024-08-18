import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/functions/language/left_right_lang_align.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class CustomTableRow extends GetView<MainPageController> {
  const CustomTableRow({
    super.key,
    required this.body,
    required this.isTitles,
    required this.title,
  });
  final String body;
  final bool isTitles;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: leftRightLangAlign(controller.selectedLocal),
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: isTitles
          ? FittedBox(
              child: Text(
                body,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
            )
          : InkWell(
              onTap: () => Get.defaultDialog(
                  backgroundColor: AppColors.white,
                  title: title,
                  radius: AppSize.appCustomRadius.r,
                  titleStyle: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 16.sp),
                  middleText: body,
                  middleTextStyle: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14.sp)),
              child: Text(
                body,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 12.sp),
              ),
            ),
    );
  }
}
