
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/cart_screen/controller/cart_controller.dart';

class CartScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartScreenController>(() => CartScreenController());
  }
}