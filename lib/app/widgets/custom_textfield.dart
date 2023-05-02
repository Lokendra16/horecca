import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  bool obscureText = false;
  final TextInputType keyboardType;
  final Widget? suffixImage;
  final Widget? prefixImage;

  final EdgeInsetsGeometry padding;
  final int? textFieldLength;

  CustomTextField({
    Key? key,
    required this.obscureText,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    this.suffixImage,
    this.prefixImage,
    required this.padding,
    this.textFieldLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 40,
      width: size.width,
      decoration: BoxDecoration(
          color: ColorName.white,
          boxShadow: const [
            BoxShadow(
                color: ColorName.silver, //New
                blurRadius: 1.0,
                offset: Offset(-1, 1))
          ],
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: TextFormField(
          maxLength: textFieldLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          style: AppThemeData.font14Weight400Gray,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            //contentPadding: const EdgeInsets.all(6),
            contentPadding: padding,
            suffixIcon: suffixImage,
            prefixIcon: prefixImage,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: AppThemeData.font14Weight400Gray,
          ),
        ),
      ),
    );
  }
}
