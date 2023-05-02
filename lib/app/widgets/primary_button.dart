import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
class PrimaryButton extends StatelessWidget {
  final String primaryBtnText;
  const PrimaryButton({Key? key, required this.primaryBtnText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 54,right: 54),
      height: 40,

      decoration:  BoxDecoration(

        color: ColorName.cardinal,
          borderRadius: BorderRadius.circular(5)

      ),
      child:  Center(child: Text(primaryBtnText,style: AppThemeData.font20Weight700White,),),
    );
  }
}
