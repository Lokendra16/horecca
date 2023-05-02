import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

import '../../src/gen/assets.gen.dart';
class UserReviewListview extends StatelessWidget {
  const UserReviewListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context ,index){
          return Container(
            margin: EdgeInsets.only(top: 8,bottom: 8, left: 16,right: 16),
            color: ColorName.white,
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Marvin McKinney",style: AppThemeData.selectSizeStyle,),
                    Row(
                      children: [
                        Image.asset(Assets.images.reviewStar.path,height: 12,),
                        Image.asset(Assets.images.reviewStar.path,height: 12,),
                        Image.asset(Assets.images.reviewStar.path,height: 12,),
                        Image.asset(Assets.images.reviewStar.path,height: 12,),
                        Image.asset(Assets.images.reviewStar.path,height: 12,),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 8,),
                Text("Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",style: AppThemeData.font14Weight400,)
              ],
            ),
          );
        },
        separatorBuilder: (context, index){
          return Divider();
        },
        itemCount: 3);
  }
}
