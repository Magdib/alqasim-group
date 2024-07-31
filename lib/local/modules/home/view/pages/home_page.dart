import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/functions/language/left_right_lang_pad.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/home/view/widgets/cars_brands.dart';
import 'package:proj/local/modules/home/view/widgets/home_slider.dart';
import 'package:proj/local/modules/home/view/widgets/home_title.dart';
import 'package:proj/local/modules/home/view/widgets/top_car.dart';

import '../widgets/cat_container.dart';

class HomePage extends GetView<MainPageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) => ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          const HomeSlider(),
          const SizedBox(height: 20),
          const HomeTitle(title: "التصنيفات المشهورة"),
          Container(
            width: AppSize.screenWidth,
            height: 170,
            margin: const EdgeInsets.all(10),
            child: PageView.builder(
              itemCount: controller.getCategoriesCount(),
              itemBuilder: (context, index) =>
                  controller.handleCategories(index)
                      ? Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            CatContainer(
                              image: index == 0
                                  ? controller.categories[index].image
                                  : controller.categories[index * 2 + 1].image,
                              title: index == 0
                                  ? controller.categories[index].title
                                  : controller.categories[index * 2 + 1].title,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CatContainer(
                              image: index == 0
                                  ? controller.categories[index + 1].image
                                  : controller.categories[index * 2].image,
                              title: index == 0
                                  ? controller.categories[index + 1].title
                                  : controller.categories[index * 2].title,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      //handle when translate
                      : Padding(
                          padding: leftRightLangPad(),
                          child: CatContainer(
                            image: index == 0
                                ? controller.categories[index + 1].image
                                : controller.categories[index * 2].image,
                            title: index == 0
                                ? controller.categories[index + 1].title
                                : controller.categories[index * 2].title,
                          ),
                        ),
            ),
          ),
          const SizedBox(height: 10),
          const HomeTitle(title: "أفضل مركباتنا المميزة"),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopCar(
                  topCar: controller.topCars[0],
                  index: 0,
                ),
                const SizedBox(
                  width: 10,
                ),
                TopCar(topCar: controller.topCars[1], index: 1),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const HomeTitle(title: "علاماتنا التجارية"),
          const SizedBox(height: 10),
          const CarsBrands()
        ],
      ),
    );
  }
}
