import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../../commons/utils/app_theme_data.dart';
import '../../../../networking/models/product_data/product_data.dart';
import '../../../../src/gen/colors.gen.dart';
import '../../../widgets/wishlist_widget.dart';

class ProductListView extends StatelessWidget {
 ProductListView({Key? key, required this.item,
   this.isFromWishList, this.onWishListItemRemove}) : super(key: key);
  final ProductData item;
  final isFromWishList;
  final Function? onWishListItemRemove;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.productDetail, arguments: item.id.toString());
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
                    height: 130,
                    width: 160,
                    child:InkWell(
                      onTap: (){
                       Get.to( ProductImage(item:item,));
                      },
                      child: FancyShimmerImage(

                        imageUrl: item.image?.src ?? '',
                        width: size.width * 0.36,

                        errorWidget: Image.asset('assets/images/ic_appicon.png'),

                      ),
                    ),
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.40,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.title ?? '',
                           maxLines: 2,
                          //  textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                             style: AppThemeData.jost13Weight500,

                          ),

                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "AED ${item.variants?[0].price}" ?? '',
                          style: AppThemeData.jost17Weight600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.addToCart();
                        },
                        style: TextButton.styleFrom(backgroundColor: ColorName.cardinal),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(AppLocalizations.of(context).addToCart,
                              style: AppThemeData.poppins700Font14),
                        ),
                      ),
                    ],
                  )
                ],
              ),
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

            ]
          ),
        ),
      ) ,
    );
  }
}
