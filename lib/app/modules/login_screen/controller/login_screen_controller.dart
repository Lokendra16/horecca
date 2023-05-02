import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/l10n/extensions.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';

class LoginScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void loginAPI() async {
    final email = emailController.text.toString();
    final password = passwordController.text.toString();

    if (!email.isValidEmail()) {
      MySnackBar().errorSnackBar("Please enter valid email");
      return;
    } else if (!password.isValidPassword()) {
      MySnackBar().errorSnackBar("Please enter valid password");
      return;
    }
    isLoading.value = true;

    GraphQLRepo().loginAPI(email, password).then((value) {
      _getCustomerDetail(value);
    }).onError((error, stackTrace) {
      MySnackBar().errorSnackBar(error.toString());
      isLoading.value = false;
    });
  }

  void _getCustomerDetail(String accessToken) async {
    GraphQLRepo().customerDetail(accessToken).then((value) {
      isLoading.value = false;
      AppPreference().setString(AppPreference.KEY_ACCESS_TOKEN, accessToken);
      AppPreference().setString(AppPreference.KEY_CUSTOMER_ID, value.id ?? '');
      AppPreference().setString(AppPreference.KEY_EMAIL, value.email ?? '');
      AppPreference().setString(AppPreference.KEY_FIRST_NAME, value.firstName ?? '');
      AppPreference().setString(AppPreference.KEY_LAST_NAME, value.lastName ?? '');
      AppPreference().setString(AppPreference.KEY_PHONE, value.phone ?? '');
      Get.offAllNamed(AppRoutes.dashboard);
    }).onError((error, stackTrace) {
      isLoading.value = false;
      MySnackBar().errorSnackBar(error.toString());
    });
  }
}
