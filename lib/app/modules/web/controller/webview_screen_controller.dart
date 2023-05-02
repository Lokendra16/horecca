import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreenController extends GetxController {

  late final WebViewController webViewController;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController()
      ..loadRequest(
        Uri.parse(Get.arguments),
      )
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          isLoading.value = false;
        },
      ));
  }
}
