import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carspage/controller/cars_page_controller.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

class FiltersCarsGridView extends GetView<CarsPageController> {
  const FiltersCarsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DynamicHeightGridView(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.carsView.length,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          builder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: () =>
                    controller.goToDetailsPage(controller.carsView[index].id),
                child: Container(
                  width: AppSize.screenWidth(context) / 2 - 15,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: CustomCachedNetImage(
                    imageUrl: controller.carsView[index].featureImage,
                    fit: BoxFit.cover,
                    canReDownload: false,
                    borderRadius: 8.r,
                  ),
                ),
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
                          controller.carsView[index].symbolPrice,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                        ),
                        GetBuilder<CarsPageController>(
                          builder: (controller) => controller
                                  .wishlistLoadingList[index]
                              ? SpinKitPumpingHeart(
                                  color: AppColors.primaryColor,
                                  size: 24.r,
                                )
                              : InkWell(
                                  onTap: () => controller.handleWishlist(index),
                                  child: Icon(
                                    // controller.topCars[index].isFav
                                    //     ? Icons.favorite
                                    //     :
                                    Icons.favorite_border_outlined,
                                    color: AppColors.primaryColor,
                                    size: 24.r,
                                  )),
                        )
                      ],
                    ),
                    Text(
                      controller.carsView[index].productTitle,
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
        SizedBox(
          height: 10.h,
        ),
        controller.paginationStatusRequest == StatusRequest.loading
            ? Lottie.asset("assets/lottie/loading.json",
                height: 50.h, fit: BoxFit.fitHeight)
            : const SizedBox()
      ],
    );
  }
}
