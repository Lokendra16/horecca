import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';

class UserRepo {
  Future<void> addToCart(int quantity, String variantId) async {
    var checkCartId =
        await AppPreference().get(AppPreference.KEY_CART_ID) ?? '';
    print('variant id : $variantId');
    print('check cart id : $checkCartId');
    print('quantity : ${quantity}');
    if (checkCartId != null && checkCartId.isNotEmpty) {
      GraphQLRepo()
          .addToCartLine(quantity, variantId, checkCartId)
          .then((value) {
        Get.toNamed(AppRoutes.cartScreen);
      }).onError((error, stackTrace) {
        MySnackBar().errorSnackBar(error.toString());
      });
    } else {
      GraphQLRepo().addToCart(quantity, variantId).then((value) {
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
}
