import 'package:flutter/material.dart';
import '../../../global/core/api/status_request.dart';
import '../../core/constant/colors.dart';
// import 'widgets/loading/lottie_loading.dart';

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
      {super.key, required this.statusRequest, required this.child});
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ))
        : child;
  }
}
