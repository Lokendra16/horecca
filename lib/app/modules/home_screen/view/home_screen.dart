import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:the_horeca_store/app/modules/home_screen/view/home_category_widget.dart';
import 'package:the_horeca_store/app/modules/home_screen/view/home_products_widget.dart';
import 'package:the_horeca_store/app/modules/product_list/controller/product_listview_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/common_pageview/common_pageview.dart';
import 'package:the_horeca_store/app/widgets/common_pageview/common_pageview_controller.dart';
import 'package:the_horeca_store/app/widgets/home_appbar.dart';
import 'package:the_horeca_store/app/widgets/search_bar.dart';
import 'package:the_horeca_store/app/widgets/side_menu.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/commons/utils/utility.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final pageViewController = Get.put(CommonPageViewController());

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: SideMenu(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarHome(
          onMenuClick: () {
            controller.openDrawer();
          },
          onCartClick: () {
            Get.toNamed(AppRoutes.cartScreen);
          },
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      SearchBar(
                        onSearchTap: (searchKey) {
                          Get.toNamed(AppRoutes.searchScreen,arguments: [ProductListController.TYPE_SEARCH],);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CommonPageView(),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => controller.isLoadingCategories.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: ColorName.jewel,
                                ),
                              )
                            : Container(
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: ColorName.panache,
                                    border: Border.all(color: ColorName.silver)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        AppLocalizations.of(context).shopByCategoryTxt,
                                        style: AppThemeData.font16Weight600PlayfairCardinal
                                            .copyWith(fontSize: 18.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: HomeShopByCategoryWidget(
                                          list: controller.shopByCategoryList),
                                    ),

                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GetBuilder<HomeScreenController>(
              builder: (controller) => HomeProductsWidget(list: controller.productsByCollectionList),
            ),
            SliverList  (
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          AppLocalizations.of(context).testimonials,
                          style:
                              AppThemeData.font16Weight600PlayfairCardinal.copyWith(fontSize: 18.0),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < 3; i++)
                              Container(
                                margin: const EdgeInsets.only(left: 16, right: 8, top: 12),
                                decoration: BoxDecoration(
                                    color: ColorName.mercury,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                                      child: Text(
                                        '“professional service.\nGoods delivered even before expected time.\nFair prices and very good customer support.” ',
                                        style: AppThemeData.font14Weight400,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25, bottom: 8),
                                      child: Text(
                                        'Ayyman',
                                        style: AppThemeData.font14Weight600Black
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          AppLocalizations.of(context).needHelp,
                          style:
                              AppThemeData.font16Weight600PlayfairCardinal.copyWith(fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  Utility.launchCall('9876543210');
                                },
                                child: Image.asset(
                                  Assets.images.callImage.path,
                                  height: 40,
                                )),
                            const SizedBox(
                              width: 12,
                            ),
                            InkWell(
                              onTap: () {
                                Utility.launchWhatsapp('9876543210');
                              },
                              child: Image.asset(
                                Assets.images.whatsappImage.path,
                                height: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            InkWell(
                              onTap: () {
                                Utility.launchMail('mailto:example@gmail.com');
                              },
                              child: Image.asset(
                                Assets.images.emaiContactImage.path,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text(
                          AppLocalizations.of(context).getSocialWithUs,
                          style:
                              AppThemeData.font16Weight600PlayfairCardinal.copyWith(fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Utility.launchURL('https://www.instagram.com/');
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    Assets.images.instagramImage.path,
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    AppLocalizations.of(context).igArabic,
                                    style: AppThemeData.font14Weight300Black,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Utility.launchURL('https://www.instagram.com/');
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    Assets.images.instagramImage.path,
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    AppLocalizations.of(context).igEnglish,
                                    style: AppThemeData.font14Weight300Black,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Utility.launchURL('https://www.facebook.com/');
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    Assets.images.facebookImage.path,
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    AppLocalizations.of(context).facebook,
                                    style: AppThemeData.font14Weight300Black,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Utility.launchURL('https://www.youtube.com/');
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    Assets.images.icYoutube.path,
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    AppLocalizations.of(context).youTube,
                                    style: AppThemeData.font14Weight300Black,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
