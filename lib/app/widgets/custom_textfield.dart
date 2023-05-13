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
          color: ColorName.white, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: TextFormField(
          maxLength: textFieldLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          style: AppThemeData.font14Weight400Gray,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: ColorName.mercury)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: ColorName.mercury)),
            //contentPadding: const EdgeInsets.all(6),
            contentPadding: padding,
            suffixIcon: suffixImage,
            prefixIcon: prefixImage,
            border: InputBorder.none,
            counterText: '',
            hintText: hintText,
            hintStyle: AppThemeData.font14Weight400Gray
                .copyWith(color: ColorName.gray.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }
}
