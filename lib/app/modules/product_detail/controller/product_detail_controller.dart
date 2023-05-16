import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
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
    debugPrint('get arguments : $arguments');
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

  Future<void> addToCart() async {
    String variantId = getVariantId();
    var checkCartId =
        await AppPreference().get(AppPreference.KEY_CART_ID) ?? '';
    print('variant id : $variantId');
    print('check cart id : $checkCartId');
    print('quantity : ${quantity.value}');
    if (checkCartId != null && checkCartId.isNotEmpty) {
      GraphQLRepo()
          .addToCartLine(quantity.value, variantId, checkCartId)
          .then((value) {
        Get.toNamed(AppRoutes.cartScreen);
      }).onError((error, stackTrace) {
        MySnackBar().errorSnackBar(error.toString());
      });
    } else {
      GraphQLRepo().addToCart(quantity.value, variantId).then((value) {
        /*
      AppPreference().get(AppPreference.KEY_CART_ID).then((cartId) {
        if(cartId == null || cartId.isEmpty || cartId == "0"){
          AppPreference().setString(AppPreference.KEY_CART_ID, value);
          Get.toNamed(AppRoutes.cartScreen);
        }
      });*/

        print("shubham--" + value);

        AppPreference().setString(AppPreference.KEY_CART_ID, value);
        Get.toNamed(AppRoutes.cartScreen);
      }).onError((error, stackTrace) {
        MySnackBar().errorSnackBar(error.toString());
      });
    }
  }

  void selectVariant(String lable, var items) {
    print("shubham--" + lable);
    if (productDetail.value.options != null) {
      for (var element in productDetail.value.options!) {
        int i = 0;
        for (var element2 in element.values!) {
          if (lable == element2) {
            element.selectedOptionIndex = i;
            update();
            print("shubham--" + i.toString());
            break;
          }
          i = i + 1;
        }
      }
    }
  }

  String getVariantId_() {
    if (productDetail.value.variants == null ||
        productDetail.value.variants!.isEmpty) return "";
    int i = 0;
    String variantID = "";
    for (var variationList in productDetail.value.variants!) {
      if (productDetail.value.options != null) {
        int optionLength = productDetail.value.options!.length;
        for (var options in productDetail.value.options!) {
          print("shubham--matched--" + options.selectedOptionIndex.toString());

          int k = 0;
          for (var optionsValue in options.values!) {
            if (k == optionLength) {
              print("shubham--matched break");
              break;
            } else {
              if (k == 0) {
                if (variationList.option1 == optionsValue) {
                  variantID = variationList.id.toString();
                  print("shubham--matched option1--" +
                      variationList.id.toString());
                } else {
                  break;
                }
              }
            }

            /*if (k==1 && variationList.option2 == optionsValue) {
              print("shubham--matched option2");
            }
            if (k==2 && variationList.option3 == optionsValue) {
              print("shubham--matched option3");
            }
            if (k==3 && variationList.option4 == optionsValue) {
              print("shubham--matched option4");
            }
            if (k==4 && variationList.option5 == optionsValue) {
              print("shubham--matched option5");
            }
            if (k==5 && variationList.option6 == optionsValue) {
              print("shubham--matched option6");
            }
            if (k==6 && variationList.option7 == optionsValue) {
              print("shubham--matched option7");
            }
            if (k==7 && variationList.option8 == optionsValue) {
              print("shubham--matched option8");
            }*/

            k++;
          }
        }
      }
      return variantID;
    }
    return variantID;
  }

  String getVariantId() {
    if (productDetail.value.variants == null ||
        productDetail.value.variants!.isEmpty) return "";
    for (var element in productDetail.value.variants!) {
      if (element.id != null && element.id.toString().isNotEmpty) {
        return element.id.toString();
      }
      return "";
    }
    return "";
  }

  void selectedDefaultVariants() {
    if (productDetail.value.options != null &&
        productDetail.value.options!.isNotEmpty) {
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
      try {
        if (parent["images"] != null && parent["images"].isNotEmpty) {
          img = parent["images"]["nodes"][0]["url"];
        }
      } catch (e) {
        img = null;
      }

      products.add(HomeProducts(
          id: parent["id"],
          title: parent["title"],
          image: img,
          price: parent["priceRange"]["maxVariantPrice"]['amount']));
    });

    productRecommendationList.value = HomeCollections(
        id: '', title: "You may also like", products: products, image: "");
    isLoadingRecommendation.value = false;
    update();
  }

  //here goes the function
  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}
