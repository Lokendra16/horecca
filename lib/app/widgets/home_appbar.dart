import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
import 'package:badges/badges.dart' as badges;

class AppBarHome extends StatelessWidget {
  final VoidCallback onMenuClick; //TODO Change name to onMenuClick
  final VoidCallback onCartClick; //TODO Change name to onCartClick

  const AppBarHome({
    Key? key,
    required this.onMenuClick,
    required this.onCartClick,
  }) : super(key: key);

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
            padding: const EdgeInsets.only(top:14,bottom:14,right: 10.0, left: 10.0),
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
              padding: const EdgeInsets.only(right: 10.0, left: 10.0,),
              child:  /* badges.Badge(
                badgeContent: Text('0',style: AppThemeData.loginButton,),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: ColorName.jewel,
                ),
                child: Assets.icons.icCart.svgIcon(
                  size: 26,
                  color: ColorName.black,
                ),
              )*/
              Assets.icons.icCart.svgIcon(
                size: 26,
                color: ColorName.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

