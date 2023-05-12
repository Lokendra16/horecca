import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:the_horeca_store/app/modules/home_screen/view/home_category_widget.dart';
import 'package:the_horeca_store/app/modules/product_list/controller/product_listview_controller.dart';
import 'package:the_horeca_store/app/modules/product_list/view/product_list_screen.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/commons/utils/utility.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/networking/models/category_data/category_model.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class SideMenu extends StatelessWidget {
  final Rx<CategoryResponse> homeList;

  SideMenu({Key? key, required this.homeList}) : super(key: key);

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: ColorName.white,
      child: ListView(
        children: <Widget>[
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.userName.value,
                    style: AppThemeData.font16Weight600,
                  ),
                  const Spacer(),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        color: ColorName.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                        child: Image.asset(
                      Assets.images.icAppicon.path,
                      height: 40,
                    )),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: ColorName.mercury,
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: Text(
              AppLocalizations.of(context).home,
            ),
            onTap: () {
              Get.back();
            },
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: ColorName.mercury,
          ),
          if (controller.isUserLoggedIn.value)
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: Text(AppLocalizations.of(context).myOrder),
              onTap: () {
                Get.toNamed(AppRoutes.myOrderScreen);
              },
            ),
          Container(
            height: 1,
            width: double.infinity,
            color: ColorName.mercury,
          ),
          if (controller.isUserLoggedIn.value)
            ListTile(
              leading: const Icon(Icons.person_outlined),
              title: Text(AppLocalizations.of(context).addressBook),
              onTap: () {
                Get.toNamed(AppRoutes.savedAddressScreen);
              },
            ),
          Container(
            height: 1,
            width: double.infinity,
            color: ColorName.mercury,
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
          Container(
            height: 1,
            width: double.infinity,
            color: ColorName.mercury,
          ),

          Container(
            height: 1,
            width: double.infinity,
            color: ColorName.mercury,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            color: ColorName.mercury,
            width: double.infinity,
            height: 30,
            alignment: Alignment.centerLeft,
            child: const Text('SHOP ALL CATEGORIES',
                style: AppThemeData.sf400Font12Black),
          ),
          for (var value in homeList.value.custom_collections!)
            Obx(
              () => homeList.value.custom_collections != null
                  ? InkWell(
                      onTap: () {
                        debugPrint("id line 37: ${value.id}");
                        Get.delete<ProductListController>();
                        Get.to(() => ProductListScreen(),
                            arguments: [
                              ProductListController.TYPE_CATEGORY_PRODUCTS,
                              Uri.parse(value.id.toString() ?? '')
                                  .pathSegments
                                  .last,
                              value.title
                            ],
                            binding: BindingsBuilder.put(
                                () => ProductListController()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: value.image != null
                                        ? Container(
                                            margin:
                                                const EdgeInsets.only(left: 20),
                                            width: 22,
                                            height: 22,
                                            child: CachedNetworkImage(
                                              width: 22,
                                              height: 22,
                                              imageUrl: value.image?.src ?? '',
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) {
                                                return const CirclePlaceholderImg();
                                              },
                                              errorWidget:
                                                  (context, url, error) {
                                                return const CirclePlaceholderImg();
                                              },
                                            ),
                                          )
                                        : const CirclePlaceholderImg(),
                                  ),
                                  const SizedBox(width: 10),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 8),
                                      child: Text(
                                        value.title ?? '',
                                        style: AppThemeData.sf500Font12
                                            .copyWith(fontSize: 14),
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: ColorName.silver,
                          ),
                        ],
                      ),
                    )
                  : const CircularProgressIndicator(),
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
          Container(
            height: 1,
            width: double.infinity,
            color: ColorName.silver,
          ),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: Text(AppLocalizations.of(context).contactUs),
            onTap: () {
              Utility.launchMail('mailto:example@gmail.com');
            },
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: ColorName.silver,
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(AppLocalizations.of(context).privacyPolicy),
            onTap: () {
              Get.toNamed(AppRoutes.webview,
                  arguments: Utility.privacyPolicyURL);
            },
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: ColorName.silver,
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
    );
  }
}
