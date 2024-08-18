import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/arguments_names.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/account/controller/account_controller.dart';
import 'package:proj/local/modules/account/model/account_pages_model.dart';
import 'package:proj/local/view/widgets/dividers/custom_horizontal_divider.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.dataList,
  });
  final List<AccountPagesModel> dataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [BoxShadow(color: AppColors.lBlack, blurRadius: 4.r)]),
      child: Column(
        children: [
          GetBuilder<AccountController>(
            builder: (controller) => ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  const CustomHorizontalDivider(),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
              itemCount: dataList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: dataList[index].title == "تسجيل الخروج".tr
                    ? () => controller.logout()
                    : dataList[index].link == null
                        ? () {
                            if (dataList[index].route! ==
                                AppRoutes.signInPageRoute) {
                              AppToasts.errorToast(
                                  "قم بتسجيل الدخول للمتابعة".tr);
                            }
                            Get.toNamed(dataList[index].route!);
                          }
                        : () => Get.toNamed(AppRoutes.inAppWebViewPageRoute,
                                arguments: {
                                  ArgumentsNames.webViewLink:
                                      dataList[index].link,
                                }),
                child: Row(
                  children: [
                    Icon(
                      dataList[index].icon,
                      color: AppColors.primaryColor,
                      size: 25.r,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(dataList[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          const CustomHorizontalDivider()
        ],
      ),
    );
  }
}
