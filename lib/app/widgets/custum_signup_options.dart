import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
class CustomSignupButton extends StatelessWidget {
   final Widget widget;
   final String socialText;
   CustomSignupButton({Key? key, required this.widget, required this.socialText, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: ColorName.panache,
            borderRadius: BorderRadius.circular(6),

          ),
          child: Center(child: widget),
        ),
        Text(socialText,style: AppThemeData.font14Weight400Gray,)
      ],
    );
  }
}
