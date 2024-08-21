import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/class/hive_keys.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/modules/account/data/support_ticket_data.dart';
import 'package:proj/local/modules/account/model/api/support_tickets_model.dart';
import 'package:file_picker/file_picker.dart';

class TicketsPageController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController subjectController;
  late TextEditingController messageController;
  late ScrollController scrollController;
  List<SupportTicketsModel> tickets = [];
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest paginationStatusRequest = StatusRequest.loading;
  bool gettingData = false;
  bool isFileSelected = false;
  String? nextPageUrl;
  String token = Hive.box(HiveBoxes.authBox).get(HiveKeys.token);
  pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["zip"]);
    if (result != null) {
      File file = File(result.files.single.path!);
      if (await file.length() <= 20971520) {
        isFileSelected = true;
      } else {
        AppToasts.errorToast("حجم الملف أكبر من الحد المسموح".tr);
      }
      update();
    }
  }

  addTicket() {
    if (subjectController.text.isNotEmpty &&
        messageController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      Get.back();
      // tickets.add(TicketModel(
      //     ticketId: "${tickets.length + 1}",
      //     subject: subjectController.text,
      //     status: "قيد المراجعة".tr,
      //     message: messageController.text));
      subjectController.clear();
      messageController.clear();
      isFileSelected = false;
      update();
    } else {
      AppToasts.errorToast("الرجاء ملئ الحقول المطلوبة".tr);
    }
  }

  getTickets([bool showLoading = false]) async {
    if (showLoading) {
      statusRequest = StatusRequest.loading;
      update();
    }
    SupportTicketData supportTicketData = SupportTicketData(Get.find());
    var response = await supportTicketData.getSupportTickets(
        getLanguage().languageCode, token, nextPageUrl);
    response.fold((tl) {
      if (tl.runtimeType == NetworkError) {
        statusRequest = StatusRequest.offlineFailure;
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
      AppToasts.errorToast(tl.message);
    }, (tr) async {
      List jsonData = tr['data'];
      nextPageUrl = tr['meta']['nextPageUrl'];
      tickets = jsonData.map((e) => SupportTicketsModel.fromJson(e)).toList();
      statusRequest = StatusRequest.none;
      update();
      scrollController.addListener(()=> handlePagination());
    });
  }

  handlePagination() async {
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      if (nextPageUrl != null && gettingData == false) {
        gettingData = true;
        update();

        SupportTicketData supportTicketData = SupportTicketData(Get.find());
        var response = await supportTicketData.getSupportTickets(
            getLanguage().languageCode, token, nextPageUrl);
        response.fold((tl) {
          if (tl.runtimeType == NetworkError) {
            statusRequest = StatusRequest.offlineFailure;
          } else {
            statusRequest = StatusRequest.failure;
          }
          update();
          AppToasts.errorToast(tl.message);
        }, (tr) async {
          List jsonData = tr['data'];
          nextPageUrl = tr['meta']['nextPageUrl'];
          tickets.addAll(
              jsonData.map((e) => SupportTicketsModel.fromJson(e)).toList());
          if (nextPageUrl == null) {
            paginationStatusRequest = StatusRequest.none;
          }
          update();
        });
      }
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    subjectController = TextEditingController();
    messageController = TextEditingController();
    scrollController = ScrollController();
    getTickets();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
