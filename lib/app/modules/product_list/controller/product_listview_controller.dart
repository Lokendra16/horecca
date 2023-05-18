import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:the_horeca_store/app/modules/product_list/model/sort_product_model.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/product_gridview/product_gridview_model.dart';
import 'package:the_horeca_store/commons/dialogs/filter_pop_up.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/networking/api_client/api_client.dart';
import 'package:the_horeca_store/networking/do_finder/do_finder_client.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/networking/models/search/results.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class ProductListController extends GetxController {
  RxList productList = [].obs;
  var title = "Sale".obs;
  static const _pageSize = 50;
  final PagingController<int, ProductData> pagingController =
      PagingController(firstPageKey: 0);
  final PagingController<int, Results> searchPagingController =
      PagingController(firstPageKey: 0);
  TextEditingController searchController = TextEditingController();
  var isLoading = false.obs;
  var showSearchIcon = false.obs;

  static int TYPE_CATEGORY_PRODUCTS = 1;
  static int TYPE_SEARCH = 2;
  static int TYPE_WISHLIST = 3;
  var screenType = 0.obs;
  var isGridView = false.obs;

  List<SortProductModel> filterItem = [
    SortProductModel(
      leadingIcon: Icons.new_releases_outlined,
      sortItem: 'Best Selling',
    ),
    SortProductModel(
      leadingIcon: Icons.monetization_on_outlined,
      sortItem: 'Date: Old to New', //'Price: Low to High',
    ),
    SortProductModel(
      leadingIcon: Icons.attach_money_outlined,
      sortItem: 'Date: New to Old', //'Price: High to Low',
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
  var newArg = Get.arguments;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void onClick(index) {
    myGridList[index].isActive = !myGridList[index].isActive;
    update();
  }

  void showSearch() {
    showSearchIcon.value = !showSearchIcon.value;
  }

  @override
  void onInit() {
    super.onInit();
    //searchProductApi();
    debugPrint("argument : ${Get.arguments}");

    if (Get.arguments == null) {
      pagingController.addPageRequestListener((pageKey) {
        // TODO SENDING THE COLLECTION ID HARD CODED '445427745079' FOR PRODUCT LIST SCREEN
        _getProductList("445427745079", '');
      });
    } else if (Get.arguments[0] == TYPE_CATEGORY_PRODUCTS) {
      screenType.value = 1;
      pagingController.addPageRequestListener((pageKey) {
        debugPrint("get args category product : ${Get.arguments[1]}");
        _getProductList(Get.arguments[1].toString(), '');
      });
      title.value = Get.arguments[2].toString();
    } else if (Get.arguments[0] == TYPE_SEARCH) {
      screenType.value = 1;
      pagingController.addPageRequestListener((pageKey) {
        _getProductList(Get.arguments[1].toString(), '');
      });
      if (Get.arguments != null) {
        title.value = Get.arguments[2].toString();
      }
    } else {}
  }

  Future<void> _getProductList(String collectionId, String? sortOrder) async {
    try {
      pagingController.itemList?.clear();
      final client = RestClient();
      // TODO SENDING THE COLLECTION ID HARD CODED '445427745079'

      var newItems = await client.getProductList(
          'published', _pageSize, collectionId, "", "$sortOrder");
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
        transitionDuration: const Duration(milliseconds: 200),
        context: context,
        pageBuilder: (context, _, __) {
          return SortPopup(
            onDone: (value) {
              debugPrint("value sort : $value");
              callingSortApi(value);

              Get.back();
            },
            onReset: () {
              Get.back();
            },
          );
        },
        transitionBuilder: (_, animation1, __, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(animation1),
            child: child,
          );
        });
  }

  callingSortApi(value) {
    if (value == 0) {
      _getProductList("${newArg[1]}", 'title desc');
    }
    if (value == 1) {
      _getProductList("${newArg[1]}", 'created_at desc');
    }
    if (value == 2) {
      _getProductList("${newArg[1]}", 'created_at asc');
    }
    if (value == 3) {
      _getProductList("${newArg[1]}", 'title asc');
    }
    if (value == 4) {
      _getProductList("${newArg[1]}", 'title desc');
    }
  }

  void onClickView() {
    isGridView.value = !isGridView.value;
  }

  Future<void> searchProductApi(String searchText) async {
    searchPagingController.itemList?.clear();
    isLoading.value = true;
    final client = DoFinderClient();
    var searchItems = await client.searchProductApi(
        '2057fd5d4e22e21386b3c2944f156472', searchText, '50', '1');
    final isLastPage = searchItems.results!.length < _pageSize;
    try {
      if (isLastPage) {
        isLoading.value = false;
        searchPagingController.appendLastPage(searchItems.results!);
      } else {
        isLoading.value = false;
        final nextPageKey = searchItems.results!.last.id;
        searchPagingController.appendPage(
            searchItems.results!, int.parse(nextPageKey!));
      }
    } catch (error) {
      isLoading.value = false;
      debugPrint('on error : $error');
      pagingController.error = error;
      Get.snackbar('Error', error.toString(),
          backgroundColor: ColorName.cardinal,
          snackPosition: SnackPosition.TOP);
    }
    isLoading.value = false;
  }

  Future<void> addToCart(int quantity, String variantId) async {
    isLoading.value = true;
    var checkCartId =
        await AppPreference().get(AppPreference.KEY_CART_ID) ?? '';
    if (checkCartId != null && checkCartId.isNotEmpty) {
      isLoading.value = false;
      GraphQLRepo()
          .addToCartLine(quantity, variantId, checkCartId)
          .then((value) {
        Get.toNamed(AppRoutes.cartScreen);
      }).onError((error, stackTrace) {
        MySnackBar().errorSnackBar(error.toString());
      });
    } else {
      isLoading.value = false;
      GraphQLRepo().addToCart(quantity, variantId).then((value) {
        /*
      AppPreference().get(AppPreference.KEY_CART_ID).then((cartId) {
        if(cartId == null || cartId.isEmpty || cartId == "0"){
          AppPreference().setString(AppPreference.KEY_CART_ID, value);
          Get.toNamed(AppRoutes.cartScreen);
        }
      });*/

        print("shubham--" + value);

        AppPreference().setString(AppPreference.KEY_CART_ID, value);
        Get.toNamed(AppRoutes.cartScreen);
      }).onError((error, stackTrace) {
        MySnackBar().errorSnackBar(error.toString());
      });
    }
  }
}
