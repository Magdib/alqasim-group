import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


import 'api_errors.dart';
import 'status_request.dart';


class DioExceptions {
  static ApiErrors showDioExceptionMessage(
      {required DioException dioException}) {
    ApiErrors? apiErrors;
    // if (dioException.message!.contains("401")) {
    //   apiErrors =ApiErrors(message: "Un authorized", statusRequest: StatusRequest.failure);
    // } else {
      log("exception is ${dioException.type}");
      switch (dioException.type) {
        case DioExceptionType.receiveTimeout:
          apiErrors = ApiErrors(
              message:'انتهت مهلة الطلب',
              statusRequest: StatusRequest.timeOutFailure);
          break;
        case DioExceptionType.connectionTimeout:
          apiErrors = ApiErrors(
              message:'انتهت مهلة الطلب',
              statusRequest: StatusRequest.timeOutFailure);
          break;
        case DioExceptionType.sendTimeout:
          apiErrors = ApiErrors(
              message: 'انتهت مهلة الطلب',
              statusRequest: StatusRequest.timeOutFailure);
          break;
        case DioExceptionType.connectionError:
          debugPrint("check internet connections or check api end point");
          apiErrors = ApiErrors(
              message: 'لا يوجد اتصال بالانترنت',
              statusRequest: StatusRequest.offlineFailure);
          break;
        case DioExceptionType.cancel:
          //error on body parameter
          apiErrors = ApiErrors(
              message: 'شيئ ما خاطئ اعد المحاولة',
              statusRequest: StatusRequest.failure);
          break;
        case DioExceptionType.badResponse:
          //error on body parameter
          apiErrors = ApiErrors(
              message:  "${dioException.response?.data['message'] ?? 'حدث خطأ'}",
              statusRequest: StatusRequest.failure);
          break;
        default:
          apiErrors = ApiErrors(
              message: "خطأ غير معروف", statusRequest: StatusRequest.failure);
      // }
    }
    return apiErrors;
  }
}
