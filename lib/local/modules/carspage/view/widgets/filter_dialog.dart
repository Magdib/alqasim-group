import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carspage/controller/cars_page_controller.dart';
import 'package:proj/local/view/widgets/app_bar/custom_app_bar.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

import 'brand_grid_view_filter.dart';
import 'filter_form_column.dart';
import 'filter_list_view.dart';

filterDialog(BuildContext context) {
  return Get.dialog(GetBuilder<CarsPageController>(
    builder: (controller) => PopScope(
      onPopInvoked: (didPop) => controller.handlePop(),
      child: Scaffold(
        appBar: customAppBar(
            context: context,
            title: "الفلاتر",
            leading: IconButton(
                onPressed: () {
                  controller.handlePop();
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                ))),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            SizedBox(
              height: 20,
            ),
            FilterGridView(),
            FilterFormColumn(
              title: "عنوان السيارة",
              hint: "البحث عن طريق عنوان السيارة",
            ),
            FilterFormColumn(
              title: "موقع",
              hint: "البحث بالموقع",
            ),
            Text(
              "العلامات التجارية",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 18),
            ),
            const BrandGridViewFilter(),
            const SizedBox(
              height: 10,
            ),
            Text(
              "التسعير",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: AppSize.screenWidth / 3,
                  child: CustomTextFormField(
                    hint: "أقل سعر",
                    textEditingController: controller.lowestPrice,
                    inputType: TextInputType.number,
                    focusedColor: AppColors.green,
                    textColor: AppColors.green,
                  ),
                ),
                SizedBox(
                  width: AppSize.screenWidth / 3,
                  child: CustomTextFormField(
                    hint: "أعلى سعر",
                    textEditingController: controller.highestPrice,
                    inputType: TextInputType.number,
                    focusedColor: AppColors.red,
                    textColor: AppColors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomButton(
                  buttonBody: "",
                  buttonWidth: AppSize.screenWidth / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.sync_outlined,
                        color: AppColors.white,
                      ),
                      Text(
                        "إعادة ضبط الجميع",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppColors.white),
                      )
                    ],
                  ),
                  onTap: () => controller.initializeData()),
            )
          ],
        ),
      ),
    ),
  ));
}
