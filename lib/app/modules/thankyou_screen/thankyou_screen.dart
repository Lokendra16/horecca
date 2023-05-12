import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';

import '../../../l10n/localization.dart';
import '../../../src/gen/assets.gen.dart';
import '../../../src/gen/colors.gen.dart';
import '../home_screen/view/home_screen.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.asset(
              Assets.images.icAppicon.path,
              height: 70,
            ),
            SizedBox(height: 120,),
            Center(child: Row(
              children: [
               Icon(Icons.check_circle,color: Colors.green,),
                SizedBox(width: 5,),
                Text("Thank you for shopping with us",style: AppThemeData.font16Weight600,),
              ],
            )),
            SizedBox(height: 20,),
            Container(
              height: 80,
              width: 300,
              decoration: BoxDecoration( border: Border.all(color: Colors.black.withOpacity(0.4),),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your order is confirmed",style: AppThemeData.font14Weight600Black,),
                    SizedBox(height: 10,),
                    Text("You may receive a confirmation text with your order number shortly",
                      style: AppThemeData.font12Weight400Black,)
                  ],
                ),
              )
            ),
            SizedBox(height: 30,),
            Container(
                height: 110,
                width: 300,
                decoration: BoxDecoration( border: Border.all(color: Colors.black.withOpacity(0.4),),borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your order is confirmed",style: AppThemeData.font14Weight600Black,),
                      SizedBox(height: 10,),
                      Text("You may get shipping and delivery updates by text",
                        style: AppThemeData.font12Weight400Black,),
                      SizedBox(height: 10,),
                      Container(
                        height: 30,
                        width: 240,
                        decoration: BoxDecoration( border: Border.all(color: Colors.black.withOpacity(0.4),),borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Icon(Icons.email,color: Colors.green,),
                              SizedBox(width: 10,),
                              Text("Get shipping updates by email",style: AppThemeData.font12Weight400green,)

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),

            SizedBox(height: 60,),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(

                onPressed: () {
                  Get.to(HomeScreen());
                },
                style:
                TextButton.styleFrom(backgroundColor: ColorName.cardinal),
                child: Text("Continue Shopping",
                    style: AppThemeData.font14Weight700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
