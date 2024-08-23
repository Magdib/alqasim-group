import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/functions/language/left_right_lang_align.dart';
import 'package:proj/local/modules/carspage/controller/seller_page_controller.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

class GridCarCard extends StatelessWidget {
  const GridCarCard({
    super.key,
    required this.car,
    required this.index,
    required this.addToFav,
    this.rightPadding,
    required this.onTap,
  });
  final dynamic car;
  final int index;
  final VoidCallback addToFav;
  final double? rightPadding;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            // width: AppSize.screenWidth(context) / 2 - 30,
            // height: AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
            //     ? 220.h
            //     : 190,
            alignment: leftRightLangAlign(getLanguage().languageCode),
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
                      width: AppSize.screenWidth(context) / 2 - 20.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: CustomCachedNetImage(
                        imageUrl: car.featureImage,
                        canReDownload: false,
                        borderRadius: 8.r,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: AppSize.screenWidth(context) / 2 - 30.w,
                    // height:
                    //     AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
                    //         ? 120.h
                    //         : 90,
                    margin: EdgeInsets.only(bottom: 5.h),
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
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "${car.brand} ${car.model}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: AppColors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          car.productTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.5.h),
                          child: CustomCachedNetImage(
                              imageUrl: car.vendor.photo,
                              borderRadius: 25.r,
                              fit: BoxFit.cover,
                              height: 25.h,
                              width: 28.w,
                              canReDownload: false),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          GetBuilder<SellerPageController>(
            builder: (controller) => Positioned(
                top: 7.h,
                right: 7.w,
                child: controller.wishlistLoadingList[index]
                    ? SpinKitPumpingHeart(
                        color: AppColors.primaryColor,
                        size: 24.r,
                      )
                    : GestureDetector(
                        onTap: addToFav,
                        child: Icon(
                          // car.isFav ? Icons.favorite :
                          Icons.favorite_border_outlined,
                          color: AppColors.primaryColor,
                        ))),
          ),
        ],
      ),
    );
  }
}
