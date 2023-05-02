
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/product_detail/controller/product_detail_controller.dart';

class ProductDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
  }
}