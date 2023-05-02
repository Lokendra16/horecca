import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
class ShoppingBagList extends StatelessWidget {
  const ShoppingBagList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
        itemBuilder: (context ,index){
      return Container(
        margin: const EdgeInsets.only(bottom: 12),

        height: size.height * 0.2,
        color: ColorName.white,
          child: Row(
            children: [
              Container(
               /* height: size.height * 0.2,
                width: size.width * 0.3,*/
                decoration: BoxDecoration(
                  border: Border.all(color: ColorName.silver)
                ),
                margin: EdgeInsets.only(left: 3),
                child: Center(child: Image.asset(Assets.images.productImage.path,height: 123,),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8,bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Snackholder",style: AppThemeData.font16Weight400,),
                    const SizedBox(height: 8,),
                    Text('Material: Steel',style: AppThemeData.font14Weight400Gray),
                    const SizedBox(height: 6,),
                    Text('Category: Appetizer & Side',style: AppThemeData.font14Weight400Gray,),
                    const Spacer(),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Row(

                        children: [
                         Text(AppLocalizations.of(context).quantity,
                           style: AppThemeData.font14Weight600Cardinal,),
                          Text(" ${index}",
                           style: AppThemeData.font14Weight600Cardinal,),
                          const Spacer(),
                          Text("AED 08.00",style: AppThemeData.font14Weight600Cardinal,
                           ),
                        ],
                      ),
                    ),
                  ],

                ),
              )
            ],
          ),
      );
    });
  }
}
