import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:the_horeca_store/app/modules/product_list/model/sort_product_model.dart';
import 'package:the_horeca_store/app/widgets/product_gridview/product_gridview_model.dart';
import 'package:the_horeca_store/commons/dialogs/filter_pop_up.dart';
import 'package:the_horeca_store/networking/api_client/api_client.dart';
import 'package:the_horeca_store/networking/do_finder/do_finder_client.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/networking/models/search/results.dart';
import 'package:the_horeca_store/networking/models/search/search_response.dart';

class ProductListController extends GetxController {
  RxList productList = [].obs;
  var title = "Sale".obs;
  static const _pageSize = 50;
  final PagingController<int, ProductData> pagingController = PagingController(firstPageKey: 0);
  final PagingController<int, Results> searchPagingController = PagingController(firstPageKey: 0);

  static int TYPE_CATEGORY_PRODUCTS = 1;
  static int TYPE_SEARCH = 2;
  static int TYPE_WISHLIST = 3;
  var screenType = 0.obs;

  List<SortProductModel> filterItem = [
    SortProductModel(
      leadingIcon: Icons.new_releases_outlined,
      sortItem: 'Best Selling',
    ),
    SortProductModel(
      leadingIcon: Icons.monetization_on_outlined,
      sortItem: 'Price: Low to High',
    ),
    SortProductModel(
      leadingIcon: Icons.attach_money_outlined,
      sortItem: 'Price: High to Low',
    ),
    SortProductModel(
      leadingIcon: Icons.star_border_outlined,
      sortItem: 'Title: Ascending',
    ),
    SortProductModel(
      leadingIcon: Icons.star_border_outlined,
      sortItem: 'Title: Descending',
    ),
  ].obs;
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void onClick(index) {
    myGridList[index].isActive = !myGridList[index].isActive;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    searchProductApi();

    if (Get.arguments == null) {
      pagingController.addPageRequestListener((pageKey) {
        // TODO SENDING THE COLLECTION ID HARD CODED '445427745079' FOR PRODUCT LIST SCREEN
        _getProductList(pageKey, "445427745079");
      });
    } else if (Get.arguments[0] == TYPE_CATEGORY_PRODUCTS) {
      screenType.value = 1;
      pagingController.addPageRequestListener((pageKey) {
        debugPrint("get args category product : ${Get.arguments[1]}");
        _getProductList(pageKey,  Get.arguments[1].toString()
        );
      });
      title.value = Get.arguments[2].toString();
    } else if (Get.arguments[0] == TYPE_SEARCH) {
      screenType.value = 1;
      pagingController.addPageRequestListener((pageKey) {
        _getProductList(pageKey, Get.arguments[1].toString()
        );
      });
      title.value = Get.arguments[2].toString();
    } else {}
  }

  Future<void> _getProductList(int pageKey, String collectionId) async {
    try {
      final client = RestClient();
      // TODO SENDING THE COLLECTION ID HARD CODED '445427745079'

      var newItems =
          await client.getProductList('published',pageKey, _pageSize, collectionId, "");
      final isLastPage = newItems.products!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.products!);
      } else {
        final nextPageKey = newItems.products!.last.id;
        pagingController.appendPage(newItems.products!, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void showSortPopUp(context) {
    showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: 'ShowGeneralDialog',
        transitionDuration: const Duration(milliseconds: 400),
        context: context,
        pageBuilder: (context, _, __) {
          return SortPopup();
        },
        transitionBuilder: (_, animation1, __, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(animation1),
            child: child,
          );
        });
  }

  Future<void> searchProductApi() async {

      final client = DoFinderClient();
      // TODO SEND TEXT EDIT CONTROLLER IN PLACE OF LEONARDO

      var searchItems = await client.searchProductApi('2057fd5d4e22e21386b3c2944f156472','leonardo','20','1');

      final isLastPage = searchItems.results!.length < _pageSize;

      try{
        if (isLastPage) {
          debugPrint('in if');
          debugPrint('is last page search Product api : ${searchItems}');

          searchPagingController.appendLastPage(searchItems.results!);
        } else {
          debugPrint('else');
          debugPrint('in else search Product api : ${searchItems}');

          final nextPageKey = searchItems.results!.last.id;
          searchPagingController.appendPage(searchItems.results!, int.parse(nextPageKey!));
        }
      }


     catch (error) {
        debugPrint('on error : $error');
      pagingController.error = error;

  }
}}
