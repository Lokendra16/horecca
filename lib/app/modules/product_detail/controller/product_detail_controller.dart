import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/networking/api_client/api_client.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';
import 'package:the_horeca_store/networking/models/home/home_collections.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';

class ProductDetailController extends GetxController {

  dynamic arguments = Get.arguments;
  var quantity = 1.obs;
  var title = "".obs;
  var isLoading = true.obs;
  var isExpanded = false.obs;
  var additionalInfoExpanded = false.obs;
  var currentPageIndex = 0.obs;
  var pageController = PageController();
  Rx<ProductData> productDetail = ProductData().obs;
  Rx<HomeCollections> productRecommendationList = HomeCollections().obs;
  var isLoadingRecommendation = true.obs;

  void incrementQuantity() {
    if (quantity.value < 10) {
      quantity.value++;
    }
  }

  void decrementQuantity() {
    if (quantity.value >= 1) {
      quantity.value--;
    }
  }

  void changePageIndex(int index) {
    currentPageIndex.value = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    _getProductDetail();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _getProductDetail() async {
    isLoading.value = true;
    var api = await RestClient().getProductDetail(arguments);
    productDetail.value = api.product;
    title.value = productDetail.value.title ?? '';
    isLoading.value = false;
    productRecommendations(productDetail.value.id.toString());
  }

  void addToCart() {
    String variantId = getVariantId();
    GraphQLRepo().addToCart(quantity.value, variantId).then((value) {
      /*AppPreference().get(AppPreference.KEY_CART_ID).then((cartId) {
        if(cartId == null || cartId.isEmpty || cartId == "0"){
          AppPreference().setString(AppPreference.KEY_CART_ID, value);
          Get.toNamed(AppRoutes.cartScreen);
        }
      });*/

      AppPreference().setString(AppPreference.KEY_CART_ID, value);
      Get.toNamed(AppRoutes.cartScreen);

    }).onError((error, stackTrace) {
      MySnackBar().errorSnackBar(error.toString());
    });
  }

  String getVariantId() {
    if (productDetail.value.variants == null || productDetail.value.variants!.isEmpty) return "";
    for (var element in productDetail.value.variants!) {
      if (element.id != null && element.id.toString().isNotEmpty) {
        return element.id.toString();
      }
      return "";
    }
    return "";
  }

  void selectedDefaultVariants() {
    if (productDetail.value.options != null && productDetail.value.options!.isNotEmpty) {
      for (var element in productDetail.value.options!) {
        element.selectedOptionIndex = 0;
      }
    }
  }

  void productRecommendations(String id) async {
    GraphQLRepo().productRecommendationApi(id).then((value) {
      filterProducts(value);
    }).onError((error, stackTrace) {
      MySnackBar().errorSnackBar(error.toString());
    });
  }

  void filterProducts(response) {
    List<HomeProducts> products = [];
    response.forEach((parent) {
       var img = null;
       try{
         if (parent["images"] != null && parent["images"].isNotEmpty) {
           img = parent["images"]["nodes"][0]["url"];
         }
       }catch(e){
          img = null;
       }

      products.add(HomeProducts(
        id: parent["id"],
        title: parent["title"],
        image: img,
      ));
    });

    productRecommendationList.value = HomeCollections(id: '', title: "You may also like", products: products, image: "");
    isLoadingRecommendation.value = false;
    update();
  }
}
