
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/my_account/controller/my_account_controller.dart';

class MyAccountBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MyAccountController>(() => MyAccountController());
  }
}