import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:the_horeca_store/app/modules/category_screen/controller/category_screen_controller.dart';
import 'package:the_horeca_store/app/modules/product_list/controller/product_listview_controller.dart';
import 'package:the_horeca_store/app/modules/product_list/view/product_list_screen.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/networking/models/category_data/category_data.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({Key? key}) : super(key: key);

  final CategoryListScreenController controller = Get.put(CategoryListScreenController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.alabaster,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarCart(
          hideBackButton: true,
          title: 'Categories',
          onBackPressed: () => Get.back(),
        ),
      ),
      body: PagedListView<int, CategoryData>(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<CategoryData>(
          firstPageProgressIndicatorBuilder: (context) => const Center(
            child: CircularProgressIndicator(color: ColorName.jewel,),
          ),
          newPageProgressIndicatorBuilder: (context) => const Center(
            child: CircularProgressIndicator(color: ColorName.jewel,),
          ),
          itemBuilder: (context, item, index) => Padding(
            padding: const EdgeInsets.only(left: 13, right: 13, bottom: 5),
            child: InkWell(
              onTap: () {
                Get.delete<ProductListController>();
                Get.to(() => ProductListScreen(),
                    arguments: [ProductListController.TYPE_CATEGORY_PRODUCTS, item.id,item.title],
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(color: ColorName.panache),
                            child: Center(
                              child: item.image != null && item.image!.src != null
                                  ? CachedNetworkImage(
                                      imageUrl: item.image!.src!,
                                      fit: BoxFit.cover,
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
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              item.title!,
                              style: AppThemeData.font16Weight400PlayfairDisplay,
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Assets.icons.plus.svgIcon(
                          color: ColorName.black,size: 18
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
