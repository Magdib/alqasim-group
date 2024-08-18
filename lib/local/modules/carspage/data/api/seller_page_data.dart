import 'package:dartz/dartz.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/dio_crud.dart';
import 'package:proj/local/core/api/api_links.dart';

class SellerData {
  DioCrud crud;
  SellerData(this.crud);

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getSellerData(
      String selectedLocal, String username, bool isAdmin) async {
    return await crud.get(
      linkUrl: ApiLinks.sellerDataApi,
      parameters: {
        "language": selectedLocal,
        "username": username,
        "admin": isAdmin ? "$isAdmin" : ""
      },
      isAuthorized: false,
    );
  }
}
