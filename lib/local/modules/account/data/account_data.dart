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
    FormData data = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        image,
      ),
    });
    return await crud.post(
      linkUrl: ApiLinks.uploadUserImageApi,
      parameters: {"language": language},
      data: data,
      token: token,
      isAuthorized: true,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> uploadUserBackImage(
      String language, String image, String token) async {
    FormData data = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        image,
      ),
    });
    return await crud.post(
      linkUrl: ApiLinks.uploadUserBackImageApi,
      parameters: {"language": language},
      data: data,
      token: token,
      isAuthorized: true,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> updateUserProfile(
    String language,
    String oldPassword,
    String token,
    String newPassword,
    String address,
    String phone,
    String username,
  ) async {
    return await crud.put(
      linkUrl: ApiLinks.updateProfileApi,
      parameters: {"language": language},
      data: {
        "username": username,
        "phone": phone,
        "address": address,
        "old_password": oldPassword,
        "new_password": newPassword
      },
      token: token,
      isAuthorized: true,
    );
  }
}
