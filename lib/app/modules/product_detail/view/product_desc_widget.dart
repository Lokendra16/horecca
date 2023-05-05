import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/product_detail/controller/product_detail_controller.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class ProductDescWidget extends StatelessWidget {
  ProductDescWidget({
    super.key,
  });

  ProductDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(
      () => Container(
        width: size.width,
        color: ColorName.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).productDescription,
                style: AppThemeData.sf500Font16Black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 8),
                child: Text(controller.parseHtmlString(controller.productDetail.value.body_html!),style: AppThemeData.sf400Font12,textScaleFactor: 1.2),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top:8.0),
              //   child: Html(
              //     data: controller.productDetail.value.body_html ?? "<p>N/A</p>",
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
