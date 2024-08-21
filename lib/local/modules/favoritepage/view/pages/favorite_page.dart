import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/favoritepage/controller/favorite_Page_controller.dart';
import 'package:proj/local/modules/favoritepage/view/widgets/wishlist_data_list.dart';
import 'package:proj/local/view/shared/empty_data_widget.dart';
import 'package:proj/local/view/shared/handiling_data_widget.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritePageController>(
      builder: (controller) => HandlingDataRequest(
        onTap: () => controller.initializeData(),
        statusRequest: controller.statusRequest,
        child: controller.cars.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: AppSize.screenHight(context) / 6),
                child: EmptyDataWidget(),
              )
            : ListView(
                padding: EdgeInsets.all(10).w,
                controller: controller.scrollController,
                children: [
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
                    ListView.separated(
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
                                    child: WishlistDataList(index: index),
                                  )
                                ])),
                    controller.paginationStatusRequest == StatusRequest.loading
                        ? Lottie.asset("assets/lottie/loading.json",
                            height: 50.h, fit: BoxFit.fitHeight)
                        : const SizedBox()
                  ]),
      ),
    );
  }
}
