import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

import 'cat_container.dart';

class HomeCategoriesView extends StatelessWidget {
  const HomeCategoriesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth(context),
      height: 175.h,
      margin: EdgeInsets.all(10).w,
      child: GetBuilder<MainPageController>(
        builder: (controller) => ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller.categoriesScrollController,
            itemCount: controller.categoriesData.length + 1,
            itemBuilder: (context, index) =>
                index == controller.categoriesData.length
                    ? controller.categoriesStatusRequest == StatusRequest.none
                        ? SizedBox()
                        : Lottie.asset("assets/lottie/loading.json",
                            width: AppSize.screenWidth(context) / 4,
                            fit: BoxFit.fitWidth)
                    : Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          GestureDetector(
                            onTap: () => controller.goCategoryFilter(index),
                            child: CatContainer(
                              image: controller.categoriesData[index].image,
                              title: controller.categoriesData[index].name,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                        ],
                      )),
      ),
    );
  }
}
