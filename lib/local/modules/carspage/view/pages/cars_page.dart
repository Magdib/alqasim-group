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
      padding: const EdgeInsets.all(10),
      child: ListView(
        controller: controller.scrollController,
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            hint: "أدخل اسم السيارة هنا...".tr,
            textEditingController: controller.carTitle,
            onChange: (p0) => controller.onChangeTitle(),
            onFieldSubmitted: controller.filterValues.isEmpty
                ? (p0) => controller.filterByName()
                : (val) => controller.filterCars(),
            icon: const Icon(
              Icons.search,
            ),
            textInputAction: TextInputAction.search,
            suffixIcon: IconButton(
                onPressed: () => filterDialog(context),
                icon: const Icon(CustomIcons.filter)),
          ),
          const FiltersView(),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<CarsPageController>(
            builder: (controller) => HandlingScrollDataRequest(
              statusRequest: controller.statusRequest,
              onTap: () => controller.filterByName(),
              child: controller.carsView.isNotEmpty
                  ? Column(
                      children: [
                        DynamicHeightGridView(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.carsView.length,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          builder: (context, index) => GestureDetector(
                            onTap: () => controller
                                .goToDetailsPage(controller.carsView[index].id),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: AppSize.screenWidth(context) / 2 - 15,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: CustomCachedNetImage(
                                    imageUrl:
                                        controller.carsView[index].featureImage,
                                    fit: BoxFit.cover,
                                    canReDownload: false,
                                    borderRadius: 8.r,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: AppSize.screenWidth(context) / 2 - 15,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller
                                                .carsView[index].symbolPrice,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .copyWith(
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          InkWell(
                                              // onTap: () => controller.handleFav(index),
                                              child: Icon(
                                            // controller.topCars[index].isFav
                                            //     ? Icons.favorite
                                            //     :
                                            Icons.favorite_border_outlined,
                                            color: AppColors.primaryColor,
                                          ))
                                        ],
                                      ),
                                      Text(
                                        controller.carsView[index].productTitle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                              fontSize: 11.5,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        controller.paginationStatusRequest ==
                                StatusRequest.loading
                            ? Lottie.asset("assets/lottie/loading.json",
                                height: 50, fit: BoxFit.fitHeight)
                            : const SizedBox()
                      ],
                    )
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
