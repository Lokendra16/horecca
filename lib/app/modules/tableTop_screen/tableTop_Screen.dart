import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/networking/models/tabletop_model/tabletop.dart';

import '../../../networking/models/category_data/category_model.dart';
import '../../../src/gen/assets.gen.dart';
import '../../../src/gen/colors.gen.dart';
import '../product_list/controller/product_listview_controller.dart';
import '../product_list/view/product_list_screen.dart';

class TableTopScreen extends StatelessWidget {
  TableTopScreen({Key? key, required this.homeList}) : super(key: key);
  final Rx<CategoryResponse> homeList;

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
          "Table Top",
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
        itemCount: tabletop?.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            childrenPadding: EdgeInsets.all(7),
            collapsedTextColor: Colors.black87,
              textColor:ColorName.cardinal,

              title: Text(tabletop!
            [index].title),
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              if(index == 0)
               for (var i = 0 ; i< glassware.length ; i++)
                Padding(
                  padding: const EdgeInsets.only(left: 70,right: 10),
                  child:Obx(()=>homeList.value.custom_collections !=
                      null?
                  InkWell(
                    onTap: (){
                      debugPrint("id line 37: ${glassware[i].collectionId}");
                      Get.delete<ProductListController>();
                      Get.to(() => ProductListScreen(),
                          arguments: [
                            ProductListController
                                .TYPE_CATEGORY_PRODUCTS,
                            Uri.parse(glassware[i].collectionId.toString() ?? '')
                                .pathSegments
                                .last,
                            glassware[i].title
                          ],
                          binding: BindingsBuilder.put(
                                  () => ProductListController()));
                    },
                    child: Container(
                      height: 40,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(glassware[i].title),
                          Assets.icons.icArrowForward.svgIcon(
                              color: ColorName.black,size: 14),
                        ],
                      ),
                    ),
                  ): const CircularProgressIndicator(),
                ),),

              if(index == 1)
                for (var i = 0 ; i< cutlery.length ; i++)
               Padding(
                 padding: const EdgeInsets.only(left: 70,right: 10),
                 child: InkWell(
                   onTap: (){
                     debugPrint("id line 116: ${cutlery[i].collectionId}");
                     Get.delete<ProductListController>();
                     Get.to(() => ProductListScreen(),
                         arguments: [
                           ProductListController
                               .TYPE_CATEGORY_PRODUCTS,
                           Uri.parse(cutlery[i].collectionId.toString() ?? '')
                               .pathSegments
                               .last,
                           cutlery[i].title
                         ],
                         binding: BindingsBuilder.put(
                                 () => ProductListController()));
                   },
                   child: Container(
                     height: 40,
                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(cutlery[i].title),
                       Assets.icons.icArrowForward.svgIcon(
                           color: ColorName.black,size: 14),
                     ],
                   ),
                   ),
                 ),
               ),

                  if(index == 2)
                    for (var i = 0 ; i< chinaware.length ; i++)
                     Padding(
                       padding: const EdgeInsets.only(left: 70,right: 10),
                       child: InkWell(
                         onTap: (){
                           debugPrint("id line 149: ${chinaware[i].collectionId}");
                           Get.delete<ProductListController>();
                           Get.to(() => ProductListScreen(),
                               arguments: [
                                 ProductListController
                                     .TYPE_CATEGORY_PRODUCTS,
                                 Uri.parse(chinaware[i].collectionId.toString() ?? '')
                                     .pathSegments
                                     .last,
                                 chinaware[i].title
                               ],
                               binding: BindingsBuilder.put(
                                       () => ProductListController()));
                         },
                         child: Container(
                           height: 40,
                           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(chinaware[i].title),
                               Assets.icons.icArrowForward.svgIcon(
                                   color: ColorName.black,size: 14),
                             ],
                           ),
                         ),
                       ),
                     ),
                ],
              )

            ],
          );
        },
      ),
    );
  }
}
