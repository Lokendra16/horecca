import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/app/widgets/primary_checkout_button.dart';
import 'package:the_horeca_store/app/widgets/shopping_bag_list.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class ShoppingBagView extends StatelessWidget {
  const ShoppingBagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.alabaster,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarCart(
          title: AppLocalizations.of(context).shoppingBag,
          onBackPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.43, child: const ShoppingBagList()),
          priceDetailWidget(size: size),
          Spacer(),
          PrimaryCheckOutBtn(
            onClick: (){},
            buttonIcon: Icons.shopping_bag_outlined,
            btnText: AppLocalizations.of(context).proceedToCheckOut,
          )
        ],
      ),
    );
  }
}

class priceDetailWidget extends StatelessWidget {
  const priceDetailWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      height: size.height * 0.33,
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.silver),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Text(
              AppLocalizations.of(context).priceDetails,
              style: AppThemeData.font12Weight700,
            ),
          ),
          const Divider(
            color: ColorName.silver,
          ),
          SizedBox(
            height: size.height * 0.17,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customPriceDetailRow(
                    titleText: AppLocalizations.of(context).totalItem,
                    priceText: '04',
                  ),
                  customPriceDetailRow(
                      titleText: AppLocalizations.of(context).totalItem, priceText: '62.04'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context).discountOnAed,
                          style: AppThemeData.font12Weight400Gray),
                      Text(
                        '11.02',
                        style: AppThemeData.font12Weight400Jewel,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context).couponDiscount,
                          style: AppThemeData.font12Weight400Gray),
                      Text(
                        AppLocalizations.of(context).applyCoupon,
                        style: AppThemeData.font12Weight400Cardinal,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context).other,
                              style: AppThemeData.font12Weight400Gray),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(AppLocalizations.of(context).knowMore,
                              style: AppThemeData.font12Weight400Cardinal),
                        ],
                      ),
                      Text(
                        AppLocalizations.of(context).free,
                        style: AppThemeData.font12Weight400Jewel,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: ColorName.silver,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).totalAed,
                  style: AppThemeData.font14Weight600Cardinal,
                ),
                Text(
                  '51.02',
                  style: AppThemeData.font14Weight600Cardinal,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class customPriceDetailRow extends StatelessWidget {
  final String titleText;
  final String priceText;

  const customPriceDetailRow({
    super.key,
    required this.titleText,
    required this.priceText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: AppThemeData.font12Weight400Gray,
        ),
        Text(
          priceText,
          style: AppThemeData.font12Weight400Gray,
        )
      ],
    );
  }
}
