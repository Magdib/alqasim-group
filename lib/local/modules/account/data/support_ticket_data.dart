import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/dio_crud.dart';
import 'package:proj/local/core/api/api_links.dart';

class SupportTicketData {
  DioCrud crud;
  SupportTicketData(this.crud);

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getSupportTickets(
      String language, String token, String? nextPageUrl) async {
    return await crud.get(
      linkUrl: nextPageUrl ?? ApiLinks.getSupportTickets,
      parameters: {"language": language, "items_per_page": "10"},
      token: token,
      isAuthorized: true,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> addSupportTicket(
    String language,
    String email,
    String subject,
    String description,
    String? attachment,
    String token,
  ) async {
    FormData? data;
    if (attachment != null) {
      data = FormData.fromMap({
        "email": email,
        "subject": subject,
        "description": description,
        'attachment': await MultipartFile.fromFile(
          attachment,
          filename: attachment.split('/').last,
        )
      });
    }
    return await crud.post(
      linkUrl: ApiLinks.addSupportTicketApi,
      parameters: {"language": language},
      data: attachment != null
          ? data
          : {
              "email": email,
              "subject": subject,
              "description": description,
            },
      token: token,
      isAuthorized: true,
    );
  }
}
