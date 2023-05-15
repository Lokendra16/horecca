import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

import 'wishlist_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.item,
    this.isFromWishList = false,
    this.onWishListItemRemove,
  });

  final ProductData item;
  final isFromWishList;
  final Function? onWishListItemRemove;

  @override
  Widget build(BuildContext context) {
    print('is from wish list : $isFromWishList');
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.productDetail, arguments: item.id.toString());
      },
      child: Container(
        //height: size.width * 0.40,
        color: ColorName.white,
        margin: const EdgeInsets.only(top: 2, left: 8, right: 8),
        //   padding: const EdgeInsets.all(8),

        child: Stack(
          children: [
            // PRODUCT IMAGE
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: FancyShimmerImage(
                imageUrl: item.image?.src ?? '',
                width: size.width * 0.36,
                height: size.width / 3.4,
                errorWidget: Image.asset('assets/images/ic_appicon.png'),
              ) /*CachedNetworkImage(
                imageUrl: item.image?.src ?? '',
                width: size.width * 0.36,
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/ic_appicon.png"),
                placeholder: (context, url) =>
                    Image.asset("assets/images/ic_appicon.png"),
                fadeOutDuration: const Duration(milliseconds: 100),
                height: size.width / 3.5,
                fit: BoxFit.cover,
              )*/
              ,
            ),
            // WISH LIST ICON
            isFromWishList
                ? Positioned(
                    top: 10,
                    right: 20,
                    child: GestureDetector(
                        onTap: () {
                          onWishListItemRemove!();
                        },
                        child: const Icon(Icons.close,
                            color: ColorName.black, size: 26)),
                  )
                : Positioned(
                    top: 10,
                    right: 20,
                    child: WishlistWidget(
                      id: Uri.parse(item.id.toString()).pathSegments.last,
                    ),
                  ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 105.0,left: 20),
                  child: SizedBox(
                    width: size.width * 0.40,
                    child: Text(
                      item.title ?? '',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                       style: AppThemeData.jost13Weight500,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 5),
                  child: Text(
                    "AED ${item.variants?[0].price}" ?? '',
                    style: AppThemeData.jost17Weight600,

                  ),
                ),
                // TextButton(
                //     style: TextButton.styleFrom(
                //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                //       backgroundColor: ColorName.cardinal,
                //     ),
                //     onPressed: () {},
                //     child: const Text("Add to cart", style: AppThemeData.sf400Font12White))
              ],
            ),
          ],
        ),
        // child: Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     CachedNetworkImage(
        //       imageUrl: item.image?.src ?? '',
        //       width: size.width * 0.36,
        //       errorWidget: (context, url, error) => Image.asset("assets/images/ic_appicon.png"),
        //       placeholder: (context, url) => Image.asset("assets/images/ic_appicon.png"),
        //       fadeOutDuration: const Duration(milliseconds: 100),
        //       height: size.width / 2,
        //       fit: BoxFit.cover,
        //     ),
        //     Expanded(
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           crossAxisAlignment: CrossAxisAlignment.stretch,
        //           children: [
        //             Row(
        //               children: [
        //                 Expanded(
        //                   child: Text(
        //                     item.title ?? '',
        //                     maxLines: 2,
        //                     overflow: TextOverflow.ellipsis,
        //                     style: AppThemeData.productTitleTextStyle,
        //                   ),
        //                 ),
        //                 isFromWishList
        //                     ? GestureDetector(
        //                         onTap: () {
        //                           onWishListItemRemove!();
        //                         },
        //                         child: const Icon(Icons.close, color: ColorName.black, size: 26))
        //                     : WishlistWidget(
        //                         id: Uri.parse(item.id.toString()).pathSegments.last,
        //                       )
        //               ],
        //             ),
        //             Text(
        //               'Material : Steel',
        //               style: AppThemeData.font14Weight400Gray,
        //             ),
        //             Text(
        //               'Category : Appetizers & Sides',
        //               style: AppThemeData.font14Weight400Gray,
        //             ),
        //             Text(
        //               "AED ${item.variants?[0].price}" ?? '',
        //               style: AppThemeData.productPriceStyle,
        //             ),
        //             TextButton(
        //                 style: TextButton.styleFrom(
        //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        //                   backgroundColor: ColorName.cardinal,
        //                 ),
        //                 onPressed: () {},
        //                 child: Text("Add to cart", style: AppThemeData.font14Weight700))
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
