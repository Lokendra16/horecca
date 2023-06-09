import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';

import '../../../commons/utils/app_theme_data.dart';
import '../../../networking/models/banqut&Confrence/banquet&Confrnece.dart';
import '../../../src/gen/assets.gen.dart';
import '../../../src/gen/colors.gen.dart';
import '../product_list/controller/product_listview_controller.dart';
import '../product_list/view/product_list_screen.dart';

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


            child:Assets.icons.icSearch.svgIcon(
              size: 24,
              color: ColorName.black,
            ),),
          const SizedBox(

            width: 16,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Assets.icons.icCart.svgIcon(
                size: 24,
                color: ColorName.black,
              )
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
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 75: ${banquetChair[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(banquetChair[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    banquetChair[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(banquetChair![i].title,style: AppThemeData.sf400Font14black,),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                        ),

                    if(index == 1)
                      for (var i = 0 ; i<confrneceTable.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 110: ${confrneceTable[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(confrneceTable[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    confrneceTable[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(confrneceTable![i].title,style: AppThemeData.sf400Font14black,),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                        ),

                    if(index == 2)
                      for (var i = 0 ; i<banquetstable.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 144: ${banquetstable[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(banquetstable[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    banquetstable[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(banquetstable![i].title,style: AppThemeData.sf400Font14black,),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                        ),
                    if(index == 3)
                      for (var i = 0 ; i<cockTailTable.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 176: ${cockTailTable[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(cockTailTable[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    cockTailTable[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(cockTailTable![i].title,style: AppThemeData.sf400Font14black,),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                        ),
                    if(index == 4)
                      for (var i = 0 ; i<tableTrolly.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 208: ${tableTrolly[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(tableTrolly[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    tableTrolly[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(tableTrolly![i].title,style: AppThemeData.sf400Font14black,),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                        ),
                    if(index == 5)
                      for (var i = 0 ; i<stageLecterns.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 240: ${stageLecterns[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(stageLecterns[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    stageLecterns[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(stageLecterns![i].title,style: AppThemeData.sf400Font14black,),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                        ),
                    if(index == 6)
                      for (var i = 0 ; i<danceFloorSeprator.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 272: ${danceFloorSeprator[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(danceFloorSeprator[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    danceFloorSeprator[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(danceFloorSeprator![i].title,style: AppThemeData.sf400Font14black,),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
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
