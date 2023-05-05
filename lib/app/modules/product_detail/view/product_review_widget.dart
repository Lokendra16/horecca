import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/product_detail/controller/product_detail_controller.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class ProductReviewWidget extends StatelessWidget {
  ProductReviewWidget({
    super.key,
  });

  ProductDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          width: size.width,
          color: ColorName.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).customerReview,
                  style: AppThemeData.sf500Font16Black,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: RatingBar.builder(
                    initialRating: 3.5,
                    minRating: 1,
                    itemSize: 26,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: ColorName.jewel,
                    ),
                    onRatingUpdate: (rating) {
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
