import 'package:get/get.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';

class DashboardScreenController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
   // checkAuthState();
  }

  void checkAuthState() async {
    var accessToken = await AppPreference().get(AppPreference.KEY_ACCESS_TOKEN);
    if (accessToken == null || accessToken.isEmpty) {
      Get.offAllNamed(AppRoutes.loginScreen);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
