import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:the_horeca_store/networking/api_client/api_client.dart';
import 'package:the_horeca_store/networking/models/category_data/category_data.dart';

class CategoryListScreenController extends GetxController {
  RxList categoryList = [].obs;
  static const _pageSize = 50;
  final PagingController<int, CategoryData> pagingController = PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _getCategoryList(pageKey);
    });
  }

  Future<void> _getCategoryList(int pageKey) async {
    try {
      final client = RestClient();
      var newItems = await client.getCategoryList(pageKey, _pageSize);
      // final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
      final isLastPage = newItems.custom_collections!.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.custom_collections!);
      } else {
        final nextPageKey = newItems.custom_collections!.last.id;
        pagingController.appendPage(newItems.custom_collections!, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
    // _getCategoryList();
  }

/*  void _getCategoryList() async {
    final client = RestClient();
    var api = await client.getCategoryList(0, 20);

    if (api.custom_collections != null && api.custom_collections!.isNotEmpty) {
      isLoading.value = false;
      categoryList.value = api.custom_collections!;
      update();
    }
  }*/
}
