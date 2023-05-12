import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/category_screen/controller/category_screen_controller.dart';
import 'package:the_horeca_store/commons/utils/app_tags.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
import '../../banquetConfrence/banqut&confrence_screen.dart';
import '../../bed&bath_screen/bed&bath_screen.dart';
import '../../buffetware/buffetware.dart';
import '../../guestroom_screen/guestroom_screen.dart';
import '../../home_screen/controller/home_screen_controller.dart';
import '../../kitchenEquipments_screen/kitchenEquipments_screen.dart';
import '../../kitchenPastry_screen/kitchen_pastry_screen.dart';
import '../../liveCooking/liveCooking_screen.dart';
import '../../tableTop_screen/tableTop_Screen.dart';
import '../../table_accessories_screen/table_accessories_screen.dart';
import '../../thankyou_screen/thankyou_screen.dart';

class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({Key? key}) : super(key: key);

  final CategoryListScreenController controller = Get.put(CategoryListScreenController());
  final HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: ColorName.alabaster,
        appBar:AppBar(
          elevation: 0,
          backgroundColor: Color(0xffEFEFF0),
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Categories",
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
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
        body:ListView(
            children:[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8,right: 8),
                    child: InkWell(
                      onTap: (){
                        Get.to( TableTopScreen(homeList:homeScreenController.homeList));
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10,),
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(10),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: const BoxDecoration(color: ColorName.panache),
                                //     child: Center(
                                //       child: Image.asset(
                                //         Assets.images.icAppicon.path,
                                //         height: 30,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                const Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      AppTags.tabletop,
                                      style: AppThemeData.font20Weight500Gray,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 18
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                    child: InkWell(
                      onTap: (){
                        Get.to(TabAccessories(homeList:homeScreenController.homeList));
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10,),
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(10),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: const BoxDecoration(color: ColorName.panache),
                                //     child: Center(
                                //       child: Image.asset(
                                //         Assets.images.icAppicon.path,
                                //         height: 30,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      AppTags.tableAccessories,
                                      style: AppThemeData.font20Weight500Gray,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 18
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                    child: InkWell(
                      onTap: (){
                        Get.to(Buffet());
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(10),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: const BoxDecoration(color: ColorName.panache),
                                //     child: Center(
                                //       child: Image.asset(
                                //         Assets.images.icAppicon.path,
                                //         height: 30,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      AppTags.buffetware,
                                      style: AppThemeData.font20Weight500Gray,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 18
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                    child: InkWell(
                      onTap: (){
                        Get.to(LiveCookingModular());
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(10),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: const BoxDecoration(color: ColorName.panache),
                                //     child: Center(
                                //       child: Image.asset(
                                //         Assets.images.icAppicon.path,
                                //         height: 30,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      AppTags.liveCookingmoduler,
                                      style: AppThemeData.font20Weight500Gray,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 18
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                    child: InkWell(
                      onTap: (){
                        Get.to(KitchenPastryScreen());
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(10),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: const BoxDecoration(color: ColorName.panache),
                                //     child: Center(
                                //       child: Image.asset(
                                //         Assets.images.icAppicon.path,
                                //         height: 30,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      AppTags.kitchen,
                                      style: AppThemeData.font20Weight500Gray,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 18
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                    child: InkWell(
                      onTap: (){
                        Get.to(KitchenEquipmentsScreen());
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10,),
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(10),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: const BoxDecoration(color: ColorName.panache),
                                //     child: Center(
                                //       child: Image.asset(
                                //         Assets.images.icAppicon.path,
                                //         height: 30,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      AppTags.kitchenequipments,
                                      style: AppThemeData.font20Weight500Gray,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 18
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                    child: InkWell(
                      onTap: (){
                        Get.to(BedBathScreen());
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10,),
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(10),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: const BoxDecoration(color: ColorName.panache),
                                //     child: Center(
                                //       child: Image.asset(
                                //         Assets.images.icAppicon.path,
                                //         height: 30,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      AppTags.bedbathlinen,
                                      style: AppThemeData.font20Weight500Gray,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 18
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                    child:InkWell(
                      onTap: (){
                        Get.to(GuestroomScreen());
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10,),
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(10),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: const BoxDecoration(color: ColorName.panache),
                                //     child: Center(
                                //       child: Image.asset(
                                //         Assets.images.icAppicon.path,
                                //         height: 30,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      AppTags.guestroom,
                                      style: AppThemeData.font20Weight500Gray,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 18
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                    child: InkWell(
                      onTap: (){
                        Get.to( BanquetConfrenceScreen());
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10,),
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(10),
                                //   child: Container(
                                //     height: 50,
                                //     width: 50,
                                //     decoration: const BoxDecoration(color: ColorName.panache),
                                //     child: Center(
                                //       child: Image.asset(
                                //         Assets.images.icAppicon.path,
                                //         height: 30,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                const Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      AppTags.banquetConfrence,
                                      style: AppThemeData.font20Weight500Gray,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 18
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]
        )
      // PagedListView<int, CategoryData>(
      //   pagingController: controller.pagingController,
      //   builderDelegate: PagedChildBuilderDelegate<CategoryData>(
      //     firstPageProgressIndicatorBuilder: (context) => const Center(
      //       child: CircularProgressIndicator(color: ColorName.jewel,),
      //     ),
      //     newPageProgressIndicatorBuilder: (context) => const Center(
      //       child: CircularProgressIndicator(color: ColorName.jewel,),
      //     ),
      //     itemBuilder: (context, item, index) => Padding(
      //       padding: const EdgeInsets.only(left: 13, right: 13, bottom: 5),
      //       child: InkWell(
      //         onTap: () {
      //           Get.delete<ProductListController>();
      // Get.to(() => ProductListScreen(),
      //     arguments: [ProductListController.TYPE_CATEGORY_PRODUCTS, item.id,item.title],
      //     binding: BindingsBuilder.put(() => ProductListController()));


      /*body: GetBuilder<CategoryListScreenController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorName.jewel,
              ),
            );
          } else {
            */ /* return ListView.builder(
              itemCount: controller.categoryList.length,
              itemBuilder: (context, index) {
                var item = controller.categoryList[index] as CategoryData;
                return Padding(
                  padding: const EdgeInsets.only(left: 13, right: 13, bottom: 5),
                  child: InkWell(
                    onTap: () {
                      Get.delete<ProductListController>();
                      Get.to(() => ProductListScreen(),
                          arguments: [ProductListController.TYPE_CATEGORY_PRODUCTS, item.id],
                          binding: BindingsBuilder.put(() => ProductListController()));
                    },
                    child: SizedBox(
                      height: 70,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: ColorName.panache,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: item.image != null && item.image!.src != null
                                      ? CachedNetworkImage(
                                          imageUrl: item.image!.src!,
                                          placeholder: (context, url) {
                                            return Assets.images.icAppicon.image(height: 30);
                                          },
                                        )
                                      : Image.asset(
                                          Assets.images.icAppicon.path,
                                          height: 30,
                                        ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    controller.categoryList[index].title!,
                                    style: AppThemeData.font16Weight400PlayfairDisplay,
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.add,
                                size: 25,
                                color: ColorName.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );*/ /*

          }
        },
      ),*/
    );
  }
}

