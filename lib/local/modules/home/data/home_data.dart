import 'package:dartz/dartz.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/dio_crud.dart';
import 'package:proj/local/core/api/api_links.dart';

class HomeData {
  DioCrud crud;
  HomeData(this.crud);

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getSliderData() async {
    return await crud.get(
      linkUrl: ApiLinks.sliderApi,
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getCategoriesData(
      [String? nextPageUrl]) async {
    return await crud.get(
      linkUrl: nextPageUrl ?? ApiLinks.categoriesApi,
      parameters: {"items_per_page": "8"},
      isAuthorized: false,
    );
  }
}
