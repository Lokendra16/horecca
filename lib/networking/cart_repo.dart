import 'package:the_horeca_store/app/modules/cart_screen/model/cart_model.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/networking/models/product_data/product_image.dart';

class CartRepo {
  Future<String?> addToCart(
      int quantity, String variantId, String productId) async {
    var checkCartId =
        await AppPreference().get(AppPreference.KEY_CART_ID) ?? '';
    try {
      if (checkCartId.isNotEmpty) {
        await GraphQLRepo().addToCartLine(quantity, variantId, checkCartId);
      } else {
        checkCartId = await GraphQLRepo().addToCart(quantity, variantId);
        AppPreference().setString(AppPreference.KEY_CART_ID, checkCartId);
      }
      var list = await GraphQLRepo().cartListAPI(checkCartId);
      var cartData = filterCartData(list);

      var lineId = null;
      for (int i = 0; i < cartData!.productList!.length; i++) {
        if (productId == cartData.productList![i].id.toString()) {
          lineId = cartData.productList![i].lineId;
          break;
        }
      }
      return Future.value(lineId);
    } catch (e) {
      MySnackBar().errorSnackBar(e.toString());
      return Future.error(e.toString());
    }
  }

  Future<void> updateCart(quantity, lineId) async {
    var checkCartId =
        await AppPreference().get(AppPreference.KEY_CART_ID) ?? '';
    if (checkCartId.isNotEmpty) {
      return GraphQLRepo()
          .updateCartLine(quantity, checkCartId, lineId)
          .then((value) {
        return Future.value();
      }).onError((error, stackTrace) {
        MySnackBar().errorSnackBar(error.toString());
        return Future.error(error.toString());
      });
    }
  }

  Future<void> removeProductFromCart(lineId) async {
    var checkCartId =
        await AppPreference().get(AppPreference.KEY_CART_ID) ?? '';
    if (checkCartId.isNotEmpty) {
      return GraphQLRepo()
          .removeProductFromCart(checkCartId, lineId)
          .then((value) {
        return Future.value();
      }).onError((error, stackTrace) {
        MySnackBar().errorSnackBar(error.toString());
        return Future.error(error.toString());
      });
    }
  }

  CartModel? filterCartData(response) {
    String? checkoutUrl = response["checkoutUrl"];
    String totalAmount =
        response["estimatedCost"]?["totalAmount"]?["amount"] ?? '0.0';
    String subtotalAmount =
        response["estimatedCost"]?["subtotalAmount"]?["amount"] ?? '0.0';
    String totalDutyAmount =
        response["estimatedCost"]?["totalDutyAmount"]?["amount"] ?? '0.0';
    String totalTaxAmount =
        response["estimatedCost"]?["totalTaxAmount"]?["amount"] ?? '0.0';

    String subtotalCC =
        response["estimatedCost"]?["subtotalAmount"]?["currencyCode"] ?? '';
    String totalDutyCC =
        response["estimatedCost"]?["totalDutyAmount"]?["currencyCode"] ?? '';
    String totalTaxCC =
        response["estimatedCost"]?["totalTaxAmount"]?["currencyCode"] ?? '';
    String totalCC =
        response["estimatedCost"]?["totalAmount"]?["currencyCode"] ?? '';

    List<ProductData> productList = [];

    response["lines"]["nodes"].forEach((element) {
      var id = int.parse(
          element["merchandise"]["product"]["id"].toString().getLastSegment());
      var product = ProductData(
        id: id,
        lineId: element["id"],
        quantity: element["quantity"],
        title: element["merchandise"]["product"]["title"],
        image:
            ProductImages(src: element["merchandise"]?["image"]?["url"] ?? ''),
        //variants: element["merchandise"]["ProductVariant"]["priceV2"]["amount"] ?? ""
      );
      productList.add(product);
    });
    // response["lines"]["nodes"].forEach((element){
    //   var productPrice = ProductVariants(
    //     price: element["merchandise"]["ProductVariant"]["priceV2"]["amount"]
    //
    //   );
    //   print("product price : ${productPrice.price?[0]}");
    //
    //
    // });

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

      return cartModel;
    }
  }
}
