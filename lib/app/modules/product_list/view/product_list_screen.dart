import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:the_horeca_store/app/modules/product_list/view/product_list_view.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/app/widgets/product_item.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

import '../controller/product_listview_controller.dart';

class ProductListScreen extends StatelessWidget {
  bool showSorting = true;
  ProductListScreen({Key? key, this.showSorting = true}) : super(key: key);

  final ProductListController controller = Get.put(ProductListController());
  @override
  Widget build(BuildContext context) {
    debugPrint("show sorting : $showSorting");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Obx(
          () => AppBarCart(
            hideBackButton: controller.screenType.value == 0 ? true : false,
            title: controller.title.value,
            onBackPressed: () => Get.back(),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              if (showSorting == true) ...[
                // SORTING AND VIEW WIDGET
                Container(
                  height: 1,
                  width: size.width,
                  color: ColorName.silver,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              controller.showSortPopUp(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.swap_vert_rounded,
                                    color: ColorName.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    AppLocalizations.of(context).sort,
                                    style: GoogleFonts.roboto(
                                        color: ColorName.black, fontSize: 18.0),
                                  ),
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              controller.onClickView();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.grid_view,
                                    color: ColorName.black,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    AppLocalizations.of(context).view,
                                    style: GoogleFonts.roboto(
                                        color: ColorName.black, fontSize: 18.0),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: size.width,
                  color: ColorName.silver,
                ),
              ]
            ],
          ),
          Obx(
            () => Padding(
                padding: EdgeInsets.only(
                    top: showSorting == true ? 60.0 : 20, bottom: 4.0),
                child: controller.isGridView.value == false
                    ? PagedGridView<int, ProductData>(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: size.width / size.height * 1.35,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        pagingController: controller.pagingController,
                        builderDelegate: PagedChildBuilderDelegate<ProductData>(
                          firstPageProgressIndicatorBuilder: (context) =>
                              const Center(
                            child: CircularProgressIndicator(
                              color: ColorName.jewel,
                            ),
                          ),
                          newPageProgressIndicatorBuilder: (context) =>
                              const Center(
                            child: CircularProgressIndicator(
                              color: ColorName.jewel,
                            ),
                          ),
                          itemBuilder: (context, item, index) {
                            return ProductItem(
                              item: item,
                              productListController: controller,
                              isFromWishList: false,
                            );
                          },
                        ),
                      )
                    : PagedListView(
                        pagingController: controller.pagingController,
                        builderDelegate: PagedChildBuilderDelegate<ProductData>(
                          firstPageProgressIndicatorBuilder: (context) =>
                              const Center(
                            child: CircularProgressIndicator(
                              color: ColorName.jewel,
                            ),
                          ),
                          newPageProgressIndicatorBuilder: (context) =>
                              const Center(
                            child: CircularProgressIndicator(
                              color: ColorName.jewel,
                            ),
                          ),
                          itemBuilder: (context, item, index) {
                            return ProductListView(
                              item: item,
                              productListController: controller,
                              isFromWishList: false,
                            );
                          },
                        ))),
          ),
        ],
      ),
    );
  }
}
