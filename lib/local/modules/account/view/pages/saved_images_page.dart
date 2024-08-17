import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/modules/account/controller/saved_images_controller.dart';
import 'package:proj/local/view/shared/app_bottom_nav_bar.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';
import 'package:proj/local/view/shared/empty_data_widget.dart';

class SavedImagesPage extends StatelessWidget {
  const SavedImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AppBottomNavBar(),
        body: CustomScrollView(slivers: <Widget>[
          CarSliverAppBar(title: "الصور المحفوظة".tr),
          GetBuilder<SavedImagesController>(builder: (controller) {
            return SliverList(
                delegate: SliverChildListDelegate([
              controller.cars.isEmpty
                  ? const EmptyDataWidget()
                  : ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 20.h),
                      itemCount: controller.cars.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20.h,
                      ),
                      itemBuilder: (context, index) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                onPressed: () =>
                                    controller.deleteCarImages(index),
                                minWidth: 40,
                                padding: EdgeInsets.zero,
                                color: AppColors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                    side: BorderSide(
                                        color: AppColors.lGreyD, width: 2.5.w)),
                                child: Icon(
                                  Icons.close,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                ":${controller.cars[index].carName}",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.cars[index].images.length,
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.5,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemBuilder: (context, subIndex) =>
                                CustomCachedNetImage(
                              imageUrl: controller.cars[index].images[subIndex],
                              errorWidget: (p0, p1, p2) =>
                                  controller.handleDeleteCar(context, index),
                              canReDownload: false,
                              width: AppSize.screenWidth(context) / 3,
                              height: 100.h,
                              borderRadius: 8.r,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    )
            ]));
          })
        ]));
  }
}
