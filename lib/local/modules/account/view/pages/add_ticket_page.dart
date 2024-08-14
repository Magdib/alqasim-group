import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                " عنوان البريد الإلكتروني*:".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                hint: "أدخل البريد الإلكتروني هنا...".tr,
                textEditingController: controller.emailController,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                " الموضوع*:".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                hint: "أدخل موضوع التذكرة هنا...".tr,
                textEditingController: controller.subjectController,
              ),
              SizedBox(height: 10.h),
              Text(
                " الرسالة*:".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                hint: "أدخل رسالتك هنا...".tr,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
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
                    padding: EdgeInsets.only(top: 10.h),
                    child: CustomButton(
                      buttonBody: "تحديد ملف".tr,
                      buttonWidth: AppSize.screenWidth(context) / 3,
                      height: 40.h,
                      onTap: () => controller.pickFile(),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.5.h,
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
              SizedBox(
                height: 15.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: GetBuilder<TicketsPageController>(
                    builder: (controller) => CustomButton(
                        buttonBody: "تقديم الطلب".tr,
                        height: 45.h,
                        buttonWidth: AppSize.screenWidth(context) / 2,
                        onTap: () => controller.addTicket()),
                  ))
            ]))
      ]))
    ]));
  }
}
