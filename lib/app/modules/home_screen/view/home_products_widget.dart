import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/wishlist_widget.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/networking/models/home/home_collections.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
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
        (context, index){
          var item = list[index];
          return Column(
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  item.title ?? '',
                  style: AppThemeData.font16Weight600PlayfairCardinal.copyWith(fontSize: 24.0,fontFamily: 'SF Pro Rounded',color: ColorName.gray,fontWeight: FontWeight.w500),
                ),
              ),
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
                                arguments: Uri.parse(item.products?[i].id ?? '').pathSegments.last);
                        },
                        child: Container(
                          width: size.width * 0.40,
                          height: size.width * 0.50,
                          margin: const EdgeInsets.only(left: 16),
                          decoration: const BoxDecoration(
                              color: ColorName.white, //border: Border.all(color: ColorName.silver)
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Image.network(
                                        item.products?[i].image ?? '',
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, url, error) => Image.asset('assets/images/ic_appicon.png'),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: WishlistWidget(id: Uri.parse(item.products![i].id.toString()).pathSegments.last ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4, left: 5, right: 5),
                                child: Text(
                                  item.products?[i].title ?? '',
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: AppThemeData.sf400Font12Black,
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 8),
                                child: Text(
                                  'AED 134.75', //TODO Make this dynamic
                                  style: AppThemeData.sf500Font12,
                                ),
                              ),
                              const SizedBox(height: 20,),
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
