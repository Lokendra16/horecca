import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/wishlist_widget.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/networking/models/home/home_collections.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class HomeProductsWidget extends StatelessWidget {
  final List<HomeCollections> list;

  const HomeProductsWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: list.length,
        (context, index) {
          var item = list[index];
          return Column(
            children: [
              if (item.products!.isNotEmpty)
                const SizedBox(
                  height: 10,
                ),
              item.products!.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 0 : 10.0),
                      child: Text(item.title ?? '',
                          style: AppThemeData.jost26UnderLine),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < item.products!.length; i++)
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.productDetail,
                              arguments: Uri.parse(item.products?[i].id ?? '')
                                  .pathSegments
                                  .last);
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
                              Expanded(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: FancyShimmerImage(
                                        imageUrl: item.products?[i].image ?? '',
                                        boxFit: BoxFit.cover,
                                        errorWidget: Image.asset(
                                            'assets/images/ic_appicon.png'),
                                      ) /*Image.network(
                                        item.products?[i].image ?? '',
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, url, error) =>
                                            Image.asset(
                                                'assets/images/ic_appicon.png'),
                                      )*/
                                      ,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: WishlistWidget(
                                            id: Uri.parse(item.products![i].id
                                                    .toString())
                                                .pathSegments
                                                .last),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 4, left: 5, right: 5),
                                child: Text(
                                  item.products?[i].title ?? '',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: AppThemeData.jost13Weight500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 8),
                                child: Text(
                                  "AED ${item.products?[i].price}" ??
                                      '', //TODO Make this dynamic
                                  style: AppThemeData.jost17Weight600,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
