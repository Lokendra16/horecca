import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';

import '../../../networking/models/table_accessories/table_accesories_module.dart';
import '../../../src/gen/assets.gen.dart';
import '../../../src/gen/colors.gen.dart';

class TabAccessories extends StatelessWidget {
  TabAccessories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          "Table Accessories",
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
      body: Card(

        child: ListView.builder(
          itemCount: tabaccess?.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              collapsedTextColor: Colors.black87,
              textColor: ColorName.cardinal,
              childrenPadding: EdgeInsets.all(7),
              title: Text(tabaccess!
              [index].title),
              children: <Widget>[
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(index == 0)
                        for (var i = 0 ; i< servingsolution.length ; i++)
                          Padding(
                            padding: const EdgeInsets.only(left: 70,right: 10),
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(servingsolution[i].title),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),

                      if(index == 1)
                        for (var i = 0 ; i< tableTopSolution.length ; i++)
                          Padding(
                            padding: const EdgeInsets.only(left: 70,right: 10),
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(tableTopSolution[i].title),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                      if(index == 2)
                        for (var i = 0 ; i< tablePresntation.length ; i++)
                          Padding(
                            padding: const EdgeInsets.only(left: 70,right: 10),
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(tablePresntation[i].title),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                      if(index == 3)
                        for(var i = 0 ;i< counterSolution.length ; i++)
                          Padding(
                            padding: const EdgeInsets.only(left: 70,right: 10),
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(counterSolution[i].title),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                      if(index == 4)
                        for (var i = 0 ; i< barSolution.length ; i++)
                          Padding(
                            padding: const EdgeInsets.only(left: 70,right: 10),
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(barSolution[i].title),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),

                      if(index == 5)
                        for (var i = 0 ; i< menuSignage.length ; i++)
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                             child:Container(
                               height:30,
                               width:size.width*0.99 ,
                              child:  Padding(
                                padding: const EdgeInsets.only(left: 70,right: 10),
                                child: Container(
                                  height: 40,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(menuSignage[i].title),
                                      Assets.icons.icArrowForward.svgIcon(
                                          color: ColorName.black,size: 14),
                                    ],
                                  ),
                                ),
                              ),
                            // ListTile(
                            //   tileColor: Colors.grey.shade200,
                            //   leading: Text(menuSignage[i].title),),
                          ),
                          ),
                    ]
                )

              ],
            );
          },
        ),
      ),
    );
  }
}