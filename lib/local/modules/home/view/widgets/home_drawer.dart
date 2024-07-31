import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/dividers/custom_horizontal_divider.dart';

class HomeDrawer extends GetView<MainPageController> {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.lGreyD),
            child: Image.asset(
              AppImages.logo,
              height: 40,
              fit: BoxFit.fitHeight,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                    onTap: () => controller.handleDrawerNavigation(index),
                    child: Text(
                      controller.drawerItems[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
              separatorBuilder: (context, index) => const Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      CustomHorizontalDivider(),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
              itemCount: 5),
          const SizedBox(
            height: 5,
          ),
          const CustomHorizontalDivider(),
          const SizedBox(
            height: 10,
          ),
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: "عربي",
                      child: Text(
                        "عربي",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    PopupMenuItem(
                      value: "English",
                      child: Text(
                        "English",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ],
              splashRadius: 0,
              tooltip: "",
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Icon(
                  Icons.language_outlined,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "عربي",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ])),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              CustomButton(
                  buttonBody: "تسجيل الدخول",
                  buttonWidth: AppSize.screenWidth / 2.5,
                  buttonColor: AppColors.white,
                  textColor: AppColors.primaryColor,
                  isReverseColor: true,
                  onTap: () => Get.toNamed(AppRoutes.signInPageRoute)),
              const SizedBox(
                width: 12,
              ),
              CustomButton(
                  buttonBody: "اشتراك",
                  buttonWidth: AppSize.screenWidth / 4,
                  buttonColor: AppColors.white,
                  textColor: AppColors.primaryColor,
                  isReverseColor: true,
                  onTap: () => Get.toNamed(AppRoutes.signUpPageRoute)),
            ],
          )
        ]));
  }
}
