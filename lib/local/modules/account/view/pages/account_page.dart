import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/account/controller/account_controller.dart';
import 'package:proj/local/modules/account/view/widgets/account_card.dart';
import 'package:proj/local/modules/account/view/widgets/account_image_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          child: Stack(
            children: [
              const AccountImageView(),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin:
                      EdgeInsets.only(top: AppSize.screenHight(context) / 4.6),
                  width: AppSize.screenWidth(context) / 1.1,
                  child: Column(
                    children: [
                      GetBuilder<AccountController>(
                        builder: (controller) => AccountCard(
                          dataList: controller.upperList,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.screenWidth(context) * 0.05,
          ),
          child: SizedBox(
            child: GetBuilder<AccountController>(
              builder: (controller) => AccountCard(
                dataList: controller.lowerList,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
