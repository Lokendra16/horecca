import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class PrimaryCheckOutBtn extends StatelessWidget {
  final IconData? buttonIcon;
  final String btnText;
  final Function()  onClick;

  const PrimaryCheckOutBtn({Key? key, this.buttonIcon, required this.btnText, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
        height: 40,
        width: double.infinity,
        decoration:
            BoxDecoration(color: ColorName.cardinal, borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonIcon != null
                  ? Icon(
                      buttonIcon,
                      color: ColorName.white,
                    )
                  : const SizedBox(),
              Text(
                btnText,
                style: AppThemeData.font14Weight700,
              )
            ],
          ),
        ),
      ),
    );
  }
}
