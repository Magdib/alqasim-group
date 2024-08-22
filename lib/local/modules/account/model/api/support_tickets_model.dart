import 'package:get/get.dart';

class SupportTicketsModel {
  int? id;
  int? userId;
  String? email;
  String? subject;
  String? description;
  String? attachment;
  String? status;
  String? lastMessage;

  SupportTicketsModel(
      {this.id,
      this.userId,
      this.email,
      this.subject,
      this.description,
      this.attachment,
      this.status,
      this.lastMessage});

  SupportTicketsModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.userId = json["user_id"];
    this.email = json["email"];
    this.subject = json["subject"] ?? "";
    this.description = json["description"] ?? "";
    this.attachment = json["attachment"];
    this.status = json["status"] == 1
        ? "معلّقة".tr
        : json["status"] == 0
            ? "مغلقة".tr
            : "مفتوحة".tr;
    this.lastMessage = json["last_message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["user_id"] = this.userId;
    data["email"] = this.email;
    data["subject"] = this.subject;
    data["description"] = this.description;
    data["attachment"] = this.attachment;
    data["status"] = this.status;
    data["last_message"] = this.lastMessage;
    return data;
  }
}
