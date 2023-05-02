import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class HomeCategoryGridView extends StatelessWidget {
  const HomeCategoryGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (BuildContext context, index) {
        return Container(
                width: size.width * 0.47,
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: ColorName.white,
              border: Border.all(color: ColorName.silver)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 17,
                    width: 47,
                    color: ColorName.jewel,
                    child: Center(
                        child: Text(
                      '10% 0ff',
                      style: AppThemeData.discountTextStyle,
                    )),
                  ),
                  const Icon(
                    Icons.favorite_outline_outlined,
                    size: 25,
                  ),
                ],
              ),
              Image.asset(
                Assets.images.dryerImageCopy.path,
                height: size.height * 0.15,
              ),
              const Divider(
                color: ColorName.gray410,
              ),
               SizedBox(
                 width: size.width * 0.3,
                 child: Text(
                  'Revo cord keeper',
                  style: AppThemeData.font12Weight700,
              ),
               ),
              const SizedBox(
                height: 10,
              ),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('AED 150.55', style: AppThemeData.homeProductPrice),
                  SizedBox(width: 8,),
                  Text(
                    'AED 134.75',
                    style: AppThemeData.homeActualPrice,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
