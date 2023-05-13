import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class CartItem extends StatelessWidget {
  CartItem({
    required this.item,
    super.key,
    this.onRemove,
    this.decrease,
    this.increase,
  });

  final ProductData item;
  final VoidCallback? onRemove;
  final VoidCallback? decrease;
  final VoidCallback? increase;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: ColorName.white,
          boxShadow: [BoxShadow(color: ColorName.gray, blurRadius: 2)]),
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FancyShimmerImage(
            imageUrl: item.image?.src ?? '',
            boxFit: BoxFit.contain,
            width: size.width * 0.36,
            height: size.width / 3,
            errorWidget: Image.asset('assets/images/ic_appicon.png'),
          )
          /*CachedNetworkImage(
            imageUrl: item.image?.src ?? '',
            width: size.width * 0.36,
            errorWidget: (context, url, error) =>
                Image.asset("assets/images/ic_appicon.png"),
            placeholder: (context, url) =>
                Image.asset("assets/images/ic_appicon.png"),
            fadeOutDuration: const Duration(milliseconds: 100),
            height: size.width / 3.5,
            fit: BoxFit.contain,
          )*/
          ,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.title ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: AppThemeData.sf400Font12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                            onTap: onRemove,
                            child: const Icon(Icons.close,
                                color: ColorName.black, size: 24)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Material : Steel',
                      style:
                          AppThemeData.sf500Font12Black.copyWith(fontSize: 13),
                    ),
                  ),
                  Text(
                    'Category : Appetizers & Sides',
                    style: AppThemeData.sf500Font12Black.copyWith(fontSize: 13),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          color: ColorName.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: ColorName.mercury,
                          ),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  decrease!();
                                },
                                child: const Icon(Icons.remove,
                                    color: ColorName.gray, size: 16)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  item.quantity.toString(),
                                  style: GoogleFonts.roboto(
                                      color: ColorName.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  increase!();
                                },
                                child: const Icon(Icons.add,
                                    color: ColorName.black, size: 16)),
                          ],
                        ),
                      ),
                       Text(
                        item.variants?[0].price.toString() ?? '',
                        style: AppThemeData.sf500Font16,
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
