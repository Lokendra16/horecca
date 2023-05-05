import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_horeca_store/app/modules/cart_screen/controller/cart_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/app/widgets/cart_item.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final CartScreenController controller = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.mercury,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarCart(
          title: AppLocalizations.of(context).cart,
          hideCartButton: true,
          hideSearchButton: true,
          onBackPressed: () => Get.back(),
        ),
      ),
      body: Obx(
        () => controller.isInitialLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorName.jewel,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.cartData.value.productList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CartItem(item: controller.cartData.value.productList![index],onRemove: () {
                          controller.removeProductFromCart(index);
                        },);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      boxShadow: [BoxShadow( color: ColorName.silver,blurRadius: 2)],
                        color: ColorName.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                          child: Text(
                            AppLocalizations.of(context).priceDetails,
                            textAlign: TextAlign.start,
                            style: AppThemeData.sf500Font16Black,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          color: ColorName.silver,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).totalItem,
                                style: AppThemeData.sf400Font15Gray,
                              ),
                              const Text(
                                "04",
                                style: AppThemeData.sf400Font15Gray,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).totalAed,
                                style: AppThemeData.sf400Font15Gray,
                              ),
                              const Text(
                                "62.04",
                                style: AppThemeData.sf400Font15Gray,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).discountOnAed,
                                style: AppThemeData.sf400Font15Gray,
                              ),
                              const Text(
                                "11.02",
                                style: AppThemeData.sf400Font15Gray,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).couponDiscount,
                                style: AppThemeData.sf400Font15Gray,
                              ),
                              const Text(
                                "Apply Coupon",
                                style:
                                AppThemeData.sf500Font16,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context).other,
                                style: AppThemeData.sf400Font15Gray,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  AppLocalizations.of(context).knowMore,
                                  style: AppThemeData.sf500Font16,
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  "04",
                                  textAlign: TextAlign.end,
                                  style:
                                  AppThemeData.sf400Font15Gray,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          color: ColorName.silver,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total ${controller.cartData.value.totalCC}",
                                style: AppThemeData.sf500Font16,
                              ),
                              Text(
                                controller.cartData.value.totalAmount,
                                style: AppThemeData.sf500Font16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.savedAddressScreen,arguments: {
                          "checkOutUrl": controller.cartData.value.checkoutUrl,
                          "showCheckout": true,
                        });
                      },
                      style: TextButton.styleFrom(backgroundColor: ColorName.cardinal),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Assets.icons.icCheckout.svgIcon(size: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(AppLocalizations.of(context).proceedToCheckOut,
                                style: AppThemeData.sf400Font15White),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
