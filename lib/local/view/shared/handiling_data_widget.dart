import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';
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
                      .copyWith(color: AppColors.primaryColor),
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
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: AppColors.primaryColor),
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
                          "...حدث خطأ ما",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColors.primaryColor),
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
