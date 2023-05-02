import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/wish_list_screen/controller/wishlist_controller.dart';

class WishListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(() => WishlistController());
  }
}