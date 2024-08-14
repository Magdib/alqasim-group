import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/functions/language/left_right_lang_align.dart';
import 'package:proj/local/modules/carsdetails/model/api/car_model.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

class GridCarCard extends GetView<MainPageController> {
  const GridCarCard({
    super.key,
    required this.car,
    required this.index,
    required this.addToFav,
    this.rightPadding,
  });
  final CarModel car;
  final int index;
  final VoidCallback addToFav;
  final double? rightPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.goToDetailsPage(2),
      child: Stack(
        children: [
          Container(
            width: AppSize.screenWidth(context) / 2 - 30,
            height: AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
                ? 220.h
                : 190,
            alignment: leftRightLangAlign(controller.selectedLocal),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.grey.withOpacity(0.8), blurRadius: 4.r)
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                      width: AppSize.screenWidth(context) / 2 - 45,
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CustomCachedNetImage(
                        imageUrl: car.featureImage,
                        canReDownload: false,
                        fit: BoxFit.fitWidth,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: AppSize.screenWidth(context) / 2 - 40,
                    height:
                        AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
                            ? 120.h
                            : 90,
                    alignment: leftRightLangAlign(getLanguage().languageCode),
                    padding: EdgeInsets.symmetric(horizontal: 6.5.w),
                    decoration: BoxDecoration(
                        color: AppColors.lGrey,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          car.symbolPrice,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "car.type",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        FittedBox(
                          child: Text(
                            " car.name",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Image.asset(
                          AppImages.adminImage,
                          height: 25.h,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 7.h,
              right: rightPadding ?? 7.w,
              child: InkWell(
                  onTap: addToFav,
                  child: Icon(
                    // car.isFav ? Icons.favorite :
                    Icons.favorite_border_outlined,
                    color: AppColors.primaryColor,
                  ))),
        ],
      ),
    );
  }
}
