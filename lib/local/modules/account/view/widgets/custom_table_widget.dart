import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/account/model/api/support_tickets_model.dart';

import 'custom_table_row.dart';

class CustomTableWidget extends StatelessWidget {
  const CustomTableWidget(
      {super.key, required this.isTitles, this.body, this.isEnd});
  final bool isTitles;
  final bool? isEnd;
  final SupportTicketsModel? body;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
          color: AppColors.black,
          borderRadius: BorderRadius.only(
            topLeft: isTitles ? Radius.circular(4.r) : Radius.zero,
            topRight: isTitles ? Radius.circular(4.r) : Radius.zero,
            bottomLeft: isEnd == true ? Radius.circular(4.r) : Radius.zero,
            bottomRight: isEnd == true ? Radius.circular(4.r) : Radius.zero,
          )),
      defaultColumnWidth:
          FixedColumnWidth((AppSize.screenWidth(context) / 4) - 5.w),
      children: [
        TableRow(
            decoration: BoxDecoration(
                color: isTitles ? AppColors.lGreyD : null,
                borderRadius: BorderRadius.circular(6.r)),
            children: [
              CustomTableRow(
                body: isTitles ? "معرّف التذكرة".tr : body!.id.toString(),
                isTitles: isTitles,
                title: "معرّف التذكرة".tr,
              ),
              CustomTableRow(
                body: isTitles ? "الموضوع".tr : body!.subject!,
                isTitles: isTitles,
                title: "الموضوع".tr,
              ),
              CustomTableRow(
                body: isTitles ? "الحالة".tr : (body!.status == "1" ? "" : ""),
                isTitles: isTitles,
                title: "الحالة".tr,
              ),
              CustomTableRow(
                body: isTitles ? "الرسالة".tr : body!.description!,
                isTitles: isTitles,
                title: "الرسالة".tr,
              ),
            ])
      ],
    );
  }
}
