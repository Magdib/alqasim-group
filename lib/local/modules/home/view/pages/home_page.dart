import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/app_statics.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/modules/home/view/widgets/al_qassim_logo_card.dart';
import 'package:proj/local/modules/home/view/widgets/animated_car.dart';
import 'package:proj/local/modules/home/view/widgets/home_categories_view.dart';
import 'package:proj/local/modules/home/view/widgets/home_slider.dart';
import 'package:proj/local/modules/home/view/widgets/home_title.dart';
import 'package:proj/local/modules/home/view/widgets/services_list_view.dart';
import 'package:proj/local/modules/home/view/widgets/social_button.dart';
import 'package:proj/local/modules/home/view/widgets/top_car_card.dart';
import 'package:proj/local/view/shared/handiling_data_widget.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest,
        onTap: () => controller.getData(true),
        child: ListView(
          controller: controller.scrollController,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          children: [
            const HomeSlider(),
            SizedBox(height: 20.h),
            const HomeTitle(title: "التصنيفات المشهورة"),
            const HomeCategoriesView(),
            SizedBox(height: 10.h),
            const HomeTitle(title: "أفضل مركباتنا المميزة"),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: DynamicHeightGridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  builder: (context, index) => TopCarCard(
                        car: controller.topCars[index],
                        addToFav: () => controller.handleFav(index),
                        index: index,
                      ),
                  itemCount: controller.topCars.length,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 10.h,
                  crossAxisCount: 1),
            ),
            SizedBox(height: 30.h),
            const HomeTitle(title: "الخدمات التي نقدّمها"),
            SizedBox(height: 10.h),
            const ServicesListView(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              margin: EdgeInsets.only(
                  top: controller.selectedServices == null ? 0 : 20.h),
              height: controller.selectedServices == null ? 0 : 50.h,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.screenWidth(context) / 4),
                child: ButtonWithIcon(
                    title: "طلب الخدمة".tr,
                    icon: Icons.telegram_outlined,
                    onPressed: controller.selectedServices != null
                        ? () => controller
                            .askForService(controller.selectedServices!)
                        : () {}),
              ),
            ),
            const AnimatedCar(),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15.w),
            //   child: AlQassemLogoCard(),
            // ),
            // const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                "في قائمة سيارة، نقدم مجموعة واسعة من السيارات المستعملة عالية الجودة لتلبية احتياجات قيادتك وميزانيتك. مع سنوات من الخبرة في صناعة السيارات، نفخر بتقديم خدمة عملاء استثنائية والتأكد من أن كل سيارة في قطعتنا تلبي معاييرنا الصارمة للجودة والموثوقية."
                    .tr,
                textAlign: TextAlign.justify,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 14.sp, height: 1.3),
              ),
            ),
            SizedBox(height: 20.h),
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
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
