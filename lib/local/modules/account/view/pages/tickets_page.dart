import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/account/controller/tickets_page_controller.dart';
import 'package:proj/local/modules/account/view/widgets/custom_table_widget.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      CarSliverAppBar(title: "تذاكر الدعم الفني".tr),
      GetBuilder<TicketsPageController>(
          builder: (controller) => SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "تذاكر الدعم الفني:".tr,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: CustomButton(
                              buttonBody: "تسجيل تذكرة".tr,
                              buttonWidth: AppSize.screenWidth(context) / 3,
                              height: 40,
                              onTap: () =>
                                  Get.toNamed(AppRoutes.addTicketPageRoute),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        hint: "البحث عن تذكرة...".tr,
                        icon: Icon(Icons.search),
                        textInputAction: TextInputAction.search,
                      ),
                      const SizedBox(
                        height: 5,
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
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.black),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    )),
                                child: Text(
                                  "لا يوجد بيانات لعرضها".tr,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: AppColors.grey,
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
                      )
                    ],
                  ),
                )
              ])))
    ]));
  }
}
