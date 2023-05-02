import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/bottom_navigation/controller/bottom_navigation_controller.dart';

class DashboardScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DashboardScreenController>(() => DashboardScreenController());
  }
}