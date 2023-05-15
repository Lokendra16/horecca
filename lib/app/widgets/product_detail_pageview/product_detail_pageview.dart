import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/defaults.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/product_detail/controller/product_detail_controller.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

import '../../../networking/models/product_data/product_data.dart';
import '../../modules/product_list/view/product_image.dart';

class ProductDetailPageView extends StatelessWidget {
  ProductDetailPageView({
    Key? key,
  }) : super(key: key);

  ProductDetailController controller = Get.find();
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => controller.productDetail.value.images != null &&
              controller.productDetail.value.images!.isNotEmpty
          ? Container(
              margin: const EdgeInsets.only(left: 1, right: 1),
              decoration: BoxDecoration(
                  color: ColorName.white, border: Border.all(color: ColorName.silver)),
              height: size.width * 0.6,
              width: size.width,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: controller.productDetail.value.images!.length,
                      onPageChanged: controller.currentPageIndex,
                      itemBuilder: (_, i) {
                        var item = controller.productDetail.value.images![i];
                        return Center(
                          child: InkWell(
                            onTap: (){
                              Get.to(
                                  ProductImage(item:ProductData(image: item)),
                              );
                            },
                            child: item.src !=null && item.src!.isNotEmpty ? CachedNetworkImage(
                              imageUrl: item.src ?? '',
                              placeholder: (context, url) =>
                                  Center(child: Image.asset("assets/images/ic_appicon.png")),
                              errorWidget: (context, url, error) =>
                                  Center(child: Image.asset("assets/images/ic_appicon.png")),
                              fit: BoxFit.cover,
                            ) : Center(child: Image.asset("assets/images/ic_appicon.png")),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.01,
                    left: size.width * 0.45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.productDetail.value.images?.length ?? 0,
                        (index) => buildDot(index, context),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox(),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: controller.currentPageIndex.value == index ? ColorName.black : ColorName.silver,
      ),
    );
  }
}
