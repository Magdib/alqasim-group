import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        const CarSliverAppBar(title: "رمز التحقق"),
        SliverList(
            delegate: SliverChildListDelegate([
          const SizedBox(
            height: 80,
          ),
          Image.asset(
            AppImages.otpSImage,
            height: 120,
            width: 60,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "التحقق من الرمز",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 18, color: AppColors.primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "الرجاء إدخال رمز التحقق الذي أرسلناه إلى حسابك في الحقل التالي:",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColors.grey, height: 1.5),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextFormField(
              hint: "XXXXXX",
              maxLength: 6,
              textAlign: TextAlign.center,
              inputType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.screenWidth(context) / 4),
            child: ButtonWithIcon(
                title: "تحقق من الرمز ",
                icon: Icons.check_circle_outline_sharp,
                onPressed: () {}),
          ),
          const SizedBox(
            height: 40,
          )
        ]))
      ],
    ));
  }
}
