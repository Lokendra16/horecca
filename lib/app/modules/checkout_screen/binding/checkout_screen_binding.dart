import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/checkout_screen/controller/checkout_screen_controller.dart';

class CheckoutScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutScreenController>(
      () => CheckoutScreenController(),
    );
  }
}