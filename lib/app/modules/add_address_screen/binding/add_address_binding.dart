
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/add_address_screen/controller/add_address_controller.dart';

class AddAddressBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddAddressController>(() => AddAddressController());
  }
}