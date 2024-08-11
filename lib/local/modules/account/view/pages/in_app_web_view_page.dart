import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:proj/local/modules/account/controller/account_web_view_controller.dart';
import 'package:proj/local/view/widgets/app_bar/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class InAppWebViewPage extends GetView<AccountWebViewController> {
  const InAppWebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, title: 'Al Qassem Group', isBack: true),
      body: Stack(
        children: [
          InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(controller.selectedLink),
              ),
              pullToRefreshController: controller.pullToRefreshController,
              onWebViewCreated: (webController) {
                controller.webViewController = webController;
              },
              onLoadStart: (webController, url) => controller.onLoadStart(url),
              onPermissionRequest: (controller, request) async {
                return PermissionResponse(
                    resources: request.resources,
                    action: PermissionResponseAction.GRANT);
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                var uri = navigationAction.request.url!;

                if (![
                  "http",
                  "https",
                  "file",
                  "chrome",
                  "data",
                  "javascript",
                  "about"
                ].contains(uri.scheme)) {
                  if (await canLaunchUrl(uri)) {
                    // Launch the App
                    await launchUrl(
                      uri,
                    );
                    // and cancel the request
                    return NavigationActionPolicy.CANCEL;
                  }
                }

                return NavigationActionPolicy.ALLOW;
              },
              onLoadStop: (webController, url) => controller.onLoadStop(url),
              onReceivedError: (webController, request, error) =>
                  controller.onReceivedError(),
              onProgressChanged: (webController, progress) =>
                  controller.onProgressChanged(progress),
              onUpdateVisitedHistory: (webController, url, androidIsReload) =>
                  controller.onUpdateVisitedHistory(url),
              onConsoleMessage: (webController, consoleMessage) {}),
          GetBuilder<AccountWebViewController>(
            builder: (controller) => controller.webProgress < 1.0
                ? LinearProgressIndicator(value: controller.webProgress)
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
