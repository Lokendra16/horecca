import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/my_account/controller/my_account_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/commons/utils/utility.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({Key? key}) : super(key: key);

  final MyAccountController controller = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.alabaster,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarCart(

          hideBackButton: true,
          title: AppLocalizations.of(context).myAccount,
          onBackPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Obx(
              () => !controller.isUserLoggedIn.value
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Container(
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                            color: ColorName.panache, borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                          child: Column(
                            children: [
                              Text(
                                AppLocalizations.of(context).welcome,
                                style: AppThemeData.font16Weight600Playfair,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: TextButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                            ColorName.jewel,
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.toNamed(AppRoutes.loginScreen);
                                        },
                                        child: Text(
                                          AppLocalizations.of(context).login,
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
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                            ColorName.jewel,
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.toNamed(AppRoutes.signupScreen);
                                        },
                                        child: Text(
                                          AppLocalizations.of(context).signup,
                                          style: AppThemeData.loginButton,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ColorName.alabaster, borderRadius: BorderRadius.circular(6)),
                        child: Stack(clipBehavior: Clip.none, children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorName.panache,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: ColorName.white,
                                borderRadius: BorderRadius.circular(80),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Image.asset(
                                  Assets.images.icAppicon.path,
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:27),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Obx(() => Text(
                                      controller.customerName.value,
                                      style: AppThemeData.font16Weight600,
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                                child: Obx(() => Text(controller.customerEmail.value ?? '', style: AppThemeData.font16Weight600,),)),
                          )
                        ]),
                      ),
                    ),
            ),
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Container(
                    color: ColorName.silver,
                    height: 1,
                    width: size.width,
                  );
                },
                itemCount: controller.listItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                     if(index ==3){
                       if(Platform.isIOS){
                         Utility.launchURL(Utility.rateUsURLIOS);
                       }else{
                         Utility.launchURL(Utility.rateUsURLAndroid);
                       }
                     }else if(index ==5){
                       Get.toNamed(AppRoutes.webview,arguments: Utility.privacyPolicyURL);
                     }else if(index == 1){
                       Get.toNamed(AppRoutes.savedAddressScreen);
                     }else if(index == 0){
                       Get.toNamed(AppRoutes.myOrderScreen);
                     }else if(index == 2){
                       Get.toNamed(AppRoutes.wishListScreen);
                     }else if(index == 4){
                       Utility.launchMail('mailto:example@gmail.com');
                     }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorName.white,
                        borderRadius: index == 0
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              )
                            : index == controller.listItems.length - 1
                                ? const BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                  )
                                : BorderRadius.zero,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: ColorName.panache, borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                child: Icon(
                                  controller.listItems[index].leadingImage,
                                  color: ColorName.jewel,
                                  size: 27,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              controller.listItems[index].profileItemTxt,
                              style: AppThemeData.font14Weight400,
                            ),
                            const Spacer(),
                            Assets.icons.icArrowForward.svgIcon(size: 15,
                              color: ColorName.black
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.isUserLoggedIn.value,
                child: GestureDetector(
                  onTap: () {
                    controller.logOut(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: 40,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: ColorName.cardinal),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.logout,
                            size: 20,
                            color: ColorName.cardinal,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppLocalizations.of(context).logOut,
                            style: AppThemeData.font14Weight700.copyWith(color: ColorName.cardinal),
                          ),
                        ],
                      ),
                    ),
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
