import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/core/class/custom_icons.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carspage/controller/cars_page_controller.dart';
import 'package:proj/local/modules/carspage/view/widgets/filters_cars_grid_view.dart';
import 'package:proj/local/modules/carspage/view/widgets/filters_view.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';
import 'package:proj/local/view/shared/empty_data_widget.dart';
import 'package:proj/local/view/shared/handiling_data_widget.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';
import '../widgets/empty_search_widget.dart';
import '../widgets/filter_dialog.dart';

class CarsPage extends GetView<CarsPageController> {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10).w,
      child: ListView(
        controller: controller.scrollController,
        children: [
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            hint: "أدخل اسم السيارة هنا...".tr,
            textEditingController: controller.carTitle,
            onChange: (p0) => controller.onChangeTitle(),
            onFieldSubmitted: controller.filterValues.isEmpty
                ? (p0) => controller.filterByName()
                : (val) => controller.filterCars(),
            icon: Icon(
              Icons.search,
              size: 24.r,
            ),
            textInputAction: TextInputAction.search,
            suffixIcon: IconButton(
                onPressed: () => filterDialog(context),
                icon: Icon(
                  CustomIcons.filter,
                  size: 24.r,
                )),
          ),
          const FiltersView(),
          SizedBox(
            height: 10.h,
          ),
          GetBuilder<CarsPageController>(
            builder: (controller) => HandlingScrollDataRequest(
              statusRequest: controller.statusRequest,
              onTap: () => controller.filterByName(),
              child: controller.carsView.isNotEmpty
                  ? FiltersCarsGridView()
                  : controller.filterValues.isEmpty
                      ? const EmptySearchWidget()
                      : const EmptyDataWidget(),
            ),
          )
        ],
      ),
    );
  }
}
