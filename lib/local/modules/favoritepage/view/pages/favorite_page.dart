import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/Local/Core/Constant/Colors.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/favoritepage/controller/favorite_Page_controller.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class FavoritePage extends GetView<FavoritePageController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(10).w, children: [
      SizedBox(
        height: 10.h,
      ),
      CustomTextFormField(
        hint: "أدخل اسم السيارة هنا...".tr,
        icon: Icon(
          Icons.search,
          size: 24.r,
        ),
        textInputAction: TextInputAction.search,
        onChange: (value) => controller.filterCars(value),
      ),
      SizedBox(
        height: 20.h,
      ),
      GetBuilder<FavoritePageController>(
          builder: (controller) => ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(
                    height: 20.h,
                  ),
              itemCount: controller.viewCars.length,
              itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.viewCars[index].filterTitle}:",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 184.h,
                          child: ListView.separated(
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
                                Container(
                                    width:
                                        AppSize.screenWidth(context) / 2 - 15,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: CustomCachedNetImage(
                                      imageUrl: controller.viewCars[index]
                                          .cars[subIndex].featureImage,
                                      canReDownload: false,
                                      fit: BoxFit.cover,
                                      borderRadius: 8.r,
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  width: AppSize.screenWidth(context) / 2 - 15,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.viewCars[index]
                                                .cars[subIndex].symbolPrice,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.sp),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                // controller.handleFav(index)
                                              },
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
                                        controller.viewCars[index]
                                            .cars[subIndex].productTitle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
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
                        )
                      ])))
    ]);
  }
}
