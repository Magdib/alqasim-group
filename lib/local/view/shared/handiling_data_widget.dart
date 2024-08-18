import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proj/local/core/constant/app_size.dart';
import '../../../global/core/api/status_request.dart';
import '../../core/constant/colors.dart';
import 'retry_button.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView(
      {super.key,
      required this.statusRequest,
      required this.child,
      required this.retryFunction});
  final StatusRequest statusRequest;
  final Widget child;
  final void Function() retryFunction;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            // child: LottieLoading()
            )
        : statusRequest == StatusRequest.failure
            ? const SizedBox()
            //  RetryButton(onTap: retryFunction,)
            : statusRequest == StatusRequest.offlineFailure
                ? const Center(child: Text("Offline"))
                : statusRequest == StatusRequest.serverFailure
                    ? const Center(child: Text("Failure"))
                    : statusRequest == StatusRequest.timeOutFailure
                        ? const Center(child: Text("Time out error"))
                        : child;
  }
}

class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest(
      {super.key,
      required this.statusRequest,
      required this.child,
      required this.onTap});
  final StatusRequest statusRequest;
  final Widget child;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset("assets/lottie/loading.json",
                    width: AppSize.screenWidth(context) / 2.2),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "...جارٍ التحميل".tr,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.primaryColor, fontSize: 16.sp),
                )
              ],
            ),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset("assets/lottie/offline.json",
                        width: AppSize.screenWidth(context) / 2.5,
                        fit: BoxFit.fill),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "...لا يوجد اتصال بالإنترنت".tr,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: AppColors.primaryColor, fontSize: 16.sp),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RetryButton(onTap: onTap)
                  ],
                ),
              )
            : statusRequest == StatusRequest.failure
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "حدث خطأ ما...".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 16.sp),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RetryButton(onTap: onTap)
                      ],
                    ),
                  )
                : child;
  }
}

class HandlingScrollDataRequest extends StatelessWidget {
  const HandlingScrollDataRequest(
      {super.key,
      required this.statusRequest,
      required this.child,
      required this.onTap});
  final StatusRequest statusRequest;
  final Widget child;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Container(
            height: AppSize.screenHight(context) - 140.h,
            width: AppSize.screenWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.screenHight(context) / 2 - 200.h,
                ),
                Lottie.asset("assets/lottie/loading.json",
                    width: AppSize.screenWidth(context) / 2.2),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "...جارٍ التحميل".tr,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.primaryColor, fontSize: 16.sp),
                )
              ],
            ),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Container(
                height: AppSize.screenHight(context) - 140.h,
                width: AppSize.screenWidth(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppSize.screenHight(context) / 8,
                    ),
                    Lottie.asset("assets/lottie/offline.json",
                        width: AppSize.screenWidth(context) / 2.5,
                        fit: BoxFit.fill),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "...لا يوجد اتصال بالإنترنت".tr,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: AppColors.primaryColor, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    RetryButton(onTap: onTap)
                  ],
                ),
              )
            : statusRequest == StatusRequest.failure
                ? Container(
                    height: AppSize.screenHight(context) - 140.h,
                    width: AppSize.screenWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: AppSize.screenHight(context) / 2 - 200.h,
                        ),
                        Text(
                          "حدث خطأ ما...".tr,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        RetryButton(onTap: onTap)
                      ],
                    ),
                  )
                : child;
  }
}
