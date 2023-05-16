import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:the_horeca_store/app/modules/wish_list_screen/controller/wishlist_controller.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/app/widgets/product_item.dart';
import 'package:the_horeca_store/l10n/localization.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({Key? key}) : super(key: key);

  final WishlistController controller = Get.put(WishlistController());
  final DashboardScreenController dashboardScreenController =
      Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    controller.getWishListId();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarCart(
          hideBackButton: true,
          title: AppLocalizations.of(context).wishList,
          onBackPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.isEmpty.value
              ? const Center(child: Text("No Products Found in Wishlist"))
              : GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 4/5,
                          crossAxisCount: 2, crossAxisSpacing: 8,mainAxisSpacing: 4),
                  itemBuilder: (context, index) {
                    return ProductItem(
                      isFromWishList: true,
                      item: controller.productList[index],
                      onWishListItemRemove: () {
                        controller.removeItem(index);
                      },
                    );
                  },
                  itemCount: controller.productList.length)),
    );
  }
}
