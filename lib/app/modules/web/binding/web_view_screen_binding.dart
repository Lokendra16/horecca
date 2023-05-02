
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/my_account/controller/my_account_controller.dart';
import 'package:the_horeca_store/app/modules/web/controller/webview_screen_controller.dart';

class WebViewScreenBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<WebViewScreenController>(() => WebViewScreenController());
  }

}