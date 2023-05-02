import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/my_order_screen/model/order_model.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/networking/graphql/graphql_repo.dart';

import '../../../../commons/utils/my_snackbar.dart';

class OrderListController extends GetxController {
  var isInitialLoading = true.obs;
  var orderList = <OrderModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOrderList();
  }

  void getOrderList() async {
    isInitialLoading.value = true;
    var cartId = await AppPreference().get(AppPreference.KEY_ACCESS_TOKEN) ?? '';
    GraphQLRepo().orderListAPI(cartId).then(
      (value) {
        filterCartData(value);
      },
    ).onError(
      (error, stackTrace) {
        isInitialLoading.value = false;
        MySnackBar().errorSnackBar(error.toString());
      },
    );
  }

  void filterCartData(response) {
    List<OrderModel> orders = [];

    response["nodes"].forEach((element) {
      var product = OrderModel(
        id: element["id"],
        name: element["name"],
        processedAt: element["processedAt"],
        fulfillmentStatus: element["fulfillmentStatus"],
        financialStatus: element["financialStatus"],
        totalAmount: element["totalPrice"]["amount"],
        totalCC: element["totalPrice"]["currencyCode"],
      );
      orders.add(product);
    });

    orderList.value = orders;
    isInitialLoading.value = false;
  }
}
