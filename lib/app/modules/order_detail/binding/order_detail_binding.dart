import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/order_detail/controller/order_detail_controlller.dart';

class OrderDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailController>(() => OrderDetailController());
  }
}