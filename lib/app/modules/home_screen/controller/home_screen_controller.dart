import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/networking/api_client/api_client.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';
import 'package:the_horeca_store/networking/models/category_data/category_data.dart';
import 'package:the_horeca_store/networking/models/category_data/category_model.dart';
import 'package:the_horeca_store/networking/models/home/home_collections.dart';
import 'package:the_horeca_store/networking/models/table_accessories/table_accesories_module.dart';

class HomeScreenController extends GetxController {
  RxList<HomeCollections> productsByCollectionList = <HomeCollections>[].obs;
  RxList<HomeCollections> shopByCategoryList = <HomeCollections>[].obs;
  // FOR SHOWING HOME CATEGORY
  //RxList<CategoryData> homeList = <CategoryData>[].obs;
  Rx<CategoryResponse> homeList = CategoryResponse().obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var userName = ''.obs;
  var isUserLoggedIn = true.obs;
  var isLoadingCategories = true.obs;
  var isLoadingProducts = true.obs;

  List<String> homeCategoryList = [
    'https://thehorecastore.myshopify.com/cdn/shop/collections/dinnerware-header-813543.webp?v=1681553175',
    'https://thehorecastore.myshopify.com/cdn/shop/collections/3-877359.jpg?v=1681553178',
    'https://thehorecastore.myshopify.com/cdn/shop/collections/cutlery-thehorecastore-270504.jpg?v=1681557329',
    'https://thehorecastore.myshopify.com/cdn/shop/collections/table-accessories-thehorecastore-579008.jpg?v=1681557352',
    'https://thehorecastore.myshopify.com/cdn/shop/collections/kitchen-equipment-thehorecastore-653876.jpg?v=1681557376',
    'https://thehorecastore.myshopify.com/cdn/shop/collections/menu-and-signage-thehorecastore-699865.jpg?v=1681553185',
    'https://thehorecastore.myshopify.com/cdn/shop/collections/Chafing_Dishes-499241.jpg?v=1681553593',
    'https://thehorecastore.myshopify.com/cdn/shop/collections/banquet-and-conference-thehorecastore.jpg?v=1681553532',
    'https://thehorecastore.myshopify.com/cdn/shop/collections/guestroom-thehorecastore-731248.jpg?v=1681553179',
    'https://thehorecastore.myshopify.com/cdn/shop/collections/round-640740.jpg?v=1681553173',
    'https://thehorecastore.myshopify.com/cdn/shop/collections/housekeeping-and-front-office-thehorecastore-599296.jpg?v=1681553180',
  ];

  @override
  void onInit() {
    super.onInit();
    categoryListAPI();
    productListAPI();
    checkAuthState();
    getHomeCategoryList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
    update();
  }

  void categoryListAPI() async {
    GraphQLRepo().categoryListAPI().then((value) {
      debugPrint('value : $value');
      filterCategoryData(value);
      isLoadingCategories.value = false;
    }).onError((error, stackTrace) {
      isLoadingCategories.value = false;
      MySnackBar().errorSnackBar(error.toString());
    });
  }

  void productListAPI() async {
    GraphQLRepo().productListApi().then((value) {
      debugPrint('product list : $value');
      filterProductData(value);
      isLoadingProducts.value = false;
    }).onError((error, stackTrace) {
      isLoadingProducts.value = false;
      MySnackBar().errorSnackBar(error.toString());
    });
  }

  void filterCategoryData(response){
    debugPrint('response : $response');
    List<HomeCollections> col = [];
    response["nodes"].forEach((parent){
      var img = "";
      if (parent["image"] != null) {
        img = parent["image"]?["url"] ?? '';
      }
      var collection =
          HomeCollections(id: parent["id"],
              title: parent["title"], products: [], image: img);
      debugPrint('collection : ${collection.id}');
      col.add(collection);
    });

    shopByCategoryList.value = col;
    update();
  }

  void filterProductData(response) {
    List<HomeCollections> col = [];
    response["nodes"].forEach((parent){
      List<HomeProducts> product = [];
      parent["products"]["nodes"].forEach((child1) {
        var p = HomeProducts(id: child1["id"], title: child1["title"]);
        child1["images"]["nodes"].forEach((child2) {
          p.image = child2["url"];
        });
        product.add(p);
      });
      var collection = HomeCollections(id: parent["id"], title: parent["title"], products: product);
      col.add(collection);

    });

    productsByCollectionList.value = col;
    update();
  }

  void checkAuthState() async {
    var accessToken = await AppPreference().get(AppPreference.KEY_ACCESS_TOKEN);
    if (accessToken != null && accessToken.isNotEmpty && accessToken != "0") {
      isUserLoggedIn.value = true;
    } else {
      isUserLoggedIn.value = false;
    }
    var firstName = await AppPreference().get(AppPreference.KEY_FIRST_NAME);
    var lastName = await AppPreference().get(AppPreference.KEY_LAST_NAME);
    if(firstName != null && lastName != null && firstName.isNotEmpty && lastName.isNotEmpty){
      userName.value = "$firstName $lastName";
    }else{
      userName.value = "Guest";
    }
  }

  void logOut(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Are you sure you want to log out of the app? Logging out will clear all your session data and return you to the login screen.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                AppPreference().clear();
                Get.offAllNamed(AppRoutes.loginScreen);
              },
            ),
          ],
        );
      },
    );
  }


  // API FOR HOME CATEGORY LIST
  Future<void> getHomeCategoryList() async {
    List collectionIds = ['435395363127', '435395395895','435395494199','433094590775','433094787383','440481677623','442082001207','433094918455','435397919031','435398508855','433095180599,'
    ];
    String id = collectionIds.join(',');
    try {
      final client = RestClient();
      var newItems = await client.getHomeCategoryList(id);
      homeList.value = newItems;
      debugPrint('Home category list : ${newItems}');
      // final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
        final nextPageKey = newItems.custom_collections!.last.id;
    } catch (error) {
      debugPrint('Error : $error');
    }
update();

  }



}
