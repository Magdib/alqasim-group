import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/arguments_names.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/carspage/controller/seller_page_controller.dart';
import 'package:proj/local/modules/carspage/view/widgets/custom_fix_tab_bar_item.dart';
import 'package:proj/local/modules/carspage/view/widgets/seller_data_view.dart';
import 'package:proj/local/modules/home/view/widgets/grid_car_card.dart';
import 'package:proj/local/view/shared/app_bottom_nav_bar.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/shared/handiling_data_widget.dart';

class SellerCarsPage extends StatelessWidget {
  const SellerCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          CarSliverAppBar(title: "تفاصيل البائع".tr),
          SliverList(
              delegate: SliverChildListDelegate([
            GetBuilder<SellerPageController>(
                builder: (controller) => HandlingScrollDataRequest(
                    statusRequest: controller.statusRequest,
                    child: Column(
                      children: [
                        const SellerDataView(),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: AppSize.screenWidth(context) >=
                                  AppSize.tabletBreakPoint
                              ? 70.h
                              : 50,
                          width: AppSize.screenWidth(context),
                          child: GetBuilder<SellerPageController>(
                            builder: (controller) => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              itemCount: controller.catCars.length,
                              itemBuilder: (context, index) =>
                                  CustomFixTabBarItem(
                                index: index,
                              ),
                            ),
                          ),
                        ),
                        GetBuilder<SellerPageController>(
                          builder: (controller) => Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, right: 10.w, bottom: 20.h),
                            child: DynamicHeightGridView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller
                                    .catCars[controller.selectedIndex]
                                    .cars
                                    .length,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                builder: (context, subIndex) => GridCarCard(
                                    car: controller
                                        .catCars[controller.selectedIndex]
                                        .cars[subIndex],
                                    index: subIndex,
                                    rightPadding:
                                        getLanguage().languageCode == "ar"
                                            ? null
                                            : 23.w,
                                    onTap: () {
                                      Get.toNamed(
                                        AppRoutes.carDetailsPageRoute,
                                        arguments: {
                                          ArgumentsNames.carId: controller
                                              .catCars[controller.selectedIndex]
                                              .cars[subIndex]
                                              .id,
                                          ArgumentsNames.selectedLocal:
                                              getLanguage().languageCode
                                        },
                                      );
                                    },
                                    addToFav: () {})),
                          ),
                        ),
                        // ),
                      ],
                    ),
                    onTap: () => controller.getData()))
          ]))
        ],
      ),
    );
  }
}
