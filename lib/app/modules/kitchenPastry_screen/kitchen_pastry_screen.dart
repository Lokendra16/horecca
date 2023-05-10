import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';

import '../../../networking/models/kitchen&pastry/Kitchen&Pastry_model.dart';
import '../../../src/gen/assets.gen.dart';
import '../../../src/gen/colors.gen.dart';
import '../product_list/controller/product_listview_controller.dart';
import '../product_list/view/product_list_screen.dart';
class KitchenPastryScreen extends StatelessWidget {
  const KitchenPastryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          "Kitchen & Pastry",
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
        itemCount: kitchendata?.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            childrenPadding: EdgeInsets.all(7),
            collapsedTextColor: Colors.black87,
            textColor: ColorName.cardinal,
            title: Text(kitchendata!
            [index].title),
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(index == 0)
                      for (var i = 0 ; i< gastronorm.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 76: ${gastronorm[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(gastronorm[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    gastronorm[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(gastronorm![i].title),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                        ),

                    if(index == 1)
                      for (var i = 0 ; i<knives.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 108: ${knives[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(knives[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    knives[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(knives![i].title),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                        ),
                    if(index == 2)
                      for (var i = 0 ; i<breadpizza.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 141: ${breadpizza[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(breadpizza[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    breadpizza[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(breadpizza![i].title),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                        ),
                    if(index == 3)
                      for (var i = 0 ; i<strorageTranspor.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 172: ${strorageTranspor[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(strorageTranspor[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    strorageTranspor[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(strorageTranspor![i].title),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                        ),
                    if(index == 4)
                      for (var i = 0 ; i<hygien.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 204: ${hygien[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(hygien[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    hygien[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(hygien![i].title),
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
