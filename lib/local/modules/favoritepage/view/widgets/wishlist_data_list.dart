import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/favoritepage/controller/favorite_Page_controller.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

class WishlistDataList extends StatelessWidget {
  const WishlistDataList({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritePageController>(
      builder: (controller) => ListView.separated(
        separatorBuilder: (context, subIndex) => SizedBox(
          width: 10.w,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: controller.viewCars[index].cars.length,
        itemBuilder: (context, subIndex) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            GestureDetector(
              onTap: () => controller.goToDetailsPage(index, subIndex),
              child: Container(
                  width: AppSize.screenWidth(context) / 2 - 15,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CustomCachedNetImage(
                    imageUrl:
                        controller.viewCars[index].cars[subIndex].featureImage,
                    canReDownload: false,
                    fit: BoxFit.cover,
                    borderRadius: 8.r,
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: AppSize.screenWidth(context) / 2 - 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.viewCars[index].cars[subIndex].symbolPrice,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                      ),
                      controller.viewCars[index].isLoadingList[subIndex]
                          ? SpinKitPumpingHeart(
                              color: AppColors.primaryColor,
                              size: 24.r,
                            )
                          : InkWell(
                              onTap: () =>
                                  controller.removeCar(index, subIndex),
                              child: Icon(
                                // controller.viewCars[index]
                                //         .cars[subIndex].isFav
                                //     ? Icons.favorite
                                //     :
                                Icons.favorite_border_outlined,
                                size: 24.r,
                                color: AppColors.primaryColor,
                              ))
                    ],
                  ),
                  Text(
                    controller.viewCars[index].cars[subIndex].productTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
