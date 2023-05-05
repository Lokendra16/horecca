import 'package:cached_network_image/cached_network_image.dart';
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
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.productDetail, arguments: item.id.toString());
      },
      child: Container(
        //height: size.width * 0.40,
        color: ColorName.white,
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(8),

        child: Stack(
          children: [
            // PRODUCT IMAGE
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: item.image?.src ?? '',
                width: size.width * 0.36,
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/ic_appicon.png"),
                placeholder: (context, url) =>
                    Image.asset("assets/images/ic_appicon.png"),
                fadeOutDuration: const Duration(milliseconds: 100),
                height: size.width / 3,
                fit: BoxFit.cover,
              ),
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
            Positioned(
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: SizedBox(
                      width: size.width * 0.45,
                      child: Text(
                        item.title ?? '',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: AppThemeData.sf500Font12Black.copyWith(color: ColorName.black.withOpacity(0.7)),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "AED ${item.variants?[0].price}" ?? '',
                      style: AppThemeData.sf500Font12Red,
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
