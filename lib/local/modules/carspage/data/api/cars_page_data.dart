import 'package:dartz/dartz.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/dio_crud.dart';
import 'package:proj/local/core/api/api_links.dart';
import 'package:proj/local/modules/carspage/model/brand_filter_model.dart';

class CarsPageData {
  DioCrud crud;
  CarsPageData(this.crud);

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getCitesApi(
      String selectedLocal) async {
    return await crud.get(
      linkUrl: ApiLinks.citesApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getRegionalSpecApi(
    String selectedLocal,
  ) async {
    return await crud.get(
      linkUrl: ApiLinks.regionalSpecApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getDoorsNumber(
    String selectedLocal,
  ) async {
    return await crud.get(
      linkUrl: ApiLinks.doorsNumberApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getSeatsNumber(
      String selectedLocal) async {
    return await crud.get(
      linkUrl: ApiLinks.seatsNumberApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getInsideColor(
    String selectedLocal,
  ) async {
    return await crud.get(
      linkUrl: ApiLinks.insideColorApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getOutsideColor(
    String selectedLocal,
  ) async {
    return await crud.get(
      linkUrl: ApiLinks.outsideColorApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getHorsePower(
    String selectedLocal,
  ) async {
    return await crud.get(
      linkUrl: ApiLinks.horsePowerApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getFuelType(
      String selectedLocal) async {
    return await crud.get(
      linkUrl: ApiLinks.fuelTypeApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getTransmissionType(
      String selectedLocal) async {
    return await crud.get(
      linkUrl: ApiLinks.transmissionTypeApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getCarCondition(
      String selectedLocal) async {
    return await crud.get(
      linkUrl: ApiLinks.carConditionApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getBrands(
      String selectedLocal) async {
    return await crud.get(
      linkUrl: ApiLinks.brandsApi,
      parameters: {"language": selectedLocal},
      isAuthorized: false,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> filterCars(
    String selectedLocal, {
    String? title,
    String? categoryId,
    String? cityId,
    String? regionalSpecificationId,
    String? doorsNum,
    String? seatNum,
    String? insideColor,
    String? outsideColor,
    String? horsePower,
    String? isTested,
    String? isWarranty,
    String? minPrice,
    String? maxPrice,
    String? fuelTypeID,
    String? location,
    List<BrandFilterModel>? brands,
    String? transmission,
    String? condition,
    String? nextPageUrl,
  }) async {
    print(isTested.toString());
    Map<String, String?> parametersMap = {
      "language": selectedLocal,
      "filter[title]": title,
      "filter[category_id]": categoryId,
      "filter[city_id]": cityId,
      "filter[regional_specification_id]": regionalSpecificationId,
      "filter[door_num]": doorsNum,
      "filter[seat_num]": seatNum,
      "filter[inside_color]": insideColor,
      "filter[outside_color]": outsideColor,
      "filter[horse_power]": horsePower,
      "filter[is_tested]": isTested,
      "filter[is_warranty]": isWarranty,
      "filter[min]": minPrice,
      "filter[max]": maxPrice,
      "filter[fuel_type_id]": fuelTypeID,
      "filter[location]": location,
      "filter[transmission_id]": transmission,
      "filter[condition_id]": condition,
      "items_per_page": "6"
    };
    if (brands != null) {
      for (int i = 0; i < brands.length; i++) {
        parametersMap.addAll({"filter[brands_id][${i}]": "${brands[i].id}"});
      }
    }

    return await crud.get(
      linkUrl: nextPageUrl ?? ApiLinks.carsList,
      parameters: parametersMap,
      isAuthorized: false,
    );
  }
}
