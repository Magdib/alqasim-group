import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/functions/language/left_right_lang_align.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/model/api/top_car_model.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

class TopCarCard extends GetView<MainPageController> {
  const TopCarCard({
    super.key,
    required this.car,
    required this.index,
    required this.addToFav,
    this.rightPadding,
  });
  final TopCarModel car;
  final int index;
  final VoidCallback addToFav;
  final double? rightPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.goToDetailsPage(car.id),
      child: Stack(
        children: [
          Container(
            width: AppSize.screenWidth(context) - 30,
            // height:
            //  AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
            // ? 200.h + 41
            // : 290,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    width: AppSize.screenWidth(context) - 25.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: CustomCachedNetImage(
                      imageUrl: car.featureImage,
                      canReDownload: false,
                      borderRadius: 12.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: AppSize.screenWidth(context) - 40.w,
                    // height:
                    //     AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
                    //         ? 140.h
                    //         : 120,
                    alignment: leftRightLangAlign(controller.selectedLocal),
                    padding: EdgeInsets.symmetric(horizontal: 6.5.w),
                    margin: EdgeInsets.only(bottom: 5.h),
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
                          "${car.productTitle}",
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
                        Text(
                          "${car.productTitle}",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.5.h),
                          child: CustomCachedNetImage(
                            imageUrl: car.vendor.photo,
                            canReDownload: false,
                            height: 25.h,
                            width: 25.w,
                            borderRadius: 25.r,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 7.h,
              right: rightPadding != null ? rightPadding!.w : 7.w,
              child: InkWell(
                  onTap: addToFav,
                  child: Icon(
                    // car.isFav ?
                    //  Icons.favorite :
                    Icons.favorite_border_outlined,
                    color: AppColors.primaryColor,
                  ))),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:proj/local/core/functions/language/left_right_lang_align.dart';
// import 'package:proj/local/modules/home/controller/main_page_controller.dart';
// import 'package:proj/local/core/constant/app_size.dart';
// import 'package:proj/local/core/constant/colors.dart';
// import 'package:proj/local/modules/home/model/api/top_car_model.dart';
// import 'package:proj/local/view/shared/custom_cached_net_image.dart';

// class TopCarCard extends GetView<MainPageController> {
//   const TopCarCard({
//     super.key,
//     required this.car,
//     required this.index,
//     required this.addToFav,
//     this.rightPadding,
//   });
//   final TopCarModel car;
//   final int index;
//   final VoidCallback addToFav;
//   final double? rightPadding;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => controller.goToDetailsPage(car.id),
//       child: Stack(
//         children: [
//           Container(
//             width: AppSize.screenWidth(context) - 30,
//             height: AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
//                 ? 200.h + 41
//                 : 268,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.r),
//                 color: AppColors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       color: AppColors.grey.withOpacity(0.8), blurRadius: 4.r)
//                 ]),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 3.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Container(
//                     width: AppSize.screenWidth(context) - 25.w,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     child: CustomCachedNetImage(
//                       imageUrl: car.featureImage,
//                       canReDownload: false,
//                       borderRadius: 12.r,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Container(
//                     width: AppSize.screenWidth(context) - 40.w,
//                     height:
//                         AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
//                             ? 120.h
//                             : 95,
//                     alignment: leftRightLangAlign(controller.selectedLocal),
//                     padding: EdgeInsets.symmetric(horizontal: 6.5.w),
//                     decoration: BoxDecoration(
//                         color: AppColors.lGrey,
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(20.r),
//                           bottomRight: Radius.circular(20.r),
//                         )),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Text(
//                           car.symbolPrice,
//                           style: Theme.of(context)
//                               .textTheme
//                               .displaySmall!
//                               .copyWith(
//                                 color: AppColors.primaryColor,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Text(
//                           "${car.brand} ${car.model}",
//                           style: Theme.of(context)
//                               .textTheme
//                               .displaySmall!
//                               .copyWith(
//                                   color: AppColors.grey,
//                                   fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         FittedBox(
//                           child: Text(
//                             car.productTitle,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .displaySmall!
//                                 .copyWith(
//                                   fontSize: 11.5.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 5.w, vertical: 2.5.h),
//                           child: CustomCachedNetImage(
//                             imageUrl: car.vendor.photo,
//                             canReDownload: false,
//                             height: 25.h,
//                             width: 25.w,
//                             borderRadius: 25.r,
//                             fit: BoxFit.cover,
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//               top: 7.h,
//               right: rightPadding != null ? rightPadding!.w : 7.w,
//               child: InkWell(
//                   onTap: addToFav,
//                   child: Icon(
//                     // car.isFav ?
//                     //  Icons.favorite :
//                     Icons.favorite_border_outlined,
//                     color: AppColors.primaryColor,
//                   ))),
//         ],
//       ),
//     );
//   }
// }
