import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class UserAccessWidget extends StatelessWidget {
  final String usrAccessTxt;
  final String loginSignupTxt;
  final Function() onPressed;

  const UserAccessWidget(
      {Key? key, required this.usrAccessTxt, required this.loginSignupTxt, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 54,right: 54),
        height: 40,
        decoration: BoxDecoration(
          color: ColorName.mercury,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              usrAccessTxt,
              style: AppThemeData.font14Weight400,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              loginSignupTxt,
              style: AppThemeData.font14Weight600Cardinal,
            ),
          ],
        ),
      ),
    );
  }
}
