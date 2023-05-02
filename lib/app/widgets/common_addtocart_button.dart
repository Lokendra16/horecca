import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
class CommonAddToCartBtn extends StatelessWidget {
  final double height;
  final double? width;
  final String btnText;
  const CommonAddToCartBtn({Key? key, required this.height,  this.width, required this.btnText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width:  width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ColorName.cardinal
      ),
      child: Center(child: Text(btnText ,style: AppThemeData.font14Weight700,),),
    );
  }
}
