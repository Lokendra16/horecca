import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:the_horeca_store/app/modules/category_screen/view/category_list_screen.dart';
import 'package:the_horeca_store/app/modules/home_screen/view/home_screen.dart';
import 'package:the_horeca_store/app/modules/my_account/view/my_account_screen.dart';
import 'package:the_horeca_store/app/modules/wish_list_screen/view/wish_list_screen.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

import '../../product_list/view/product_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final DashboardScreenController dashboardController = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(8),
          height: 56,
          decoration: BoxDecoration(
              color: ColorName.panache,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorName.silver)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                  dashboardController: dashboardController,
                  title: AppLocalizations.of(context).home,
                  tabIndex: 0,
                  icon: Assets.icons.icHome),
              BottomNavItem(
                  dashboardController: dashboardController,
                  title: AppLocalizations.of(context).category,
                  tabIndex: 1,
                  icon: Assets.icons.icCategory),
              BottomNavItem(
                  dashboardController: dashboardController,
                  title: AppLocalizations.of(context).sale,
                  tabIndex: 2,
                  icon: Assets.icons.icSale),
              BottomNavItem(
                  dashboardController: dashboardController,
                  title:  AppLocalizations.of(context).wishList,
                  tabIndex: 3,
                  icon: Assets.icons.icWishlist),
              BottomNavItem(
                  dashboardController: dashboardController,
                  title:  AppLocalizations.of(context).myAccount,
                  tabIndex: 4,
                  icon: Assets.icons.icProfile),
            ],
          ),
        ),
        body: Obx(
          () => _pages[dashboardController.tabIndex.value],
        ));
  }

  final List<Widget> _pages = [
    HomeScreen(),
    CategoryListScreen(),
    ProductListScreen(),
    WishListScreen(),
    MyAccountScreen(),
  ];
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.dashboardController,
    required this.icon,
    required this.title,
    required this.tabIndex,
  });

  final int tabIndex;
  final String title;
  final SvgGenImage icon;

  final DashboardScreenController dashboardController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
          onTap: () {
            dashboardController.changeTabIndex(tabIndex);
          },
          child: Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 7),
              width: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  icon.svgIcon(
                    size: 24,
                    color: dashboardController.tabIndex == tabIndex
                        ? ColorName.cardinal
                        : ColorName.black,
                  ),
                  FittedBox(
                    child: Text(
                      title,
                      style: dashboardController.tabIndex == tabIndex
                          ? AppThemeData.font12Weight400Cardinal
                          : AppThemeData.font12Weight400Black,
                    ),
                  ),
                  dashboardController.tabIndex == tabIndex
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 2,
                            width: double.infinity,
                            color: ColorName.cardinal,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          )),
    );
  }
}
