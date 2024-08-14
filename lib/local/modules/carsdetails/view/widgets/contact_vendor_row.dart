import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';

class ContactVendorRow extends GetView<CarDetailsController> {
  const ContactVendorRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonWithIcon(
          title: "اتصل الآن".tr,
          icon: Icons.call,
          reverse: getLanguage() == Locale("en"),
          onPressed: () => controller.openCallApp(),
        ),
        SizedBox(
          width: 10.w,
        ),
        ButtonWithIcon(
          title: "عبر واتساب".tr,
          icon: FontAwesome.whatsapp_brand,
          reverse: getLanguage() == Locale("en"),
          color: AppColors.deepGreen,
          onPressed: () => controller.openWhatsApp(),
        ),
      ],
    );
  }
}
