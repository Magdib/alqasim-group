import 'package:flutter/material.dart';
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
      height: 170,
      margin: const EdgeInsets.all(10),
      child: GetBuilder<MainPageController>(
        builder: (controller) => ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller.categoriesScrollController,
            itemCount: controller.categoriesListView.length + 1,
            itemBuilder: (context, index) =>
                index == controller.categoriesListView.length
                    ? controller.categoriesStatusRequest == StatusRequest.none
                        ? SizedBox()
                        : Lottie.asset("assets/lottie/loading.json",
                            width: AppSize.screenWidth(context) / 4,
                            fit: BoxFit.fitWidth)
                    : Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          CatContainer(
                            image: controller.categoriesListView[index].image,
                            title: controller.categoriesListView[index].name,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      )
            //handle when translate

            ),
      ),
    );
  }
}
