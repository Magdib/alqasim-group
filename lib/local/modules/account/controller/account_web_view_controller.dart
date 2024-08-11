import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/core/constant/arguments_names.dart';
import 'package:proj/local/core/constant/colors.dart';

class AccountWebViewController extends GetxController {
  String selectedLink = Get.arguments[ArgumentsNames.webViewLink];
  late PullToRefreshController pullToRefreshController;
  String link = '';
  InAppWebViewController? webViewController;
  StatusRequest statusRequest = StatusRequest.none;
  double webProgress = 0;

  onLoadStop(WebUri? url) {
    pullToRefreshController.endRefreshing();
    link = url.toString();
    update();
  }

  onLoadStart(WebUri? url) {
    link = url.toString();
    update();
  }

  onReceivedError() {
    pullToRefreshController.endRefreshing();
    update();
  }

  onProgressChanged(int progress) {
    if (progress == 100) {
      pullToRefreshController.endRefreshing();
    }

    webProgress = progress / 100;
    update();
  }

  onUpdateVisitedHistory(WebUri? url) {
    link = url.toString();
    update();
  }

  initializeData() {
    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(
        color: AppColors.primaryColor,
      ),
      onRefresh: () async {
        if (GetPlatform.isAndroid) {
          webViewController?.reload();
        } else if (GetPlatform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void onInit() {
    initializeData();
    super.onInit();
  }
}
