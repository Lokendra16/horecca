import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';
import 'package:the_horeca_store/networking/models/home/home_collections.dart';

class HomeScreenController extends GetxController {
  RxList<HomeCollections> productsByCollectionList = <HomeCollections>[].obs;
  RxList<HomeCollections> shopByCategoryList = <HomeCollections>[].obs;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var userName = ''.obs;
  var isUserLoggedIn = true.obs;
  var isLoadingCategories = true.obs;
  var isLoadingProducts = true.obs;

  @override
  void onInit() {
    super.onInit();
    categoryListAPI();
    productListAPI();
    checkAuthState();
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
      filterCategoryData(value);
      isLoadingCategories.value = false;
    }).onError((error, stackTrace) {
      isLoadingCategories.value = false;
      MySnackBar().errorSnackBar(error.toString());
    });
  }

  void productListAPI() async {
    GraphQLRepo().productListApi().then((value) {
      filterProductData(value);
      isLoadingProducts.value = false;
    }).onError((error, stackTrace) {
      isLoadingProducts.value = false;
      MySnackBar().errorSnackBar(error.toString());
    });
  }

  void filterCategoryData(response){
    List<HomeCollections> col = [];
    response["nodes"].forEach((parent){
      var img = "";
      if (parent["image"] != null) {
        img = parent["image"]?["url"] ?? '';
      }
      var collection =
          HomeCollections(id: parent["id"], title: parent["title"], products: [], image: img);
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
}
