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
      String language, String image, String token) async {
    return await crud.post(
      linkUrl: ApiLinks.uploadUserImageApi,
      parameters: {"language": language},
      data: {
        "image": await MultipartFile.fromFile(
          image,
        ),
      },
      token: token,
      isAuthorized: true,
    );
  }
}
