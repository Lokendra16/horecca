import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/product_detail/view/product_recommendation.dart';
import 'package:the_horeca_store/app/modules/product_detail/controller/product_detail_controller.dart';
import 'package:the_horeca_store/app/modules/product_detail/view/product_details_widget.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/product_detail_pageview/product_detail_pageview.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
import 'product_desc_widget.dart';
import 'product_review_widget.dart';
import 'product_variants_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({Key? key}) : super(key: key);

  final productDetailController = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.white,
      appBar:  AppBar(
        backgroundColor: ColorName.white,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Center(
            child: Assets.icons.icBack.svgIcon(
              size: 20,
              color: ColorName.black,
            ),
          ),
        ),
        title: Obx(() => Text(productDetailController.title.value ?? '', style: AppThemeData.sf500Font18Black),),
        actions: [
          GestureDetector(
            onTap: (){
              Get.toNamed(AppRoutes.searchScreen);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Assets.icons.icSearch.svgIcon(
                size: 20,
                color: ColorName.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed(AppRoutes.cartScreen);
            },
            child: Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Assets.icons.icCart.svgIcon(
                  size: 20,
                  color: ColorName.black,
                ),
            ),
          ),
        ],
      ),
      /*PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarCart(
          onBackPressed: () {
            Get.back();
          },
          title: productDetailController.title.value ?? '',
        ),
      ),*/
      body: Obx(
        () {
          if (productDetailController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: ColorName.jewel),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ProductDetailPageView(),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Column(
                      children: [
                        Obx(
                          () => ProductDetailsWidget(
                            product:
                                productDetailController.productDetail.value,
                          ),
                        ),
                        ProductVariantsWidget(),
                        Container(height: 1,width: size.width,color: ColorName.silver,),
                        ProductDescWidget(),
                        Container(height: 1,width: size.width,color: ColorName.silver,),
                        ProductReviewWidget(),
                        Container(height: 1,width: size.width,color: ColorName.silver,),
                        userReviewWidget(size: size),
                        productDetailController.isLoadingRecommendation.value
                            ? const SizedBox()
                            : ProductsRecommendationWidget(
                                data: productDetailController
                                    .productRecommendationList.value,
                              ),
                        ProductItemAddWidget(),
                        /*      selectSizeWidget(size: size),
                    selectCapecityWidget(size: size),
                    selectColorWidget(size: size),

                    additionalInfoWidget(productDetailController: productDetailController),

                    userReviewWidget(size: size),
                    Text(
                      AppLocalizations.of(context).youMayAlsoLike,
                      style: AppThemeData.font16Weight600Playfair,
                    ),
                    SizedBox(height: size.height * 0.3, child: const HomeCategoryGridView()),
                    */
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class ProductItemAddWidget extends StatelessWidget {
  ProductItemAddWidget({
    super.key,
  });

  ProductDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 15),
      height: 38,
      width: size.width,
      color: ColorName.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 112,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: ColorName.silver)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => controller.decrementQuantity(),
                    child: const Icon(
                      Icons.remove,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 32,
                    decoration: BoxDecoration(
                        color: ColorName.jewel,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Obx(
                        () => Text(
                          "${controller.quantity.value}",
                          style: AppThemeData.font14Weight700,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.incrementQuantity(),
                    child: const Icon(
                      Icons.add,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  controller.addToCart();
                },
                style:
                    TextButton.styleFrom(backgroundColor: ColorName.cardinal),
                child: Text(AppLocalizations.of(context).addToCart,
                    style: AppThemeData.font14Weight700),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class userReviewWidget extends StatelessWidget {
  const userReviewWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        color: ColorName.white,
        child:
        Column(
          children: [
            for (int index = 0;
            index < 3;
            index++)
           Column(
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text(
                       "Marvin McKinney",
                       style: AppThemeData.sf500Font16Black,
                     ),
                     Row(
                       children: [
                         Image.asset(
                           Assets.images.reviewStar.path,
                           height: 12,
                         ),
                         Image.asset(
                           Assets.images.reviewStar.path,
                           height: 12,
                         ),
                         Image.asset(
                           Assets.images.reviewStar.path,
                           height: 12,
                         ),
                         Image.asset(
                           Assets.images.reviewStar.path,
                           height: 12,
                         ),
                         Image.asset(
                           Assets.images.reviewStar.path,
                           height: 12,
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
               const SizedBox(
                 height: 8,
               ),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16),
                 child: Text(
                   "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
                   style: AppThemeData.sf400Font12,
                   softWrap: false,
                   textScaleFactor: 1.2,
                   maxLines: 2,
                   overflow: TextOverflow.ellipsis,
                 ),
               ),
               const Divider(
                 color: ColorName.silver,
               ),
               index == 3 - 1 ?
               Container(
                 margin: const EdgeInsets.only(bottom: 8),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(6),
                     border: Border.all(color: ColorName.silver)),
                 child: Padding(
                   padding: const EdgeInsets.all(7.0),
                   child: Text(
                     AppLocalizations.of(context).seeAllReview,
                     style: AppThemeData.font12Weight400,
                   ),
                 ),
               ): const SizedBox(),
             ],
           )
          ],
        )
    );
  }
}

/*


class userReviewWidget extends StatelessWidget {
  const userReviewWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.35,
        color: ColorName.white,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.3, child: const UserReviewListview()),
            Container(
              height: 28,
              width: 98,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: ColorName.silver)),
              child: Center(
                child: Text(
                  AppLocalizations.of(context).seeAllReview,
                  style: AppThemeData.font12Weight400,
                ),
              ),
            ),
          ],
        ));
  }
}

class additionalInfoWidget extends StatelessWidget {
  const additionalInfoWidget({
    super.key,
    required this.productDetailController,
  });

  final ProductDetailController productDetailController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: ColorName.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).additionInformation,
                style: AppThemeData.selectSizeStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () => productDetailController.additionalInfoExpanded.value =
                    !productDetailController.additionalInfoExpanded.value,
                child: Text(
                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                  style: AppThemeData.productDescription,
                  maxLines: productDetailController.additionalInfoExpanded.value ? null : 5,
                  overflow: productDetailController.additionalInfoExpanded.value
                      ? null
                      : TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),
              !productDetailController.additionalInfoExpanded.value
                  ? Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () => productDetailController.additionalInfoExpanded.value = true,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          height: 28,
                          width: 98,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorName.silver),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Read more",
                                  style: AppThemeData.font12Weight400,
                                ),
                                Icon(
                                  Icons.arrow_circle_down_outlined,
                                  size: 16,
                                  color: ColorName.gray,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () => productDetailController.additionalInfoExpanded.value = false,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          height: 28,
                          width: 98,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorName.silver),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  productDetailController.additionalInfoExpanded.value == false
                                      ? "Read more"
                                      : "Show less",
                                  style: AppThemeData.font12Weight400,
                                ),
                                Icon(
                                  productDetailController.additionalInfoExpanded.value == false
                                      ? Icons.arrow_circle_down_outlined
                                      : Icons.arrow_circle_up,
                                  size: 16,
                                  color: ColorName.gray,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}



class customerReviewWidget extends StatelessWidget {
  const customerReviewWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      width: size.width,
      color: ColorName.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              AppLocalizations.of(context).customerReview,
              style: AppThemeData.selectSizeStyle,
            ),
            Row(
              children: [
                Image.asset(
                  Assets.images.reviewStar.path,
                  height: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                Image.asset(
                  Assets.images.reviewStar.path,
                  height: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                Image.asset(
                  Assets.images.reviewStar.path,
                  height: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                Image.asset(
                  Assets.images.secondLastStar.path,
                  height: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                Image.asset(
                  Assets.images.lastStar.path,
                  height: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class selectColorWidget extends StatelessWidget {
  const selectColorWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.14,
      width: size.width,
      color: ColorName.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).color,
              style: AppThemeData.selectSizeStyle,
            ),
            const SelectColorListview(),
          ],
        ),
      ),
    );
  }
}

class selectCapecityWidget extends StatelessWidget {
  const selectCapecityWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      width: size.width,
      color: ColorName.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).capeCity,
              style: AppThemeData.selectSizeStyle,
            ),
            SizedBox(height: 32, child: const SelectCategoryListview()),
          ],
        ),
      ),
    );
  }
}

class selectSizeWidget extends StatelessWidget {
  const selectSizeWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.12,
      width: size.width,
      color: ColorName.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).selectSize,
              style: AppThemeData.selectSizeStyle,
            ),
            const SelectSizeListview(),
          ],
        ),
      ),
    );
  }
}
*/
