import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/product_detail/controller/product_detail_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/wishlist_widget.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/networking/models/home/home_collections.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class ProductsRecommendationWidget extends StatelessWidget {
  final HomeCollections data;

  ProductsRecommendationWidget({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: ColorName.gray.withOpacity(0.2),
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 12),
            child: Text(
              data.title ?? '',
              style: AppThemeData.jost18Weight700Black,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < data.products!.length; i++)
                  GestureDetector(
                    onTap: () {
                      var id = Uri.parse(data.products?[i].id ?? '')
                          .pathSegments
                          .last;
                      print("Recomm Id : $id + ${data.products![i].title}");
                      Get.delete<ProductDetailController>();

                      Get.toNamed(AppRoutes.productDetail,
                          arguments: Uri.parse(data.products?[i].id ?? '')
                              .pathSegments
                              .last,
                          preventDuplicates: false);
                    },
                    child: Container(
                      width: size.width * 0.40,
                      height: size.width * 0.50,
                      margin: const EdgeInsets.only(left: 16),
                      decoration: const BoxDecoration(
                        color: ColorName
                            .white, //border: Border.all(color: ColorName.silver)
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: WishlistWidget(
                                  id: data.products![i].id.toString()),
                            ),
                          ),
                          Expanded(
                            child: FancyShimmerImage(
                              imageUrl: data.products?[i].image ?? '',
                              boxFit: BoxFit.cover,
                              errorWidget:
                                  Image.asset('assets/images/ic_appicon.png'),
                            ) /*Image.network(
                              data.products?[i].image ?? '',
                              fit: BoxFit.cover,
                            )*/
                            ,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 4, left: 5, right: 5),
                            child: Text(
                              data.products?[i].title ?? '',
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: AppThemeData.jost12Weight500Black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 8),
                            child: Text(
                              "AED ${data.products?[i].price.toString()}" ??
                                  '', //TODO Make this dynamic
                              style: AppThemeData.jost14Weight500Black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
