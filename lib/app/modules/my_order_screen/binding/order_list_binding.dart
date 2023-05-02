import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/my_order_screen/controller/order_list_controller.dart';

class OrderListBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<OrderListController>(() => OrderListController());
  }

}