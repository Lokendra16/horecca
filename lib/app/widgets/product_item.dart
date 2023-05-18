import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/product_list/controller/product_listview_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/product_item_button.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

import 'wishlist_widget.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.item,
    this.isFromWishList = false,
    this.onWishListItemRemove,
    this.productListController,
  });

  final ProductData item;
  final isFromWishList;
  final Function? onWishListItemRemove;
  final ProductListController? productListController;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.productDetail,
            arguments: widget.item.id.toString());
      },
      child: Container(
        color: ColorName.white,
        margin: const EdgeInsets.only(top: 2, left: 8, right: 8),
        child: Column(
          children: [
            Stack(
              children: [
                // PRODUCT IMAGE
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: FancyShimmerImage(
                      imageUrl: widget.item.image?.src ?? '',
                      width: size.width * 0.36,
                      height: size.width / 3.4,
                      errorWidget: Image.asset('assets/images/ic_appicon.png'),
                    ),
                  ),
                ),
                // WISH LIST ICON
                widget.isFromWishList
                    ? Positioned(
                        top: 0,
                        right: 10,
                        child: GestureDetector(
                            onTap: () {
                              widget.onWishListItemRemove!();
                            },
                            child: const Icon(Icons.close,
                                color: ColorName.black, size: 26)),
                      )
                    : Positioned(
                        top: 0,
                        right: 10,
                        child: WishlistWidget(
                          id: Uri.parse(widget.item.id.toString())
                              .pathSegments
                              .last,
                        ),
                      ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  child: Text(
                    widget.item.title ?? '',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppThemeData.jost13Weight500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    widget.item.vendor ?? '',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppThemeData.poppins500Font10,
                  ),
                ),
                Text(
                  "AED ${widget.item.variants?[0].price}" ?? '',
                  style: AppThemeData.jost17Weight600,
                ),
              ],
            ),
            ProductItemButton(
              item: widget.item,
            ),
          ],
        ),
      ),
    );
  }
}
