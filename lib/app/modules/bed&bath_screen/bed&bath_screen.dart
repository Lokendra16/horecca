import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';

import '../../../commons/utils/app_theme_data.dart';
import '../../../networking/models/bed&bathLinen_model/bedBath.dart';
import '../../../src/gen/assets.gen.dart';
import '../../../src/gen/colors.gen.dart';
import '../product_list/controller/product_listview_controller.dart';
import '../product_list/view/product_list_screen.dart';

class BedBathScreen extends StatelessWidget {
  const BedBathScreen({Key? key}) : super(key: key);

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
          "Bed & Bath Linen",
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
        itemCount: bedbath?.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            childrenPadding: EdgeInsets.all(7),
            collapsedTextColor: Colors.black87,
            textColor: ColorName.cardinal,
            title: Text(bedbath!
            [index].title),
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(index == 0)
                      for (var i = 0 ; i< bed.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 204: ${bed[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(bed[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    bed[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(bed![i].title,style: AppThemeData.sf400Font14black,),
                                  Assets.icons.icArrowForward.svgIcon(
                                      color: ColorName.black,size: 14),
                                ],
                              ),
                            ),
                          ),
                        ),

                    if(index == 1)
                      for (var i = 0 ; i<bath.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: InkWell(
                            onTap: (){
                              debugPrint("id line 204: ${bath[i].collectionId}");
                              Get.delete<ProductListController>();
                              Get.to(() => ProductListScreen(),
                                  arguments: [
                                    ProductListController
                                        .TYPE_CATEGORY_PRODUCTS,
                                    Uri.parse(bath[i].collectionId.toString() ?? '')
                                        .pathSegments
                                        .last,
                                    bath[i].title
                                  ],
                                  binding: BindingsBuilder.put(
                                          () => ProductListController()));
                            },
                            child: Container(
                              height: 40,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(bath![i].title,style: AppThemeData.sf400Font14black,),
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
