
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/sub_category/controller/sub_category_controller.dart';

class SubCategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SubCategoryController>(() => SubCategoryController());
  }
}