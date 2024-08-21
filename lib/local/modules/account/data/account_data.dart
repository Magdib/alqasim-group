import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/dio_crud.dart';
import 'package:proj/local/core/api/api_links.dart';

class AccountData {
  DioCrud crud;
  AccountData(this.crud);

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> uploadUserImage(
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
