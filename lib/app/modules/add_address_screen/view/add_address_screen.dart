import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/add_address_screen/controller/add_address_controller.dart';
import 'package:the_horeca_store/app/widgets/custom_textfield.dart';
import 'package:the_horeca_store/app/widgets/primary_checkout_button.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key}) : super(key: key);

  final AddAddressController controller = Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorName.alabaster,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).addAddress,
          style: AppThemeData.appBarTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorName.alabaster,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    padding: const EdgeInsets.all(15),
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    hintText: AppLocalizations.of(context).firstName,
                    controller: controller.firstNameController,
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: CustomTextField(
                    padding: const EdgeInsets.all(15),
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    hintText: AppLocalizations.of(context).lastName,
                    controller: controller.lastNameController,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                padding: const EdgeInsets.all(15),
                controller: controller.addressController,
                obscureText: false,
                hintText: AppLocalizations.of(context).address,
                keyboardType: TextInputType.streetAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                padding: const EdgeInsets.all(15),
                controller: controller.apartmentController,
                obscureText: false,
                hintText: AppLocalizations.of(context).apartment,
                keyboardType: TextInputType.streetAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                padding: const EdgeInsets.all(15),
                controller: controller.cityController,
                obscureText: false,
                hintText: "City",
                keyboardType: TextInputType.streetAddress,
              ),
            ),
            InkWell(
              onTap: () {
                countryPop();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: ColorName.silver, //New
                          blurRadius: 1.0,
                          offset: Offset(-1, 1))
                    ],
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Obx(
                          () => Text(
                            controller.selectedCountry.value?.name ??
                                'Select Country',
                            style: AppThemeData.font14Weight400Gray,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: ColorName.gray410,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                provincesPop();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: ColorName.silver, //New
                          blurRadius: 1.0,
                          offset: Offset(-1, 1))
                    ],
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Obx(() => Text(
                                controller.selectedProvince.value?.name ??
                                    'Select Province',
                                style: AppThemeData.font14Weight400Gray,
                              ))),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: ColorName.gray410,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                textFieldLength: 8,
                padding: const EdgeInsets.only(left: 10, bottom: 6),
                controller: controller.zipcodeController,
                obscureText: false,
                hintText: AppLocalizations.of(context).zipcode,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                textFieldLength: 10,
                padding: const EdgeInsets.only(left: 10, bottom: 6),
                controller: controller.phoneNumberController,
                obscureText: false,
                hintText: AppLocalizations.of(context).phone,
                keyboardType: TextInputType.number,
              ),
            ),
            const Spacer(),
            PrimaryCheckOutBtn(
              btnText: AppLocalizations.of(context).submit,
              onClick: () {
                controller.addCountryAPI();
              },
            )
          ],
        ),
      ),
    );
  }

  void countryPop() {
    Get.defaultDialog(
      title: 'Select Country',
      content: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.countriesList.length,
                itemBuilder: (context, index) {
                  return Obx(() => InkWell(
                        onTap: () {
                          controller.provincesList.value =
                              controller.countriesList[index].provinces!;
                          controller
                              .setCountry(controller.countriesList[index]);
                          Get.back();
                        },
                        child: ListTile(
                          title: Text(
                              controller.countriesList[index].name.toString()),
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void provincesPop() {
    Get.defaultDialog(
      title: 'Provinces',
      content: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.provincesList.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => InkWell(
                      onTap: () {
                        controller
                            .setProvinces(controller.provincesList[index]);
                        Get.back();
                      },
                      child: ListTile(
                        title: Text(
                            controller.provincesList[index].name.toString()),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
