import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class CarForms extends StatelessWidget {
  const CarForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(color: AppColors.lBlack, blurRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.webp",
              width: 120,
              fit: BoxFit.fitWidth,
            ),
            Text(
              "admin",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "info@alqassimgroup.net",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              obscure: false,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              hint: "الاسم",
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              obscure: false,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              hint: "عنوان البريد الإلكتروني",
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              obscure: false,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              hint: "رقم الهاتف",
              inputType: TextInputType.phone,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              obscure: false,
              numberOfLines: 5,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              hint: "رسالة...",
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(buttonBody: "إرسال", onTap: () {})
          ],
        ));
  }
}
