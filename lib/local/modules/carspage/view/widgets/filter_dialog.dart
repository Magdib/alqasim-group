import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carspage/controller/cars_page_controller.dart';
import 'package:proj/local/view/shared/handiling_data_widget.dart';
import 'package:proj/local/view/widgets/app_bar/custom_app_bar.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

import 'brand_grid_view_filter.dart';
import 'filter_form_column.dart';
import 'filter_grid_view.dart';

filterDialog(BuildContext context) {
  return Get.dialog(GetBuilder<CarsPageController>(
    builder: (controller) => PopScope(
      onPopInvoked: (didPop) => controller.handlePop(),
      child: Scaffold(
        appBar: customAppBar(
            context: context,
            title: "الفلاتر".tr,
            leading: IconButton(
                onPressed: () {
                  controller.handlePop();
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 24.r,
                ))),
        body: HandlingDataRequest(
          onTap: () => controller.getData(true),
          statusRequest: controller.dialogStatusRequest,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            children: [
              SizedBox(
                height: 20.h,
              ),
              FilterGridView(),
              FilterFormColumn(
                title: "عنوان السيارة".tr,
                hint: "البحث عن طريق عنوان السيارة".tr,
              ),
              FilterFormColumn(
                title: "موقع".tr,
                hint: "البحث بالموقع".tr,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "العلامات التجارية:".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 14.sp),
              ),
              const BrandGridViewFilter(),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "التسعير:".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 14.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: AppSize.screenWidth(context) / 3,
                    child: CustomTextFormField(
                      hint: "أقل سعر".tr,
                      textEditingController: controller.lowestPrice,
                      inputType: TextInputType.number,
                      focusedColor: AppColors.green,
                      textColor: AppColors.green,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.screenWidth(context) / 3,
                    child: CustomTextFormField(
                      hint: "أعلى سعر".tr,
                      textEditingController: controller.highestPrice,
                      inputType: TextInputType.number,
                      focusedColor: AppColors.red,
                      textColor: AppColors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: ButtonWithIcon(
                  minWidth: AppSize.screenWidth(context) / 2,
                  icon: Icons.sync_outlined,
                  title: "إعادة ضبط الجميع".tr,
                  reverse: true,
                  onPressed: () => controller.initializeData(),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  ));
}
