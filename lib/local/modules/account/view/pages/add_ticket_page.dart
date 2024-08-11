import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/account/controller/tickets_page_controller.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class AddTicketPage extends GetView<TicketsPageController> {
  const AddTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      CarSliverAppBar(title: "قم بإنشاء تذكرة دعم".tr),
      SliverList(
          delegate: SliverChildListDelegate([
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                " عنوان البريد الإلكتروني*:".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 14),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                hint: "أدخل البريد الإلكتروني هنا...".tr,
                textEditingController: controller.emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                " الموضوع*:".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 14),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                hint: "أدخل موضوع التذكرة هنا...".tr,
                textEditingController: controller.subjectController,
              ),
              const SizedBox(height: 10),
              Text(
                " الرسالة*:".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 14),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                hint: "أدخل رسالتك هنا...".tr,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                textEditingController: controller.messageController,
                numberOfLines: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "إرفاق ملف:".tr,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CustomButton(
                      buttonBody: "تحديد ملف".tr,
                      buttonWidth: AppSize.screenWidth(context) / 3,
                      height: 40,
                      onTap: () => controller.pickFile(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 2.5,
              ),
              GetBuilder<TicketsPageController>(
                builder: (controller) => controller.isFileSelected == false
                    ? Text(
                        "أقصى حجم للتحميل هو 20 ميغا بايت ويسمح فقط بملف مضغوط من نوع zip."
                            .tr,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppColors.red),
                      )
                    : Row(
                        children: [
                          Text(
                            "تمت إضافة ملف بنجاح ".tr,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: AppColors.primaryColor),
                          ),
                          const Icon(
                            Icons.check_circle_outline_outlined,
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.center,
                  child: GetBuilder<TicketsPageController>(
                    builder: (controller) => CustomButton(
                        buttonBody: "تقديم الطلب".tr,
                        height: 45,
                        buttonWidth: AppSize.screenWidth(context) / 2,
                        onTap: () => controller.addTicket()),
                  ))
            ]))
      ]))
    ]));
  }
}
