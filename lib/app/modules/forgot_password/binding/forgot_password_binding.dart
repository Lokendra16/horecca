
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}