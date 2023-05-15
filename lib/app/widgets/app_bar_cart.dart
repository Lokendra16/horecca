import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class AppBarCart extends StatelessWidget {
  final String title;
  final Function() onBackPressed;
  final bool hideBackButton;
  final bool hideCartButton;
  final bool hideSearchButton;

  const AppBarCart({
    Key? key,
    required this.title,
    this.hideBackButton = false,
    this.hideCartButton = false,
    this.hideSearchButton = false,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.alabaster,
        //centerTitle: true,
        elevation: 0,
        leading: !hideBackButton
            ? Visibility(
                visible: !hideBackButton,
                child: GestureDetector(
                  onTap: () {
                    onBackPressed();
                  },
                  child: Center(
                    child: Assets.icons.icBack.svgIcon(
                      size: 20,
                      color: ColorName.black,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        title: Text(title,
            style: AppThemeData.jost26UnderLine.copyWith(fontSize: 19)),
        actions: [
          Visibility(
            visible: !hideSearchButton,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.searchScreen);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Assets.icons.icSearch.svgIcon(
                  size: 24,
                  color: ColorName.black,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !hideCartButton,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.cartScreen);
              },
              child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Assets.icons.icCart.svgIcon(
                    size: 24,
                    color: ColorName.black,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
/*
Container(
height: 30,
width: 30,
decoration: BoxDecoration(
color: ColorName.cardinal,
borderRadius: BorderRadius.circular(10)
),
)*/
