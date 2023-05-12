import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:the_horeca_store/app/modules/product_list/controller/product_listview_controller.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

import '../../networking/models/banqut&Confrence/banquet&Confrnece.dart';

class SortPopup extends StatelessWidget {
  SortPopup({
    Key? key,
  }) : super(key: key);
  final ProductListController controller = Get.put(ProductListController());

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sort by filter',
                              style: AppThemeData.font16Weight700),
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.close,
                                size: 24,
                              ))
                        ],
                      ),
                      const Divider(
                        color: ColorName.gray,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      for (int index = 0;
                          index < controller.filterItem.length;
                          index++)
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: InkWell(
                              onTap: () {
                                debugPrint('on tap : ${controller.filterItem[index].sortItem}');
                                controller.changeIndex(index);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                        color: ColorName.panache,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Center(
                                      child: Icon(
                                        controller
                                            .filterItem[index].leadingIcon,
                                        color: ColorName.jewel,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  Text(controller.filterItem[index].sortItem,
                                      style: AppThemeData.font14Weight600Black),
                                  const Spacer(),
                                  controller.currentIndex == index
                                      ? const Icon(
                                          Icons.check,
                                          color: ColorName.jewel,
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    ColorName.jewel,
                                  ),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  AppLocalizations.of(context).reset,
                                  style: AppThemeData.loginButton,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    ColorName.jewel,
                                  ),
                                ),

                                onPressed: () {
                                  Get.back();

                                },
                                child: Text(
                                  AppLocalizations.of(context).done,
                                  style: AppThemeData.loginButton,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
