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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorName.white, border: Border.all(color: ColorName.silver)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                            child: Text(
                              AppLocalizations.of(context).priceDetails,
                              textAlign: TextAlign.start,
                              style: const TextStyle(color: ColorName.black, fontSize: 18.0),
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
                                  style: GoogleFonts.roboto(fontSize: 16.0, color: ColorName.gray),
                                ),
                                Text(
                                  "04",
                                  style: GoogleFonts.roboto(fontSize: 16.0, color: ColorName.gray),
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
                                  style: GoogleFonts.roboto(fontSize: 16.0, color: ColorName.gray),
                                ),
                                Text(
                                  "62.04",
                                  style: GoogleFonts.roboto(fontSize: 16.0, color: ColorName.gray),
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
                                  style: GoogleFonts.roboto(fontSize: 16.0, color: ColorName.gray),
                                ),
                                Text(
                                  "11.02",
                                  style: GoogleFonts.roboto(fontSize: 16.0, color: ColorName.jewel),
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
                                  style: GoogleFonts.roboto(fontSize: 16.0, color: ColorName.gray),
                                ),
                                Text(
                                  "Apply Coupon",
                                  style:
                                      GoogleFonts.roboto(fontSize: 16.0, color: ColorName.cardinal),
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
                                  style: GoogleFonts.roboto(fontSize: 16.0, color: ColorName.gray),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    AppLocalizations.of(context).knowMore,
                                    style: GoogleFonts.roboto(
                                        fontSize: 16.0, color: ColorName.cardinal),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "04",
                                    textAlign: TextAlign.end,
                                    style:
                                        GoogleFonts.roboto(fontSize: 16.0, color: ColorName.jewel),
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
                                  style: GoogleFonts.roboto(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w800,
                                      color: ColorName.cardinal),
                                ),
                                Text(
                                  controller.cartData.value.totalAmount,
                                  style: GoogleFonts.roboto(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w800,
                                      color: ColorName.cardinal),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                            child: Assets.icons.icCheckout.svgIcon(size: 24),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(AppLocalizations.of(context).proceedToCheckOut,
                                style: AppThemeData.font14Weight700.copyWith(fontSize: 16.0)),
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
