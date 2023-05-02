import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:the_horeca_store/app/modules/product_list/controller/product_listview_controller.dart';
import 'package:the_horeca_store/app/widgets/product_item.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/app/widgets/search_bar.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class SearchProductsScreen extends StatelessWidget {
  SearchProductsScreen({Key? key}) : super(key: key);

  final ProductListController controller = Get.put(ProductListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorName.alabaster,
        title: Text(
          AppLocalizations.of(context).search,
          style: AppThemeData.appBarTextStyle,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Center(
            child: Assets.icons.icBack.svgIcon(
              size: 28,
              color: ColorName.black,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SearchBar(
            onSearchTap: (searchKey) {},
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 4.0),
            child: PagedListView<int, ProductData>(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<ProductData>(
                firstPageProgressIndicatorBuilder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorName.jewel,
                  ),
                ),
                newPageProgressIndicatorBuilder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorName.jewel,
                  ),
                ),
                itemBuilder: (context, item, index) {
                  return ProductItem(
                    item: item,
                    isFromWishList: false,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
