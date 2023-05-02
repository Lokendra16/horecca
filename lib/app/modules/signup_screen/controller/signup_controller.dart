import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/l10n/extensions.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';

class SignUpController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void signUpApi() async {
    final email = emailController.text.toString();
    final password = passwordController.text.toString();
    final firstName = firstNameController.text.toString();
    final lastName = lastNameController.text.toString();

    if (!firstName.isValidValue()) {
      MySnackBar().errorSnackBar("Please enter valid first name");
      return;
    } else if (!lastName.isValidValue()) {
      MySnackBar().errorSnackBar("Please enter valid last name");
      return;
    } else if (!email.isValidEmail()) {
      MySnackBar().errorSnackBar("Please enter valid email");
      return;
    } else if (!password.isValidPassword()) {
      MySnackBar().errorSnackBar("Please enter valid password");
      return;
    }

    isLoading.value = true;

    GraphQLRepo()
        .signUp(email, password, firstNameController.text, lastNameController.text, false)
        .then((value) {
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.loginScreen);
    }).onError((error, stackTrace) {
      isLoading.value = false;
      MySnackBar().errorSnackBar(error.toString());
    });
  }
}
