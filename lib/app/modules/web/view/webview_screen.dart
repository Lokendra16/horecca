import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/web/controller/webview_screen_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({Key? key}) : super(key: key);

  final WebViewScreenController controller = Get.put(WebViewScreenController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.alabaster,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarCart(
          title: AppLocalizations.of(context).privacyPolicy,
          onBackPressed: () => Get.back(),
        ),
      ),
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
