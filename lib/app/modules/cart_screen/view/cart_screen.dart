import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:the_horeca_store/app/modules/cart_screen/controller/cart_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/app/widgets/cart_item.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.g({Key? key}) : super(key: key);

  final CartScreenController controller = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    debugPrint(
        'cart screen1 : ${controller.cartData.value.productList?.length.toString()}');

    debugPrint(
        'cart screen : ${controller.cartData.value.productList?[0].quantity}');

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
                  Obx(
                    () => Expanded(
                      child: controller.cartData.value.productList != null
                          ? ListView.builder(
                              itemCount: controller
                                      .cartData.value.productList?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                print(
                                    'list view :${controller.cartData.value.productList?[index].variants}');
                                var quantity = controller.cartData.value
                                    .productList![index].quantity;
                                return CartItem(
                                  item: controller
                                      .cartData.value.productList![index],
                                  onRemove: () {
                                    deleteItem(context, index);
                                  },
                                  decrease: () {
                                    controller.decrementQuantity(
                                        quantity,
                                        controller.cartData.value
                                            .productList?[index].lineId);
                                  },
                                  increase: () {
                                    controller.incrementQuantity(
                                        quantity,
                                        controller.cartData.value
                                            .productList?[index].lineId);
                                  },
                                );
                              },
                            )
                          : Container(
                              color: Colors.white,
                              child:
                                  const Center(child: Text('Cart Not Found'))),
                    ),
                  ),
                  controller.cartData.value.productList != null
                      ? Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(color: ColorName.silver, blurRadius: 2)
                          ], color: ColorName.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0, left: 10.0),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).totalItem,
                                      style: AppThemeData.sf400Font15Gray,
                                    ),
                                    Text(
                                      controller
                                          .cartData.value.productList!.length
                                          .toString(),
                                      style: AppThemeData.sf400Font15Gray,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).totalAed,
                                      style: AppThemeData.sf400Font15Gray,
                                    ),
                                    Text(
                                      controller.cartData.value.subtotalAmount
                                          .toString(),
                                      style: AppThemeData.sf400Font15Gray,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)
                                          .discountOnAed,
                                      style: AppThemeData.sf400Font15Gray,
                                    ),
                                    Text(
                                      controller.cartData.value.totalTaxAmount
                                          .toString(),
                                      style: AppThemeData.sf400Font15Gray,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                        )
                      : SizedBox(),
                  controller.cartData.value.productList != null
                      ? Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.savedAddressScreen,
                                  arguments: {
                                    "checkOutUrl":
                                        controller.cartData.value.checkoutUrl,
                                    "showCheckout": true,
                                  });
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: ColorName.cardinal),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child:
                                      Assets.icons.icCheckout.svgIcon(size: 20),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                      AppLocalizations.of(context)
                                          .proceedToCheckOut,
                                      style: AppThemeData.sf400Font15White),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
      ),
    );
  }

  void deleteItem(BuildContext context, int pos) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Product?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure to delete this product from the cart?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                controller.removeProductFromCart(pos);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
