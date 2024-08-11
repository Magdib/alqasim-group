import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/account/model/tickets_model.dart';

import 'custom_table_row.dart';

class CustomTableWidget extends StatelessWidget {
  const CustomTableWidget(
      {super.key, required this.isTitles, this.body, this.isEnd});
  final bool isTitles;
  final bool? isEnd;
  final TicketModel? body;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
          color: AppColors.black,
          borderRadius: BorderRadius.only(
            topLeft: isTitles ? const Radius.circular(4) : Radius.zero,
            topRight: isTitles ? const Radius.circular(4) : Radius.zero,
            bottomLeft: isEnd == true ? const Radius.circular(4) : Radius.zero,
            bottomRight: isEnd == true ? const Radius.circular(4) : Radius.zero,
          )),
      defaultColumnWidth:
          FixedColumnWidth((AppSize.screenWidth(context) / 4) - 5),
      children: [
        TableRow(
            decoration: BoxDecoration(
                color: isTitles ? AppColors.lGreyD : null,
                borderRadius: BorderRadius.circular(6)),
            children: [
              CustomTableRow(
                body: isTitles ? "معرّف التذكرة".tr : body!.ticketId,
                isTitles: isTitles,
                title: "معرّف التذكرة".tr,
              ),
              CustomTableRow(
                body: isTitles ? "الموضوع".tr : body!.subject,
                isTitles: isTitles,
                title: "الموضوع".tr,
              ),
              CustomTableRow(
                body: isTitles ? "الحالة".tr : body!.status,
                isTitles: isTitles,
                title: "الحالة".tr,
              ),
              CustomTableRow(
                body: isTitles ? "الرسالة".tr : body!.message,
                isTitles: isTitles,
                title: "الرسالة".tr,
              ),
            ])
      ],
    );
  }
}
