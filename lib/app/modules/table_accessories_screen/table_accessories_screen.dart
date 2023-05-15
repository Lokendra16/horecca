import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';

import '../../../commons/utils/app_theme_data.dart';
import '../../../networking/models/category_data/category_model.dart';
import '../../../networking/models/table_accessories/table_accesories_module.dart';
import '../../../src/gen/assets.gen.dart';
import '../../../src/gen/colors.gen.dart';
import '../product_list/controller/product_listview_controller.dart';
import '../product_list/view/product_list_screen.dart';

class TabAccessories extends StatelessWidget {
  TabAccessories({Key? key, required this.homeList}) : super(key: key);
  final Rx<CategoryResponse> homeList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEFEFF0),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
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
              fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
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
      body: Card(
        child: ListView.builder(
          itemCount: tabaccess?.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              collapsedTextColor: Colors.black87,
              textColor: ColorName.cardinal,
              childrenPadding: EdgeInsets.all(7),
              title: Text(tabaccess![index].title),
              children: <Widget>[
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  if (index == 0)
                 //   for (var value in homeList.value.custom_collections!)
                        for (var i = 0 ; i< servingsolution.length ; i++)

                      Padding(
                          padding: const EdgeInsets.only(left: 70, right: 10),
                          child: Obx(() => homeList.value.custom_collections !=
                                  null
                              ? InkWell(
                                  onTap: () {

                                      debugPrint("id line 82: ${tableTopSolution[i].collectionId}");
                                      Get.delete<ProductListController>();
                                      Get.to(() => ProductListScreen(),
                                          arguments: [
                                            ProductListController
                                                .TYPE_CATEGORY_PRODUCTS,
                                            Uri.parse(servingsolution[i].collectionId.toString() ?? '')
                                                .pathSegments
                                                .last,
                                            servingsolution[i].title
                                          ],
                                          binding: BindingsBuilder.put(
                                              () => ProductListController()));

                                  },
                                  child: Container(
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(servingsolution[i].title,style: AppThemeData.sf400Font14black,),
                                       // Text(value.title.toString()),
                                        Assets.icons.icArrowForward.svgIcon(
                                            color: ColorName.black, size: 14),
                                      ],
                                    ),
                                  ))
                              : const CircularProgressIndicator())),
                  if (index == 1)
                    for (var i = 0; i < tableTopSolution.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 10),
                        child: InkWell(
                          onTap: (){
                            debugPrint("id line 115: ${tableTopSolution[i].collectionId}");
                            Get.delete<ProductListController>();
                            //tableTopSolution[i].collectionId.toString()
                            Get.to(() => ProductListScreen(),
                                arguments: [
                                  ProductListController
                                      .TYPE_CATEGORY_PRODUCTS,
                                  Uri.parse(tableTopSolution[i].collectionId.toString() ?? '')
                                      .pathSegments
                                      .last,
                                  tableTopSolution[i].title
                                ],
                                binding: BindingsBuilder.put(
                                        () => ProductListController()));
                          },
                          child: Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(tableTopSolution[i].title,style: AppThemeData.sf400Font14black,),
                                Assets.icons.icArrowForward
                                    .svgIcon(color: ColorName.black, size: 14),
                              ],
                            ),
                          ),
                        ),
                      ),
                  if (index == 2)
                    for (var i = 0; i < tablePresntation.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 10),
                        child: InkWell(
                          onTap: (){
                            debugPrint("id line 149: ${tablePresntation[i].collectionId}");
                            Get.delete<ProductListController>();
                            //tableTopSolution[i].collectionId.toString()
                            Get.to(() => ProductListScreen(),
                                arguments: [
                                  ProductListController
                                      .TYPE_CATEGORY_PRODUCTS,
                                  Uri.parse(tablePresntation[i].collectionId.toString() ?? '')
                                      .pathSegments
                                      .last,
                                  tablePresntation[i].title
                                ],
                                binding: BindingsBuilder.put(
                                        () => ProductListController()));
                          },
                          child: Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(tablePresntation[i].title,style: AppThemeData.sf400Font14black,),
                                Assets.icons.icArrowForward
                                    .svgIcon(color: ColorName.black, size: 14),
                              ],
                            ),
                          ),
                        ),
                      ),
                  if (index == 3)
                    for (var i = 0; i < counterSolution.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 10),
                        child: InkWell(
                          onTap: (){
                            print('3');
                            debugPrint(counterSolution[i].collectionId.toString());
                            Get.delete<ProductListController>();

                            Get.to(() => ProductListScreen(),
                                arguments: [
                                  ProductListController
                                      .TYPE_CATEGORY_PRODUCTS,
                                  Uri.parse(counterSolution[i].collectionId.toString() ?? '')
                                      .pathSegments
                                      .last,
                                  counterSolution[i].title
                                ],
                                binding: BindingsBuilder.put(
                                        () => ProductListController()));
                          },
                          child: Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(counterSolution[i].title,style: AppThemeData.sf400Font14black,),
                                Assets.icons.icArrowForward
                                    .svgIcon(color: ColorName.black, size: 14),
                              ],
                            ),
                          ),
                        ),
                      ),
                  if (index == 4)
                    for (var i = 0; i < barSolution.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 10),
                        child: InkWell(
                          onTap: (){
                            debugPrint(barSolution[i].collectionId.toString());
                            Get.delete<ProductListController>();

                            Get.to(() => ProductListScreen(),
                                arguments: [
                                  ProductListController
                                      .TYPE_CATEGORY_PRODUCTS,
                                  Uri.parse(barSolution[i].collectionId.toString() ?? '')
                                      .pathSegments
                                      .last,
                                  barSolution[i].title
                                ],
                                binding: BindingsBuilder.put(
                                        () => ProductListController()));
                          },
                          child: Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(barSolution[i].title,style: AppThemeData.sf400Font14black,),
                                Assets.icons.icArrowForward
                                    .svgIcon(color: ColorName.black, size: 14),
                              ],
                            ),
                          ),
                        ),
                      ),
                  if (index == 5)
                    for (var i = 0; i < menuSignage.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: (){
                            debugPrint(menuSignage[i].collectionId.toString());
                            Get.delete<ProductListController>();

                            Get.to(() => ProductListScreen(),
                                arguments: [
                                  ProductListController
                                      .TYPE_CATEGORY_PRODUCTS,
                                  Uri.parse(menuSignage[i].collectionId.toString() ?? '')
                                      .pathSegments
                                      .last,
                                  menuSignage[i].title
                                ],
                                binding: BindingsBuilder.put(
                                        () => ProductListController()));
                          },
                          child: Container(
                            height: 30,
                            width: size.width * 0.99,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 70, right: 10),
                              child: Container(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(menuSignage[i].title,style: AppThemeData.sf400Font14black,),
                                    Assets.icons.icArrowForward.svgIcon(
                                        color: ColorName.black, size: 14),
                                  ],
                                ),
                              ),
                            ),
                            // ListTile(
                            //   tileColor: Colors.grey.shade200,
                            //   leading: Text(menuSignage[i].title),),
                          ),
                        ),
                      ),
                ]),
              ],
            );
          },
        ),
      ),
    );
  }
}
