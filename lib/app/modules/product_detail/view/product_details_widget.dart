import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_horeca_store/app/widgets/wishlist_widget.dart';
import 'package:the_horeca_store/commons/utils/app_tags.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({
    super.key,
    required this.product,
  });

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: ColorName.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.title ?? 'N/A',
                      textAlign: TextAlign.start,
                      style: AppThemeData.sf500Font16.copyWith(color: ColorName.black.withOpacity(0.8)),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          product.variants?[0].price.toString() ?? '',
                          style: AppThemeData.sf500Font16,
                        ),
                      ),
                      const Spacer(),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: ColorName.silver)),
                          child: Row(
                            children: [
                              WishlistWidget(
                                id: product.id.toString(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(AppLocalizations.of(context).wishList,style: AppThemeData.sf400Font14Gray,),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        onTap: () async {
                          await Share.share(product.id.toString());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: ColorName.silver)),
                          child: Row(
                            children: [
                              const Icon(Icons.share_outlined,color: ColorName.silver,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(AppLocalizations.of(context).share,style: AppThemeData.sf400Font14Gray,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
