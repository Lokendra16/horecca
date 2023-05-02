import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/my_order_screen/controller/order_list_controller.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/app/widgets/order_item.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class OrderListScreen extends StatelessWidget {
  OrderListScreen({Key? key}) : super(key: key);

  final OrderListController controller = Get.put(OrderListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarCart(
          title: AppLocalizations.of(context).myOrder,
          onBackPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Obx(() => controller.isInitialLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorName.jewel,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return OrderItem(
                      item: controller.orderList.value[index],
                    );
                  },
                ),
              )),
      ),
    );
  }
}
