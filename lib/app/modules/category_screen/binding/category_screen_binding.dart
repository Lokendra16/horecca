import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/category_screen/controller/category_screen_controller.dart';

class CategoryScreenBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CategoryListScreenController>(() => CategoryListScreenController());
  }

}
