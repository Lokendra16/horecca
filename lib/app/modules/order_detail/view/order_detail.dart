import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/app/widgets/primary_checkout_button.dart';
import 'package:the_horeca_store/app/widgets/shopping_bag_list.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.alabaster,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarCart(
          title: AppLocalizations.of(context).orderDetail,
          onBackPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: [
          const ShoppingBagList(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: PriceDetailWidget(size: size),
          ),
        ],
      ),
    );
  }
}

class PriceDetailWidget extends StatelessWidget {
  const PriceDetailWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
     // height: size.height * 0.33,
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
                  CustomPriceDetailRow(
                    titleText: AppLocalizations.of(context).totalItem,
                    priceText: '04',
                  ),
                  CustomPriceDetailRow(
                      titleText: AppLocalizations.of(context).totalAed, priceText: 'AED 62.04'),
                  CustomPriceDetailRow(
                      titleText: AppLocalizations.of(context).subTotal, priceText: 'AED 0.00'),
                  CustomPriceDetailRow(
                      titleText: AppLocalizations.of(context).shipping, priceText: 'AED 23.00'),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalizations.of(context).tax,
                              style: AppThemeData.font12Weight400Gray),

                          Text(' (VAT 5.0%)',
                              style: AppThemeData.font12Weight400Gray),
                        ],
                      ),
                      Text(
                        'AED 0.00',
                        style: AppThemeData.font12Weight400Gray,
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

class CustomPriceDetailRow extends StatelessWidget {
  final String titleText;
  final String priceText;

  const CustomPriceDetailRow({
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
