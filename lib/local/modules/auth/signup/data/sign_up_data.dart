import 'package:dartz/dartz.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/dio_crud.dart';
import 'package:proj/local/core/api/api_links.dart';

class SignUpData {
  DioCrud crud;
  SignUpData(this.crud);

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> signup(
    String language,
    String email,
    String username,
    String password,
    String confirmPassword,
  ) async {
    return await crud.post(
      linkUrl: ApiLinks.signUpApi,
      data: {
        "language": language,
        "username": username,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
      },
      isAuthorized: false,
    );
  }
}
