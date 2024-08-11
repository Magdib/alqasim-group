import 'package:flutter/material.dart';
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " اسم المستخدم:".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hint: "أدخل اسم المستخدم هنا...".tr,
                          textEditingController: controller.userNameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          " الموقع:".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hint: "أدخل موقعك هنا...".tr,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          " رقم الهاتف:".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hint: "أدخل رقم هاتفك هنا...".tr,
                          inputType: TextInputType.phone,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          " كلمة المرور*:".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hint: "أدخل كلمة المرور هنا...".tr,
                          obscure: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          " كلمة المرور الجديدة:".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hint: "أدخل كلمة المرور الجديدة هنا...".tr,
                          obscure: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomButton(
                              buttonBody: "تحديث البيانات".tr,
                              buttonWidth: AppSize.screenWidth(context) / 1.8,
                              height: 42.5,
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
