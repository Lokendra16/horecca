import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:the_horeca_store/app/widgets/product_gridview/product_gridview_model.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/networking/api_client/api_client.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';

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
    AppPreference().getWishlistIds().then((value) {
      print("Wishlist Ids: $value");
      if (value != null && value.isNotEmpty) {
        _getProductList(0, value
        );
      } else {
        isEmpty.value = true;
        isLoading.value = false;
      }
    });
  }

  Future<void> _getProductList(int pageKey, String? productIds) async {
    final client = RestClient();
    // TODO SENDING THE COLLECTION ID HARD CODED
    var newItems = await client.getProductList("published",pageKey, _pageSize,productIds!, "");
    isLoading.value = false;
    productList.value = newItems.products!;
  }

  void removeItem(int index) {
    AppPreference().addRemoveFromWishlist(Uri.parse(productList[index].id.toString()).pathSegments.last).then((value){
      productList.removeAt(index);
      AppPreference().getWishlistIds().then((value){
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
