import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/commons/utils/utility.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Obx(
              () => DrawerHeader(
                decoration: const BoxDecoration(
                  color: ColorName.panache,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: ColorName.white, borderRadius: BorderRadius.circular(80)),
                      child: Center(
                          child: Image.asset(
                        Assets.images.icAppicon.path,
                        height: 50,
                      )),
                    ),
                    Center(
                      child: Text(
                        controller.userName.value,
                        style: AppThemeData.font16Weight600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: Text(AppLocalizations.of(context).home),
              onTap: () {
                Get.back();
              },
            ),
            if (controller.isUserLoggedIn.value)
              ListTile(
                leading: const Icon(Icons.shopping_bag_outlined),
                title: Text(AppLocalizations.of(context).myOrder),
                onTap: () {
                  Get.toNamed(AppRoutes.myOrderScreen);
                },
              ),
            if (controller.isUserLoggedIn.value)
              ListTile(
                leading: const Icon(Icons.person_outlined),
                title: Text(AppLocalizations.of(context).addressBook),
                onTap: () {
                  Get.toNamed(AppRoutes.savedAddressScreen);
                },
              ),
            ListTile(
              leading: const Icon(Icons.favorite_outline),
              title: Text(AppLocalizations.of(context).wishList),
              onTap: () {
                Get.toNamed(
                  AppRoutes.wishListScreen,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.star_border_outlined),
              title: Text(AppLocalizations.of(context).rateUs),
              onTap: () {
                if (Platform.isIOS) {
                  Utility.launchURL(Utility.rateUsURLIOS);
                } else {
                  Utility.launchURL(Utility.rateUsURLAndroid);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.email_outlined),
              title: Text(AppLocalizations.of(context).contactUs),
              onTap: () {
                Utility.launchMail('mailto:example@gmail.com');
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: Text(AppLocalizations.of(context).privacyPolicy),
              onTap: () {
                Get.toNamed(AppRoutes.webview, arguments: Utility.privacyPolicyURL);
              },
            ),
            if (controller.isUserLoggedIn.value)
              ListTile(
                leading: const Icon(
                  Icons.logout_outlined,
                  color: ColorName.cardinal,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: ColorName.cardinal),
                ),
                onTap: () {
                  controller.logOut(context);
                },
              ),
            if (!controller.isUserLoggedIn.value)
              ListTile(
                leading: const Icon(
                  Icons.login,
                  color: ColorName.jewel,
                ),
                title: const Text(
                  'Login',
                  style: TextStyle(color: ColorName.jewel),
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.loginScreen);
                },
              ),
          ],
        ),
      ),
    );
  }
}
