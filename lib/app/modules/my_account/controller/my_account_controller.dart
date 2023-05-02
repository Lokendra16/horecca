import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/my_account/model/my_account_model.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';

class MyAccountController extends GetxController {
  var isUserLoggedIn = false.obs;
  var customerName = ''.obs;
  var customerEmail = ''.obs;

  List<MyAccountModel> listItems = [
    MyAccountModel(
      leadingImage: Icons.inventory_2_outlined,
      profileItemTxt: 'My order',
    ),
    MyAccountModel(
      leadingImage: Icons.navigation_outlined,
      profileItemTxt: 'Address book',
    ),
    MyAccountModel(
      leadingImage: Icons.favorite_border_outlined,
      profileItemTxt: 'Wishlist',
    ),
    MyAccountModel(
      leadingImage: Icons.star_border_outlined,
      profileItemTxt: 'Rate us',
    ),
    MyAccountModel(
      leadingImage: Icons.email_outlined,
      profileItemTxt: 'Contact us',
    ),
    MyAccountModel(
      leadingImage: Icons.policy_outlined,
      profileItemTxt: 'Privacy Policy',
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    checkAuthState();
  }

  void checkAuthState() async {
    var accessToken = await AppPreference().get(AppPreference.KEY_ACCESS_TOKEN);
    if (accessToken != null && accessToken.isNotEmpty && accessToken != "0") {
      isUserLoggedIn.value = true;
    } else {
      isUserLoggedIn.value = false;
    }
    var firstName = await AppPreference().get(AppPreference.KEY_FIRST_NAME);
    var lastName = await AppPreference().get(AppPreference.KEY_LAST_NAME);
    if (firstName != null && lastName != null && firstName.isNotEmpty && lastName.isNotEmpty) {
      customerName.value = "$firstName $lastName";
    } else {
      customerName.value = "Guest";
    }

    var email = await AppPreference().get(AppPreference.KEY_EMAIL);
    customerEmail.value = email ?? "";
  }

  void logOut(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Are you sure you want to log out of the app? Logging out will clear all your session data and return you to the login screen.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                AppPreference().clear();
                Get.offAllNamed(AppRoutes.loginScreen);
              },
            ),
          ],
        );
      },
    );
  }
}
