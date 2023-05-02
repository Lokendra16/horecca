import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
class HomeTestimonialsWidgets extends StatelessWidget {
  const HomeTestimonialsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 3,
            (context, index) {

          return Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(AppLocalizations.of(context).testimonials,style: AppThemeData.font16Weight600PlayfairCardinal,),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 3 ; i++)
                      Container(

                        margin: const EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                            color: ColorName.white, border: Border.all(color: ColorName.silver)),
                        child: Column(

                          children: [
                           Text('“professional service.\nGoods delivered even before expected time.\nFair prices and very good customer support.” ',
                             style: AppThemeData.font10Weight400Black,
                           ),
                            Text('Ayyman',style: AppThemeData.font10Weight600Black,)
                          ],
                        ),
                      ),

                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
