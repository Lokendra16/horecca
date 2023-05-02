import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/checkout_screen/controller/checkout_screen_controller.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutScreen extends GetView<CheckoutScreenController> {
  CheckoutScreen({super.key});

  final CheckoutScreenController controller = Get.put(CheckoutScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: ColorName.jewel,
                  ),
                )
              : WebViewWidget(
                  controller: controller.webViewController,
                ),
        ),
      ),
    );
  }
}
