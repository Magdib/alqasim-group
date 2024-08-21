import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/account/controller/tickets_page_controller.dart';
import 'package:proj/local/modules/account/view/widgets/custom_table_widget.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/shared/handiling_data_widget.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class TicketsPage extends GetView<TicketsPageController> {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            controller: controller.scrollController,
            slivers: <Widget>[
          CarSliverAppBar(title: "تذاكر الدعم الفني".tr),
          SliverList(
              delegate: SliverChildListDelegate([
            GetBuilder<TicketsPageController>(
              builder: (controller) => HandlingScrollDataRequest(
                onTap: () => controller.getTickets(true),
                statusRequest: controller.statusRequest,
                child: Padding(
                  padding: EdgeInsets.all(10).w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "تذاكر الدعم الفني:".tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 16.sp),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: CustomButton(
                              buttonBody: "تسجيل تذكرة".tr,
                              buttonWidth: AppSize.screenWidth(context) / 3,
                              height: 40.h,
                              onTap: () =>
                                  Get.toNamed(AppRoutes.addTicketPageRoute),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        hint: "البحث عن تذكرة...".tr,
                        icon: Icon(
                          Icons.search,
                          size: 24.r,
                        ),
                        textInputAction: TextInputAction.search,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ListView.builder(
                        itemCount: controller.tickets.isEmpty
                            ? 2
                            : controller.tickets.length + 1,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => controller
                                    .tickets.isEmpty &&
                                index == 1
                            ? Container(
                                height: 40.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.black),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(4.r),
                                      bottomRight: Radius.circular(4.r),
                                    )),
                                child: Text(
                                  "لا يوجد تذاكر لعرضها".tr,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: AppColors.grey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                ),
                              )
                            : CustomTableWidget(
                                isTitles: index == 0 ? true : false,
                                isEnd: (index == controller.tickets.length &&
                                        controller.tickets.isNotEmpty)
                                    ? true
                                    : false,
                                body: index == 0
                                    ? null
                                    : controller.tickets[index - 1],
                              ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      if (controller.nextPageUrl != null)
                        Lottie.asset("assets/lottie/loading.json",
                            height: 50.h, fit: BoxFit.fitHeight)
                    ],
                  ),
                ),
              ),
            )
          ]))
        ]));
  }
}
