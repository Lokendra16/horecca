import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/sub_category/controller/sub_category_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class SubCategory extends StatelessWidget {
  SubCategory({
    Key? key,
  }) : super(key: key);
  final SubCategoryController controller = Get.put(SubCategoryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> listTableAccessories = [
      "Serving solution",
      "Table tap solution",
      "Table presentation",
      "Counter ",
      "Kitchen equipment",
      "Bed & bath linen",
      "Guestroom",
      "Banquet & conference",
      "Housekeeping & front office",
    ];

    List<String> options = [
      "Appetizers & Side Servers",
      "Snack Server",
      "Cast Iron & Boards",
      "Wooden Boards",
      "Bread Baskets",
      "Mini Pans",
      "Ramekins",
    ];
    return Scaffold(
        backgroundColor: ColorName.alabaster,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarCart(
            title: 'Table accessories',
            onBackPressed: () => Get.back(),
          ),
        ),
        body: Container(
          height: size.height,
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Expanded(
            child: GetBuilder<SubCategoryController>(
              builder: (controller) {
                return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: listTableAccessories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                // margin: const EdgeInsets.only(left: 16),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: ColorName.panache,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                    child: Image.asset(
                                  Assets.images.productImage.path,
                                  height: 35,
                                )),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                listTableAccessories[index],
                                style:
                                    AppThemeData.font16Weight600PlayfairBlack,
                              ),
                              const Spacer(),
                              Image.asset(
                                Assets.images.plus.path,
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ));
  }
}
