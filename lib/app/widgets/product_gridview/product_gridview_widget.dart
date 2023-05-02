import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/product_list/controller/product_listview_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class ProductGridviewWidget extends StatelessWidget {
  final dynamic myGridListData;
  final int? index;

  const ProductGridviewWidget({
    Key? key,
    this.myGridListData,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: ColorName.panache,
      margin: const EdgeInsets.only(top: 15),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Container(
              height: size.height * 0.24,
              width: size.width * 0.35,
              color: ColorName.mercury,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 50,
                    color: ColorName.jewel,
                    child: Center(
                        child: Text(
                      '10% Off',
                      style: AppThemeData.discountTextStyle,
                    )),
                  ),
                  Image.asset(myGridListData[index].image.toString(), height: 134)
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.56,
                    child: Row(
                      children: [
                        Text(
                          myGridListData[index].title.toString(),
                          style: AppThemeData.productTitleTextStyle,
                        ),
                        const Spacer(),
                        GetBuilder<ProductListController>(builder: (productController) {
                          return InkWell(
                              onTap: () {
                                productController.onClick(index);
                              },
                              child: myGridListData[index].isActive == true
                                  ? const Icon(
                                      Icons.favorite_outline,
                                      color: ColorName.black,
                                    )
                                  : const Icon(
                                      Icons.favorite,
                                      color: ColorName.cardinal,
                                    ));
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    myGridListData[index].subTitle.toString(),
                    style: AppThemeData.weight400Font15,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    myGridListData[index].category.toString(),
                    style: AppThemeData.weight400Font15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(myGridListData[index].actualPrice,
                          style: AppThemeData.actualPriceTextStyle),
                      SizedBox(width: size.width * 0.02),
                      Text(myGridListData[index].discountPrice,
                          style: AppThemeData.productPriceStyle)
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.cartScreen);
                    },
                    child: Container(
                      height: 35,
                      width: size.width * 0.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6), color: ColorName.cardinal),
                      child: Center(
                          child: Text(AppLocalizations.of(context).addToCart,
                              style: AppThemeData.addToCartTextStyle)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
