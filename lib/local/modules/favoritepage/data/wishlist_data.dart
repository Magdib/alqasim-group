import 'package:dartz/dartz.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/dio_crud.dart';
import 'package:proj/local/core/api/api_links.dart';

class WishlistData {
  DioCrud crud;
  WishlistData(this.crud);
  Future<Either<ApiErrors, Map<dynamic, dynamic>>> getWishListData(String token,
      [String? nextPageUrl]) async {
    return await crud.get(
      linkUrl: nextPageUrl ?? ApiLinks.wishlistApi,
      token: token,
      parameters: {"items_per_page": "8"},
      isAuthorized: true,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> addToWishList(
      String carId, String token) async {
    return await crud.post(
      linkUrl: "${ApiLinks.addToWishlistApi}$carId",
      token: token,
      isAuthorized: true,
    );
  }

  Future<Either<ApiErrors, Map<dynamic, dynamic>>> removeFromWishList(
      String carId, String token) async {
    return await crud.put(
      linkUrl: "${ApiLinks.removeFromWishlistApi}$carId",
      token: token,
      isAuthorized: true,
    );
  }
}
