import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

import '../modules/cart_screen/controller/cart_controller.dart';

class AppBarHome extends StatelessWidget {
  final VoidCallback onMenuClick;
  final VoidCallback onCartClick;

  AppBarHome({
    Key? key,
    required this.onMenuClick,
    required this.onCartClick,
  }) : super(key: key);

  final CartScreenController controller = Get.put(CartScreenController());

  @override
  void onInit() {
    controller.cartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //centerTitle: true,
        backgroundColor: ColorName.white,
        leading: InkWell(
          onTap: onMenuClick,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 14, bottom: 14, right: 10.0, left: 10.0),
            child: Assets.icons.icMenu.svgIcon(
              size: 18,
              color: ColorName.black,
            ),
          ),
        ),
        title: Image.asset(
          Assets.images.icAppicon.path,
          height: 52,
        ),
        actions: [
          InkWell(
            onTap: onCartClick,
            child: Padding(
                padding:
                    const EdgeInsets.only(right: 20.0, left: 10.0, top: 10),
                child: badges.Badge(
                  badgeContent: Obx(
                    () => Text(
                      "${controller.cartData.value.productList?.length ?? 0}",
                      style: AppThemeData.loginButton,
                    ),
                  ),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: ColorName.jewel,
                  ),
                  child: Assets.icons.icCart.svgIcon(
                    size: 26,
                    color: ColorName.black,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
