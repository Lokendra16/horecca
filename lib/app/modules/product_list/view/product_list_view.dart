import 'package:auto_size_text/auto_size_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/product_list/controller/product_listview_controller.dart';
import 'package:the_horeca_store/app/modules/product_list/view/product_image.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/product_item_button.dart';

import '../../../../commons/utils/app_theme_data.dart';
import '../../../../networking/models/product_data/product_data.dart';
import '../../../../src/gen/colors.gen.dart';
import '../../../widgets/wishlist_widget.dart';

class ProductListView extends StatefulWidget {
  ProductListView(
      {Key? key,
      required this.item,
      this.isFromWishList,
      this.onWishListItemRemove,
      this.productListController})
      : super(key: key);
  final ProductData item;
  final isFromWishList;
  final Function? onWishListItemRemove;
  final ProductListController? productListController;

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.productDetail,
            arguments: widget.item.id.toString());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    height: size.height * 0.15,
                    width: size.width * 0.3,
                    child: InkWell(
                      onTap: () {
                        Get.to(ProductImage(
                          item: widget.item,
                        ));
                      },
                      child: FancyShimmerImage(
                        imageUrl: widget.item.image?.src ?? '',
                        width: size.width * 0.34,
                        errorWidget:
                            Image.asset('assets/images/ic_appicon.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.5,
                          child: AutoSizeText(
                            widget.item.title ?? '',
                            maxLines: 2,
                            //  textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: AppThemeData.jost13Weight500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                            widget.item.vendor ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: AppThemeData.poppins500Font10,
                          ),
                        ),
                        Text(
                          "AED ${widget.item.variants?[0].price}" ?? '',
                          style: AppThemeData.jost17Weight600,
                        ),
                        SizedBox(
                          width: size.width * 0.56,
                          child: ProductItemButton(item: widget.item),
                        )
                        // TextButton(
                        //   onPressed: () {
                        //     controller.addToCart();
                        //   },
                        //   style: TextButton.styleFrom(
                        //       backgroundColor: ColorName.cardinal),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(5.0),
                        //     child: Text(AppLocalizations.of(context).addToCart,
                        //         style: AppThemeData.poppins700Font14),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
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
        ),
      ),
    );
  }
}
