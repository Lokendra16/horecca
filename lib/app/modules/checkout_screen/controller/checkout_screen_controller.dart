import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutScreenController extends GetxController {
  late final WebViewController webViewController;
  var isLoading = true.obs;
  var checkoutUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();

    checkoutUrl.value = Get.arguments["checkOutUrl"];
    print("Checkout URL : $checkoutUrl");

    if (checkoutUrl.value != "" && checkoutUrl.value.isNotEmpty) {
      webViewController = WebViewController()
        ..loadRequest(Uri.parse(checkoutUrl.value))
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(NavigationDelegate(
          onPageFinished: (String url) {
            isLoading.value = false;
          },
          onNavigationRequest: (request) {
            print("Request URL : ${request.url}");
            if(Uri.parse(request.url).pathSegments.last == "thank_you"){
              Get.offAllNamed(AppRoutes.myOrderScreen);
            }
            return NavigationDecision.navigate;
          },
          onPageStarted: (url) {
            print("Request URL : ${url}");
          },
        ));
    }
  }
}
