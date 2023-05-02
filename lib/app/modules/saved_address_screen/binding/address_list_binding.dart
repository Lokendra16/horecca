import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/saved_address_screen/controller/address_list_controller.dart';

class AddressListBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<AddressListController>(() => AddressListController());
  }
}