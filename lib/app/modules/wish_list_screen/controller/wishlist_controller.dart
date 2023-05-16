import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/widgets/product_gridview/product_gridview_model.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/networking/api_client/api_client.dart';

class WishlistController extends GetxController {
  RxList productList = [].obs;
  static const _pageSize = 250;

  var isLoading = true.obs;
  var isEmpty = false.obs;

  void onClick(index) {
    myGridList[index].isActive = !myGridList[index].isActive;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  onReady() {
    super.onReady();
    getWishListId();
  }

  getWishListId() async {
    debugPrint('call get wish list');
    await AppPreference().getWishlistIds().then((value) {
      if (value != null) {
        debugPrint('call get wish list if');
        getProductList(0, value);
      } else {
        debugPrint('call get wish list else');

        isEmpty.value = true;
        isLoading.value = false;
      }
    });
  }

  Future<void> getProductList(int pageKey, String? productIds) async {
    debugPrint('call get product list');
    debugPrint('product id : ${productIds}');

    final client = RestClient();
    if (productIds!.isNotEmpty && productIds != '') {
      var newItems =
          await client.getProductList("", pageKey, _pageSize, "", productIds);
      isLoading.value = false;
      isEmpty.value = false;

      productList.value = newItems.products!;
    }
    isLoading.value = false;

    print('prdouct list : ${productList.length}');
  }

  void removeItem(int index) {
    AppPreference()
        .addRemoveFromWishlist(
            Uri.parse(productList[index].id.toString()).pathSegments.last)
        .then((value) {
      productList.removeAt(index);
      AppPreference().getWishlistIds().then((value) {
        if (value != null && value.isNotEmpty) {
        } else {
          isEmpty.value = true;
          isLoading.value = false;
        }
      });
      update();
    });
  }
}
