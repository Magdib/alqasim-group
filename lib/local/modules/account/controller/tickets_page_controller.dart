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
import 'package:proj/local/modules/auth/login/model/login_model.dart';

class TicketsPageController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController subjectController;
  late TextEditingController messageController;
  late ScrollController scrollController;
  List<SupportTicketsModel> tickets = [];
  List<SupportTicketsModel> ticketsView = [];
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest paginationStatusRequest = StatusRequest.loading;
  StatusRequest addTicketStatusRequest = StatusRequest.none;
  bool gettingData = false;
  bool isFileSelected = false;
  String? nextPageUrl;
  String token = Hive.box(HiveBoxes.authBox).get(HiveKeys.token);
  File? attachmentFile;
  LoginModel loginData = Hive.box<LoginModel>(HiveBoxes.loginDataBox).getAt(0)!;
  pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["zip"]);
    if (result != null) {
      File file = File(result.xFiles.single.path);
      if (await file.length() <= 20971520) {
        isFileSelected = true;

        attachmentFile = file;
      } else {
        AppToasts.errorToast("حجم الملف أكبر من الحد المسموح".tr);
      }
      update();
    }
  }

  addTicket() async {
    if (subjectController.text.isNotEmpty &&
        messageController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      addTicketStatusRequest = StatusRequest.loading;
      update();

      SupportTicketData supportTicketData = SupportTicketData(Get.find());
      var response = await supportTicketData.addSupportTicket(
          getLanguage().languageCode,
          emailController.text,
          subjectController.text,
          messageController.text,
          isFileSelected ? attachmentFile!.path : null,
          token);
      response.fold((tl) {
        addTicketStatusRequest = StatusRequest.none;
        update();
        AppToasts.errorToast(tl.message);
      }, (tr) async {
        Map<String, dynamic> jsonData = tr['data'];
        if (nextPageUrl == null) {
          tickets.add(SupportTicketsModel.fromJson(jsonData));
          ticketsView.add(SupportTicketsModel.fromJson(jsonData));
        }
        addTicketStatusRequest = StatusRequest.none;
        AppToasts.successToast(tr['message']);

        subjectController.clear();
        messageController.clear();
        isFileSelected = false;
        Get.back();
        update();
      });
    } else {
      AppToasts.errorToast("الرجاء ملئ الحقول المطلوبة".tr);
    }
  }

  searchTickets(String val) {
    if (val.isNotEmpty) {
      paginationStatusRequest = StatusRequest.none;
      ticketsView = tickets
          .where(
            (ticket) =>
                ticket.description!.isCaseInsensitiveContains(val) ||
                ticket.subject!.isCaseInsensitiveContains(val),
          )
          .toList();
    } else {
      ticketsView = tickets;

      paginationStatusRequest = StatusRequest.loading;
    }
    update();
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
      ticketsView =
          jsonData.map((e) => SupportTicketsModel.fromJson(e)).toList();
      statusRequest = StatusRequest.none;
      update();
      scrollController.addListener(() => handlePagination());
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
          scrollController.animateTo(
              scrollController.position.maxScrollExtent - 120,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn);
          AppToasts.errorToast(tl.message);
        }, (tr) async {
          List jsonData = tr['data'];
          nextPageUrl = tr['meta']['nextPageUrl'];
          tickets.addAll(
              jsonData.map((e) => SupportTicketsModel.fromJson(e)).toList());
          ticketsView.addAll(
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
    emailController = TextEditingController(text: loginData.email);
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
