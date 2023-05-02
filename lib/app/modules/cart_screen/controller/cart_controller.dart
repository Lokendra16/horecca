import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/cart_screen/model/cart_model.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/networking/models/product_data/product_image.dart';

class CartScreenController extends GetxController {
  var isInitialLoading = true.obs;
  var cartData = CartModel().obs;

  @override
  void onInit() {
    super.onInit();
    getCartAPI();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getCartAPI() async {
    isInitialLoading.value = true;
    var cartId = await AppPreference().get(AppPreference.KEY_CART_ID) ?? '';
    GraphQLRepo().cartListAPI(cartId).then(
      (value) {
        isInitialLoading.value = false;
        filterCartData(value);
      },
    ).onError(
      (error, stackTrace) {
        isInitialLoading.value = false;
        MySnackBar().errorSnackBar(error.toString());
      },
    );
  }

  void removeProductFromCart(int index) async {
    var cartId = await AppPreference().get(AppPreference.KEY_CART_ID) ?? '';
    var lineId = cartData.value.productList![index].lineId ?? '';
    GraphQLRepo().removeProductFromCart(cartId, lineId).then(
      (value) {
        cartData.value = CartModel();
        getCartAPI();
      },
    ).onError(
      (error, stackTrace) {
        isInitialLoading.value = false;
        MySnackBar().errorSnackBar(error.toString());
      },
    );
  }

  void filterCartData(response) {
    String? checkoutUrl = response["checkoutUrl"];
    String totalAmount = response["estimatedCost"]?["totalAmount"]?["amount"] ?? '0.0';
    String subtotalAmount = response["estimatedCost"]?["subtotalAmount"]?["amount"] ?? '0.0';
    String totalDutyAmount = response["estimatedCost"]?["totalDutyAmount"]?["amount"] ?? '0.0';
    String totalTaxAmount = response["estimatedCost"]?["totalTaxAmount"]?["amount"] ?? '0.0';

    String subtotalCC = response["estimatedCost"]?["subtotalAmount"]?["currencyCode"] ?? '';
    String totalDutyCC = response["estimatedCost"]?["totalDutyAmount"]?["currencyCode"] ?? '';
    String totalTaxCC = response["estimatedCost"]?["totalTaxAmount"]?["currencyCode"] ?? '';
    String totalCC = response["estimatedCost"]?["totalAmount"]?["currencyCode"] ?? '';

    List<ProductData> productList = [];

    response["lines"]["nodes"].forEach((element) {
      var product = ProductData(
          lineId: element["id"],
          quantity: element["quantity"],
          title: element["merchandise"]["product"]["title"],
          image: ProductImages(src: element["merchandise"]?["image"]?["url"] ?? ''));
      productList.add(product);
    });

    if (productList != null && productList.isNotEmpty) {
      var cartModel = CartModel(
          checkoutUrl: checkoutUrl,
          totalAmount: totalAmount,
          totalCC: totalCC,
          subtotalAmount: subtotalAmount,
          subtotalCC: subtotalCC,
          totalDutyAmount: totalDutyAmount,
          totalDutyCC: totalDutyCC,
          totalTaxAmount: totalTaxAmount,
          totalTaxCC: totalTaxCC,
          productList: productList);

      cartData.value = cartModel;
    }
  }
}
