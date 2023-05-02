import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/networking/api_client/api_client.dart';
import 'package:the_horeca_store/networking/models/address_list/countries.dart';
import 'package:the_horeca_store/networking/models/address_list/provinces.dart';

class AddAddressController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  RxList<Countries> countriesList = <Countries>[].obs;
  RxList<Provinces> provincesList = <Provinces>[].obs;
  final Rx<Countries?> selectedCountry = Countries().obs;
  final Rx<Provinces?> selectedProvince  = Provinces().obs;

  void setCountry(Countries value) {
    selectedCountry.value = value;
  }

  void setProvinces(Provinces value) {
    selectedProvince.value = value;
  }

  @override
  void onInit() {
    getCountriesList();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getCountriesList() async {
    final client = RestClient();
    var api = await client.getCountriesList();
    if (api.countries != null && api.countries!.isNotEmpty) {
      countriesList.value = api.countries!;
    }
  }

  void addCountryAPI() async {
    if (firstNameController.text.isEmpty) {
      MySnackBar().errorSnackBar("Please enter first name");
      return;
    } else if (lastNameController.text.isEmpty) {
      MySnackBar().errorSnackBar("Please enter last name");
      return;
    } else if (addressController.text.isEmpty) {
      MySnackBar().errorSnackBar("Please enter address");
      return;
    }  else if (cityController.text.isEmpty) {
      MySnackBar().errorSnackBar("Please enter city");
      return;
    } else if (selectedCountry.value!.id ==null) {
      MySnackBar().errorSnackBar("Please select country");
      return;
    } else if (selectedProvince.value!.id ==null) {
      MySnackBar().errorSnackBar("Please select province");
      return;
    }else if (zipcodeController.text.isEmpty) {
      MySnackBar().errorSnackBar("Please enter zipcode");
      return;
    } else if (phoneNumberController.text.isEmpty) {
      MySnackBar().errorSnackBar("Please enter phone number");
      return;
    }

    var customerId = await AppPreference().get(AppPreference.KEY_CUSTOMER_ID);
    final client = RestClient();
    var api = await client.addCountryApi(customerId!, {
      "address": {
        "address1": addressController.text,
        "address2": apartmentController.text,
        "city": cityController.text,
        "company": "",
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "phone": phoneNumberController.text,
        "province": selectedCountry.value?.name,
        "country": selectedCountry.value?.name,
        "zip": zipcodeController.value,
        "name": "${firstNameController.text} ${lastNameController.text}",
        "province_code": selectedProvince.value?.code,
        "country_code": selectedCountry.value?.code,
        "country_name": selectedCountry.value?.name,
      }
    });
    if (api.countries != null && api.countries!.isNotEmpty) {
      countriesList.value = api.countries!;
    }
  }
}
