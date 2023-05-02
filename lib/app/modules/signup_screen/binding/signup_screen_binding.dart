
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/signup_screen/controller/signup_controller.dart';

class SignupScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}