import 'package:flutter/material.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class SocialSignInButton extends StatelessWidget {
  final String image;
  const SocialSignInButton({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        color: ColorName.panache,
      ),
      child: Center(child: Image.asset(image,height: 30,)),
    );
  }
}
