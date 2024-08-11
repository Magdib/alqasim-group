import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/modules/account/model/tickets_model.dart';
import 'package:file_picker/file_picker.dart';

class TicketsPageController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController subjectController;
  late TextEditingController messageController;
  List<TicketModel> tickets = [];
  bool isFileSelected = false;
  pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["zip"]);
    if (result != null) {
      File file = File(result.files.single.path!);
      isFileSelected = true;
      update();
    }
  }

  addTicket() {
    if (subjectController.text.isNotEmpty &&
        messageController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      Get.back();
      tickets.add(TicketModel(
          ticketId: "${tickets.length + 1}",
          subject: subjectController.text,
          status: "قيد المراجعة".tr,
          message: messageController.text));
      subjectController.clear();
      messageController.clear();
      isFileSelected = false;
      update();
    } else {
      AppToasts.errorToast("الرجاء ملئ الحقول المطلوبة".tr);
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    subjectController = TextEditingController();
    messageController = TextEditingController();
    super.onInit();
  }
}
