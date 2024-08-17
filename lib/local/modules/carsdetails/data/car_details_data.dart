import 'package:dartz/dartz.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/dio_crud.dart';
import 'package:proj/local/core/api/api_links.dart';

class CarDetailsData {
  DioCrud crud;
  CarDetailsData(this.crud);

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getCarData(
      String selectedLocal, String carId) async {
    return await crud.get(
      linkUrl: "${ApiLinks.carDetailsApi}${carId}",
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> sendEmailToVendorData(
      String name,
      String email,
      String phone,
      String message,
      String toEmail) async {
    return await crud.post(
      linkUrl: ApiLinks.sendEmailToVendorApi,
      data: {
        "name": name,
        "email": email,
        "phone": phone,
        "message": message,
        "to_email": toEmail
      },
      isAuthorized: false,
    );
  }
}
