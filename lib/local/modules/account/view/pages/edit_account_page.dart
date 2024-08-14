import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/account/controller/edit_account_controller.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class EditAccountPage extends StatelessWidget {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        CarSliverAppBar(title: "تعديل بيانات الحساب".tr),
        GetBuilder<EditAccountController>(
            builder: (controller) => SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " اسم المستخدم:".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          hint: "أدخل اسم المستخدم هنا...".tr,
                          textEditingController: controller.userNameController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          " الموقع:".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          hint: "أدخل موقعك هنا...".tr,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          " رقم الهاتف:".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          hint: "أدخل رقم هاتفك هنا...".tr,
                          inputType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          " كلمة المرور*:".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          hint: "أدخل كلمة المرور هنا...".tr,
                          obscure: true,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          " كلمة المرور الجديدة:".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          hint: "أدخل كلمة المرور الجديدة هنا...".tr,
                          obscure: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomButton(
                              buttonBody: "تحديث البيانات".tr,
                              buttonWidth: AppSize.screenWidth(context) / 1.8,
                              height: 42.5.h,
                              onTap: () => Get.back()),
                        )
                      ],
                    ),
                  ),
                ])))
      ]),
    );
  }
}
