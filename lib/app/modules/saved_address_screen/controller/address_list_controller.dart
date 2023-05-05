import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/l10n/extensions.dart';
import 'package:the_horeca_store/networking/api_client/api_client.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';
import 'package:the_horeca_store/networking/models/address_list/address_list_data.dart';

class AddressListController extends GetxController {
  RxList<AddressesData> addressList = <AddressesData>[].obs;
  var isLoading = true.obs;
  var showCheckout = false.obs;
  var isDefaultAddressIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _getAddressList();
    showCheckout.value = Get.arguments?["showCheckout"] ?? false;

  }

  void _getAddressList() async {
    isLoading.value = true;
    var customerId = await AppPreference().get(AppPreference.KEY_CUSTOMER_ID);
    if(customerId != null && customerId.isNotEmpty){
    var api = await RestClient().getAddressList(Uri.parse(customerId!).pathSegments.last);
    addressList.value = api.addresses!;
    }
    else{
      Get.toNamed(AppRoutes.loginScreen);
    }


    isLoading.value = false;
  }

  void deleteAddress(int index) async {
    var addressId = addressList.value[index].id;
    var customerId = await AppPreference().get(AppPreference.KEY_CUSTOMER_ID);
    var api = await RestClient()
        .deleteAddress(customerId.getLastSegment(), addressId.toString())
        .then((value) {
      _getAddressList();
    }).onError((error, stackTrace) {
      print("Error: $error");
      MySnackBar().errorSnackBar(error.toString());
    });
  }

  void changeAddressIndex(var index) {
    isDefaultAddressIndex.value = index;
  }

  void proceedToCheckout() async {
    var cartId = await AppPreference().get(AppPreference.KEY_CART_ID) ?? '';
    var accessToken = await AppPreference().get(AppPreference.KEY_ACCESS_TOKEN) ?? '';
    var email = await AppPreference().get(AppPreference.KEY_EMAIL) ?? '';
    var addressData = addressList.value[isDefaultAddressIndex.value];
    GraphQLRepo()
        .updateCartAddress(
            cartId,
            addressData.countryCode,
            accessToken,
            addressData.address1,
            addressData.address2,
            addressData.city,
            addressData.country,
            addressData.company,
            addressData.firstName,
            addressData.lastName,
            addressData.phone,
            addressData.province,
            addressData.zip,
            email)
        .then(
      (value) {
        Get.toNamed(AppRoutes.checkoutScreen, arguments: {
          "checkOutUrl": Get.arguments["checkOutUrl"],
        });
      },
    ).onError(
      (error, stackTrace) {
        MySnackBar().errorSnackBar(error.toString());
      },
    );
  }

  void deleteDialog(BuildContext context,int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Saved Address'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Are you sure you want to delete this saved address?'),
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
                'Delete',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                deleteDialog(context,index);
              },
            ),
          ],
        );
      },
    );
  }

}
