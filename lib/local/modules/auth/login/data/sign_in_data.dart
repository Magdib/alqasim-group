import 'package:dartz/dartz.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/dio_crud.dart';
import 'package:proj/local/core/api/api_links.dart';

class SignInData {
  DioCrud crud;
  SignInData(this.crud);

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> signIn(
      String language, String email,
      {String? password, String? provider, String? providerId}) async {
    return await crud.post(
      linkUrl: ApiLinks.signInApi,
      parameters: {
        "language": language,
      },
      data: provider == null
          ? {
              "email": email,
              "password": password ?? "",
            }
          : {"email": email, "provider": provider, "provider_id": providerId},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> checkEmail(
    String language,
    String email,
  ) async {
    return await crud.post(
      linkUrl: ApiLinks.sendOtpApi,
      parameters: {
        "language": language,
      },
      data: {
        "email": email,
      },
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> checkOtpPassword(
      String language, String email, String otp,
      [String? password]) async {
    return await crud.post(
      linkUrl: ApiLinks.verifyOtpResetPasswordApi,
      parameters: {
        "language": language,
      },
      data: password != null
          ? {
              "email": email,
              "otp": otp,
              "password": password,
            }
          : {
              "email": email,
              "otp": otp,
            },
      isAuthorized: false,
    );
  }
}
