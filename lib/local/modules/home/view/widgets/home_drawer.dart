import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        width: 304.0.w,
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            children: [
              SizedBox(
                height: 20.h,
              ),
              const AlQassemLogoCard(),
              SizedBox(
                height: 20.h,
              ),
              GetBuilder<MainPageController>(
                builder: (controller) => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => controller
                                .drawerItems[index].isDropDown ==
                            null
                        ? InkWell(
                            onTap: () =>
                                controller.handleDrawerNavigation(index),
                            child: Text(
                              controller.drawerItems[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp),
                            ),
                          )
                        : ExpansionTile(
                            tilePadding: EdgeInsets.zero,
                            minTileHeight: 30.h,
                            title: Text(
                              controller.drawerItems[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp),
                            ),
                            shape: const Border(),
                            childrenPadding:
                                EdgeInsets.symmetric(vertical: 10.h),
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
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                margin: EdgeInsets.only(
                                    top: controller.drawerSelectedServices ==
                                            null
                                        ? 0
                                        : 20.h),
                                height:
                                    controller.drawerSelectedServices == null
                                        ? 0
                                        : 50.h,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 60.w),
                                  child: ButtonWithIcon(
                                      title: "طلب الخدمة".tr,
                                      icon: Icons.telegram_outlined,
                                      onPressed:
                                          controller.drawerSelectedServices !=
                                                  null
                                              ? () => controller.askForService(
                                                  controller
                                                      .drawerSelectedServices!)
                                              : () {}),
                                ),
                              ),
                            ],
                          ),
                    separatorBuilder: (context, index) => Column(
                          children: [
                            SizedBox(
                              height:
                                  controller.drawerItems[index].isDropDown ==
                                          null
                                      ? 5.h
                                      : 0,
                            ),
                            const CustomHorizontalDivider(),
                            SizedBox(
                              height: index != 2 ? 5.h : 0,
                            ),
                          ],
                        ),
                    itemCount: 5),
              ),
              SizedBox(
                height: 5.h,
              ),
              const CustomHorizontalDivider(),
              SizedBox(
                height: 10.h,
              ),
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: "عربي",
                          height: kMinInteractiveDimension.h,
                          child: Text(
                            "عربي",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 14.sp),
                          ),
                        ),
                        PopupMenuItem(
                          value: "English",
                          height: kMinInteractiveDimension.h,
                          child: Text(
                            "English",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 14.sp),
                          ),
                        ),
                      ],
                  onSelected: (value) => controller.changeLanguage(value),
                  splashRadius: 0,
                  tooltip: "",
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(
                      Icons.language_outlined,
                      size: 24.r,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GetBuilder<MainPageController>(
                      builder: (controller) => Text(
                        controller.selectedLocal == "en" ? "English" : "عربي",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 14.sp),
                      ),
                    ),
                  ])),
              SizedBox(
                height: 20.h,
              ),
              GetBuilder<MainPageController>(
                builder: (controller) => controller.showLoginData
                    ? Row(
                        children: [
                          CustomButton(
                              buttonBody: "تسجيل الدخول".tr,
                              buttonWidth: AppSize.screenWidth(context) / 2.5,
                              buttonColor: AppColors.white,
                              textColor: AppColors.primaryColor,
                              isReverseColor: true,
                              onTap: () =>
                                  Get.toNamed(AppRoutes.signInPageRoute)),
                          SizedBox(
                            width: 12.w,
                          ),
                          CustomButton(
                              buttonBody: "اشتراك".tr,
                              buttonWidth: AppSize.screenWidth(context) / 4,
                              buttonColor: AppColors.white,
                              textColor: AppColors.primaryColor,
                              isReverseColor: true,
                              onTap: () =>
                                  Get.toNamed(AppRoutes.signUpPageRoute)),
                        ],
                      )
                    : const SizedBox(),
              )
            ]));
  }
}
