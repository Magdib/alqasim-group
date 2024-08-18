import 'package:dartz/dartz.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/dio_crud.dart';
import 'package:proj/local/core/api/api_links.dart';

class SignInData {
  DioCrud crud;
  SignInData(this.crud);

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> signIn(
    String email,
    String password,
  ) async {
    return await crud.post(
      linkUrl: ApiLinks.signInApi,
      data: {
        "email": email,
        "password": password,
      },
      isAuthorized: false,
    );
  }
}
