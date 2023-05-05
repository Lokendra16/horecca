import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';

import '../../../networking/models/banqut&Confrence/banquet&Confrnece.dart';
import '../../../src/gen/assets.gen.dart';
import '../../../src/gen/colors.gen.dart';

class BanquetConfrenceScreen extends StatelessWidget {
  const BanquetConfrenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEFEFF0),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        title: Text(
          "Banquet & Confrence",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        actions: [
          SizedBox(


              child: Icon(
                Icons.search,
                color: Color(0xff000000).withOpacity(0.6),
              )),
          const SizedBox(


            width: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xff000000).withOpacity(0.6),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: banquetList?.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            childrenPadding: EdgeInsets.all(7),
            collapsedTextColor: Colors.black87,
            textColor: ColorName.cardinal,
            title: Text(banquetList!
            [index].title),
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(index == 0)
                      for (var i = 0 ; i< banquetChair.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: Container(
                            height: 40,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(banquetChair![i].title),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 14),
                              ],
                            ),
                          ),
                        ),

                    if(index == 1)
                      for (var i = 0 ; i<confrneceTable.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: Container(
                            height: 40,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(confrneceTable![i].title),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 14),
                              ],
                            ),
                          ),
                        ),

                    if(index == 2)
                      for (var i = 0 ; i<banquetstable.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: Container(
                            height: 40,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(banquetstable![i].title),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 14),
                              ],
                            ),
                          ),
                        ),
                    if(index == 3)
                      for (var i = 0 ; i<cockTailTable.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: Container(
                            height: 40,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cockTailTable![i].title),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 14),
                              ],
                            ),
                          ),
                        ),
                    if(index == 4)
                      for (var i = 0 ; i<tableTrolly.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: Container(
                            height: 40,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(tableTrolly![i].title),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 14),
                              ],
                            ),
                          ),
                        ),
                    if(index == 5)
                      for (var i = 0 ; i<stageLecterns.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: Container(
                            height: 40,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(stageLecterns![i].title),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 14),
                              ],
                            ),
                          ),
                        ),
                    if(index == 6)
                      for (var i = 0 ; i<danceFloorSeprator.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: Container(
                            height: 40,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(danceFloorSeprator![i].title),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 14),
                              ],
                            ),
                          ),
                        ),
                  ]
              )

            ],
          );
        },
      ),
    );
  }
}
