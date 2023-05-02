import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/l10n/extensions.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void forgotPasswordAPI() async {
    final email = emailController.text.toString();

    if (!email.isValidEmail()) {
      MySnackBar().errorSnackBar("Please enter valid email");
      return;
    }
    isLoading.value = true;

    GraphQLRepo().forgotPasswordAPI(email).then((value) {
      MySnackBar().errorSnackBar("SUCCESS");
    }).onError((error, stackTrace) {
      MySnackBar().errorSnackBar(error.toString());
      isLoading.value = false;
    });
  }
}
