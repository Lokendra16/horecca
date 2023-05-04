import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:the_horeca_store/app/modules/product_list/controller/product_listview_controller.dart';
import 'package:the_horeca_store/app/modules/product_list/view/product_list_screen.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/networking/models/home/home_collections.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';

class HomeShopByCategoryWidget extends StatelessWidget {
  final List<HomeCollections> list;

  const HomeShopByCategoryWidget({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var value in list)
              SizedBox(
                width: size.width * 0.22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.delete<ProductListController>();
                        Get.to(() => ProductListScreen(),
                            arguments: [ProductListController.TYPE_CATEGORY_PRODUCTS, Uri.parse(value.id ?? '').pathSegments.last,value.title],
                            binding: BindingsBuilder.put(() => ProductListController()));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: value.image != null && value.image!.isNotEmpty
                            ? Container(
                                width: 80,
                                height: 80,
                              child: CachedNetworkImage(
                                  width: 60,
                                  height: 60,
                                  imageUrl: value.image ?? '',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url){
                                    return const CirclePlaceholderImg();
                                  },
                                  errorWidget: (context, url, error){
                                    return const CirclePlaceholderImg();
                                  },
                                ),
                            )
                            : const CirclePlaceholderImg(),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 8.0),
                        child: Text(
                          value.title ?? '',
                          style: AppThemeData.shopCategoryTitleStl.copyWith(fontSize: 12.0),
                          textAlign: TextAlign.center,
                          softWrap: false,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}

class CirclePlaceholderImg extends StatelessWidget {
  const CirclePlaceholderImg({
    super.key,
    this.size = 80,
    this.color = Colors.white,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(size / 2),
          child: Image.asset(
            "assets/images/ic_appicon.png",
            width: size,
            height: size,
          ),
        ),
    );
  }
}
