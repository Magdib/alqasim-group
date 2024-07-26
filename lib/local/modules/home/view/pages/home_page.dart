import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/controllers/main_page_controller.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/app_statics.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/view/widgets/top_car.dart';

import '../widgets/cat_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        elevation: 10,
        shadowColor: AppColors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.asset(
              "assets/images/logo2.webp",
              width: AppSize.screenWidth / 2,
              fit: BoxFit.fitWidth,
              color: AppColors.primaryColor,
            ),
          ),
        ],
        toolbarHeight: 60,
        backgroundColor: AppColors.white,
      ),
      drawer: const Drawer(),
      body: GetBuilder<MainPageController>(
        builder: (controller) => ListView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: [
            SizedBox(
              height: 100,
              child: PageView.builder(
                  itemCount: AppStatics.slidablePages.length,
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage(
                                  AppStatics.slidablePages[index]['image']!),
                              fit: BoxFit.cover,
                              opacity: 0.8)),
                      child: Center(
                        child: Text(
                          AppStatics.slidablePages[index]['text']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Schyler"),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 20),
            const Text(
              "التصنيفات المشهورة",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Schyler"),
            ),
            Container(
              width: AppSize.screenWidth,
              height: 170,
              margin: const EdgeInsets.all(10),
              child: PageView.builder(
                itemCount: controller.categories.length ~/ 2,
                itemBuilder: (context, index) => Row(
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
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "أفضل مركباتنا المميزة",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Schyler"),
            ),
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
            const SizedBox(height: 10),
            const Text(
              "علاماتنا التجارية",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Schyler"),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              width: AppSize.screenWidth,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: controller.brandsImages.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 30,
                ),
                itemBuilder: (context, index) => Container(
                  width: AppSize.screenWidth / 5,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(
                          controller.brandsImages[index],
                        ),
                        fit: BoxFit.fitWidth,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
