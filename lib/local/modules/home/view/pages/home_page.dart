import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/app_statics.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/modules/home/view/widgets/al_qassim_logo_card.dart';
import 'package:proj/local/modules/home/view/widgets/animated_car.dart';
import 'package:proj/local/modules/home/view/widgets/home_categories_view.dart';
import 'package:proj/local/modules/home/view/widgets/home_slider.dart';
import 'package:proj/local/modules/home/view/widgets/home_title.dart';
import 'package:proj/local/modules/home/view/widgets/grid_car_card.dart';
import 'package:proj/local/modules/home/view/widgets/services_list_view.dart';
import 'package:proj/local/modules/home/view/widgets/social_button.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';

class HomePage extends GetView<MainPageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) => ListView(
        controller: controller.scrollController,
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          const HomeSlider(),
          const SizedBox(height: 20),
          const HomeTitle(title: "التصنيفات المشهورة"),
          const HomeCategoriesView(),
          const SizedBox(height: 10),
          const HomeTitle(title: "أفضل مركباتنا المميزة"),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GridCarCard(
                  car: controller.topCars[0],
                  addToFav: () => controller.handleFav(0),
                  index: 0,
                ),
                const SizedBox(
                  width: 10,
                ),
                GridCarCard(
                  car: controller.topCars[1],
                  index: 1,
                  addToFav: () => controller.handleFav(1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const HomeTitle(title: "الخدمات التي نقدّمها"),
          const SizedBox(height: 10),
          const ServicesListView(),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            margin: EdgeInsets.only(
                top: controller.selectedServices == null ? 0 : 20),
            height: controller.selectedServices == null ? 0 : 50,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.screenWidth(context) / 4),
              child: ButtonWithIcon(
                  title: "طلب الخدمة",
                  icon: Icons.telegram_outlined,
                  onPressed: () {}),
            ),
          ),
          const AnimatedCar(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: AlQassemLogoCard(),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "في قائمة سيارة، نقدم مجموعة واسعة من السيارات المستعملة عالية الجودة لتلبية احتياجات قيادتك وميزانيتك. مع سنوات من الخبرة في صناعة السيارات، نفخر بتقديم خدمة عملاء استثنائية والتأكد من أن كل سيارة في قطعتنا تلبي معاييرنا الصارمة للجودة والموثوقية.",
              textAlign: TextAlign.justify,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 14, height: 1.3),
            ),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SocialButton(
              alQassemSocial: AppStatics.alQassimSocials[0],
              index: 0,
            ),
            SocialButton(
              alQassemSocial: AppStatics.alQassimSocials[1],
              index: 1,
            ),
            SocialButton(
              alQassemSocial: AppStatics.alQassimSocials[2],
              index: 2,
            ),
          ]),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
