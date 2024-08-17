import 'package:dartz/dartz.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/dio_crud.dart';
import 'package:proj/local/core/api/api_links.dart';

class HomeData {
  DioCrud crud;
  HomeData(this.crud);

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getSliderData(
      String selectedLocal) async {
    return await crud.get(
      linkUrl: ApiLinks.sliderApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getCategoriesData(
      String selectedLocal,
      {String? nextPageUrl,
      bool withPagination = true}) async {
    return await crud.get(
      linkUrl: nextPageUrl ?? ApiLinks.categoriesApi,
      parameters: {
        "items_per_page": withPagination ? "5" : "",
        "language": selectedLocal
      },
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getTopCarsData(
    String selectedLocal,
    String? nextPageUrl,
  ) async {
    return await crud.get(
      linkUrl: nextPageUrl ?? ApiLinks.topCarsApi,
      parameters: {"language": selectedLocal, "items_per_page": "2"},
      isAuthorized: false,
    );
  }
}
