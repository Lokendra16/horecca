
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/review_screen/controller/review_screen_controller.dart';

class ReviewScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewScreenController>(() => ReviewScreenController());
  }
}