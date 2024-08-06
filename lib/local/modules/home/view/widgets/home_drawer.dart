import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/dividers/custom_horizontal_divider.dart';

import 'al_qassim_logo_card.dart';
import 'services_drawer_row.dart';

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
          const AlQassemLogoCard(),
          const SizedBox(
            height: 20,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => controller
                          .drawerItems[index].isDropDown ==
                      null
                  ? InkWell(
                      onTap: () => controller.handleDrawerNavigation(index),
                      child: Text(
                        controller.drawerItems[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    )
                  : ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      minTileHeight: 30,
                      title: Text(
                        controller.drawerItems[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      shape: const Border(),
                      childrenPadding: const EdgeInsets.symmetric(vertical: 10),
                      children: [
                        const ServicesDrawerRow(
                          index: 0,
                        ),
                        const ServicesDrawerRow(
                          index: 1,
                        ),
                        const ServicesDrawerRow(
                          index: 2,
                        ),
                        const ServicesDrawerRow(
                          index: 3,
                        ),
                        const ServicesDrawerRow(
                          index: 4,
                        ),
                        GetBuilder<MainPageController>(
                          builder: (controller) => AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            margin: EdgeInsets.only(
                                top: controller.drawerSelectedServices == null
                                    ? 0
                                    : 20),
                            height: controller.drawerSelectedServices == null
                                ? 0
                                : 50,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 60),
                              child: ButtonWithIcon(
                                  title: "طلب الخدمة",
                                  icon: Icons.telegram_outlined,
                                  onPressed: () {}),
                            ),
                          ),
                        ),
                      ],
                    ),
              separatorBuilder: (context, index) => Column(
                    children: [
                      SizedBox(
                        height: controller.drawerItems[index].isDropDown == null
                            ? 5
                            : 0,
                      ),
                      const CustomHorizontalDivider(),
                      SizedBox(
                        height: index != 2 ? 5 : 0,
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
                  buttonWidth: AppSize.screenWidth(context) / 2.5,
                  buttonColor: AppColors.white,
                  textColor: AppColors.primaryColor,
                  isReverseColor: true,
                  onTap: () => Get.toNamed(AppRoutes.signInPageRoute)),
              const SizedBox(
                width: 12,
              ),
              CustomButton(
                  buttonBody: "اشتراك",
                  buttonWidth: AppSize.screenWidth(context) / 4,
                  buttonColor: AppColors.white,
                  textColor: AppColors.primaryColor,
                  isReverseColor: true,
                  onTap: () => Get.toNamed(AppRoutes.signUpPageRoute)),
            ],
          )
        ]));
  }
}
