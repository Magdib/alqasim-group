import 'dart:async';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../local/core/api/api_links.dart';
import '../functions/check_internet_connection.dart';
import '../api/api_errors.dart';
import 'dart:io';

import 'dio_exceptions.dart';

final dio = Dio();

class DioCrud {
  Future<Either<ApiErrors, Map>> post({
    required String linkUrl,
    data,
    Map<String, dynamic>? parameters,
    String? token,
    required bool isAuthorized,
  }) async {
    try {
      if (await checkInternet()) {
        debugPrint("url link is $linkUrl");
        final response = await dio.post(linkUrl,
            data: data,
            queryParameters: parameters,
            options: Options(
                receiveTimeout: const Duration(seconds: 30),
                sendTimeout: const Duration(seconds: 30),
                receiveDataWhenStatusError: true,
                headers: isAuthorized
                    ? {
                        'Content-Type': 'application/json',
                        'Authorization': "Bearer ${token}",
                      }
                    : ApiLinks.header));
        debugPrint("response status code is  ${response.statusCode}");
        Map responseBody = response.data;
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(responseBody);
        } else {
          return Left(ResponseError(
            statusCode: response.statusCode,
            message: responseBody['message'] ?? '',
          ));
        }
      } else {
        return Left(NetworkError(message: "...لا يوجد اتصال بالإنترنت".tr));
      }
    } on TimeoutException catch (e) {
      log('TimeOut for the request $e');
      return left(TimeOutError(message: "...لا يوجد اتصال بالإنترنت".tr));
    } on SocketException catch (e) {
      log('No internet connection | $e');
      return Left(NetworkError(message: "...لا يوجد اتصال بالإنترنت".tr));
    } on DioException catch (e) {
      log("Catch error $e");
      return Left(DioExceptions.showDioExceptionMessage(dioException: e));
      // return Left(ResponseError(
      //   message: "${e.response?.data['message'] ?? 'حدث خطأ'}",
      // ));
    }
  }

  Future<Either<ApiErrors, Map>> put({
    required String linkUrl,
    Map? data,
    Map<String, dynamic>? parameters,
    String? token,
    required bool isAuthorized,
  }) async {
    try {
      if (await checkInternet()) {
        debugPrint("url link is $linkUrl");
        final response = await dio.put(linkUrl,
            data: data,
            options: Options(
                receiveTimeout: const Duration(seconds: 30),
                sendTimeout: const Duration(seconds: 30),
                receiveDataWhenStatusError: true,
                headers: isAuthorized
                    ? {
                        'Content-Type': 'application/json',
                        'Authorization': "Bearer ${token}",
                      }
                    : ApiLinks.header));
        debugPrint("response status code is  ${response.statusCode}");
        Map responseBody = response.data;
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(responseBody);
        } else {
          return Left(ResponseError(
            statusCode: response.statusCode,
            message: responseBody['message'] ?? '',
          ));
        }
      } else {
        return Left(NetworkError(message: "...لا يوجد اتصال بالإنترنت".tr));
      }
    } on TimeoutException catch (e) {
      log('TimeOut for the request $e');
      return left(TimeOutError(message: "...لا يوجد اتصال بالإنترنت".tr));
    } on SocketException catch (e) {
      log('No internet connection | $e');
      return Left(NetworkError(message: "...لا يوجد اتصال بالإنترنت".tr));
    } on DioException catch (e) {
      log("Catch error $e");
      return Left(DioExceptions.showDioExceptionMessage(dioException: e));
      // return Left(ResponseError(
      //   message: "${e.response?.data['message'] ?? 'حدث خطأ'}",
      // ));
    }
  }

  Future<Either<ApiErrors, Map>> get({
    required String linkUrl,
    required bool isAuthorized,
    Map<String, String?>? parameters,
    String? token,
  }) async {
    try {
      if (await checkInternet()) {
        debugPrint("url link is $linkUrl");
        final response = await dio.get(linkUrl,
            queryParameters: parameters,
            options: Options(
                receiveTimeout: const Duration(seconds: 30),
                sendTimeout: const Duration(seconds: 30),
                headers: isAuthorized
                    ? {
                        'Content-Type': 'application/json',
                        'Authorization': "Bearer ${token}",
                      }
                    : ApiLinks.header));
        Map responseBody = response.data;
        if (response.statusCode == 200 || response.statusCode == 201) {
          return Right(responseBody);
        } else {
          return Left(ResponseError(
            statusCode: response.statusCode,
            message: responseBody['message'],
          ));
        }
      } else {
        return Left(NetworkError(message: "...لا يوجد اتصال بالإنترنت".tr));
      }
    } on TimeoutException catch (e) {
      log('TimeOut for the request $e');
      return left(TimeOutError(message: "انتهت مهلة التنفيذ".tr));
    } on SocketException catch (e) {
      log('No internet connection | $e');
      return Left(NetworkError(message: "...لا يوجد اتصال بالإنترنت".tr));
    } on DioException catch (e) {
      log("Catch error $e");
      return Left(DioExceptions.showDioExceptionMessage(dioException: e));
    }
  }
}
