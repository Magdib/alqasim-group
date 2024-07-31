import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class ForgotPasswordEmailPage extends StatelessWidget {
  const ForgotPasswordEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        const CarSliverAppBar(title: "التحقق من الحساب"),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: AppSize.screenHight / 10,
          ),
          Image.asset(
            AppImages.otpFImage,
            height: 120,
            width: 60,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "تحقق من الحساب",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "الرجاء إدخال الحساب المراد استعادة كلمة المرور له في الحقل التالي:",
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
              hint: "أدخل الحساب هنا من فضلك...",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.screenWidth / 4),
            child: ButtonWithIcon(
                title: "إرسال الرمز ",
                icon: MingCute.telegram_line,
                onPressed: () {}),
          )
        ]))
      ],
    ));
  }
}