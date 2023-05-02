import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class CartItem extends StatelessWidget {
  CartItem({
    required this.item,
    super.key, this.onRemove,
  });

  final ProductData item;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.width * 0.40,
      color: ColorName.white,
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: item.image?.src ?? '',
            width: size.width * 0.36,
            errorWidget: (context, url, error) => Image.asset("assets/images/ic_appicon.png"),
            placeholder: (context, url) => Image.asset("assets/images/ic_appicon.png"),
            fadeOutDuration: const Duration(milliseconds: 100),
            height: size.width / 2,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.title ?? '',
                          style: AppThemeData.productTitleTextStyle,
                        ),
                      ),
                      GestureDetector(
                          onTap: onRemove,
                          child: const Icon(Icons.close, color: ColorName.black, size: 26))
                    ],
                  ),
                  Text(
                    'Material : Steel',
                    style: AppThemeData.font14Weight400Gray,
                  ),
                  Text(
                    'Category : Appetizers & Sides',
                    style: AppThemeData.font14Weight400Gray,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorName.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: ColorName.silver,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.remove, color: ColorName.black, size: 26),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: ColorName.jewel, borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    item.quantity.toString(),
                                    style: GoogleFonts.roboto(
                                        color: ColorName.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.add, color: ColorName.black, size: 26),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "AED 17.60" ?? '',
                        style: AppThemeData.productPriceStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
