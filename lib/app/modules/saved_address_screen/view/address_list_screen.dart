import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/saved_address_screen/controller/address_list_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/app/widgets/primary_checkout_button.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class AddressListScreen extends StatelessWidget {
  AddressListScreen({Key? key}) : super(key: key);

  final controller = Get.put(AddressListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.alabaster,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarCart(
          title: AppLocalizations.of(context).savedAddress,
          onBackPressed: () => Get.back(),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(
          onPressed: () async {
            var result = await Get.toNamed(AppRoutes.addAddressScreen);
            debugPrint('result : $result');
            if (result != null) {
              controller.getAddressList();
            }
          },
          backgroundColor: ColorName.cardinal,
          child: const Icon(
            Icons.add,
            color: ColorName.white,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: ColorName.jewel,
              ))
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Obx(
                      () => controller.addressList.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: ListView.builder(
                                  itemCount: controller.addressList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var item = controller.addressList[index];
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, right: 16, top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Address ${index + 1}",
                                                style: AppThemeData
                                                    .font14Weight600Black,
                                              ),
                                              // TODO COMMENTED IT AS OF NOW ITS NOT WORKING
                                              // Text(
                                              //   'Edit',
                                              //   style: AppThemeData.font14Weight600GrayUnderline,
                                              // )
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller
                                                .changeAddressIndex(index);
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 16, right: 16, top: 8),
                                            decoration: BoxDecoration(
                                                color: ColorName.white,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                    color: ColorName.silver)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Obx(
                                                    () => Row(children: [
                                                      controller.isDefaultAddressIndex
                                                                  .value ==
                                                              index
                                                          ? const Icon(
                                                              Icons
                                                                  .radio_button_checked_outlined,
                                                              color: ColorName
                                                                  .cardinal,
                                                            )
                                                          : const Icon(
                                                              Icons
                                                                  .radio_button_off,
                                                              color: ColorName
                                                                  .cardinal,
                                                            ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        item.name.toString(),
                                                        style: AppThemeData
                                                            .font14Weight600Black,
                                                      ),
                                                      const Spacer(),
                                                      GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .deleteDialog(
                                                                    context,
                                                                    index);
                                                            //controller.deleteAddress(index);
                                                          },
                                                          child: Assets
                                                              .icons.icDelete
                                                              .svgIcon(
                                                                  size: 24)),
                                                    ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 23,
                                                            right: 23),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          child: Text(
                                                            item.address1
                                                                .toString(),
                                                            style: AppThemeData
                                                                .font14Weight400Gray,
                                                            softWrap: false,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 2.0),
                                                          child: Text(
                                                            item.address2
                                                                .toString(),
                                                            style: AppThemeData
                                                                .font14Weight400Gray,
                                                            softWrap: false,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                          "${item.city}, ${item.province}, ${item.country}",
                                                          style: AppThemeData
                                                              .font14Weight400Gray,
                                                        ),
                                                        Text(
                                                          "${item.zip}",
                                                          style: AppThemeData
                                                              .font14Weight400Gray,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10.0),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'Mobile:',
                                                                style: AppThemeData
                                                                    .font14Weight600Gray,
                                                              ),
                                                              Text(
                                                                item.phone
                                                                    .toString(),
                                                                style: AppThemeData
                                                                    .font14Weight400,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Obx(
                                                          () => Container(
                                                            height: 32,
                                                            width: 119,
                                                            decoration: BoxDecoration(
                                                                color: controller
                                                                            .isDefaultAddressIndex ==
                                                                        index
                                                                    ? ColorName
                                                                        .panache
                                                                    : ColorName
                                                                        .mercury,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6)),
                                                            child: Center(
                                                              child: Text(
                                                                "Delivering here",
                                                                style: controller
                                                                            .isDefaultAddressIndex ==
                                                                        index
                                                                    ? AppThemeData
                                                                        .font14Weight600Jewel
                                                                    : AppThemeData
                                                                        .font14Weight600Jewel
                                                                        .copyWith(
                                                                            color:
                                                                                ColorName.gray),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            )
                          : const Center(child: Text('No Address found')),
                    ),
                  ),
                  controller.addressList.isNotEmpty
                      ? InkWell(
                          onTap: () {},
                          child: PrimaryCheckOutBtn(
                            onClick: () {
                              controller.proceedToCheckout();
                            },
                            btnText: "Continue to Checkout",
                          ),
                        )
                      : SizedBox()
                ],
              ),
      ),
    );
  }
}
