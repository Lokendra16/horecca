import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/shopping_bag/controller/shopping_bag_controller.dart';
class ShoppingBagBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ShoppingBagController>(() => ShoppingBagController());
  }
}