import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/add_address_screen/binding/add_address_binding.dart';
import 'package:the_horeca_store/app/modules/add_address_screen/view/add_address_screen.dart';
import 'package:the_horeca_store/app/modules/bottom_navigation/binding/bottom_navigation_binding.dart';
import 'package:the_horeca_store/app/modules/cart_screen/binding/cart_binding.dart';
import 'package:the_horeca_store/app/modules/cart_screen/view/cart_screen.dart';
import 'package:the_horeca_store/app/modules/category_screen/binding/category_screen_binding.dart';
import 'package:the_horeca_store/app/modules/category_screen/view/category_list_screen.dart';
import 'package:the_horeca_store/app/modules/checkout_screen/binding/checkout_screen_binding.dart';
import 'package:the_horeca_store/app/modules/checkout_screen/view/checkout_screen_view.dart';
import 'package:the_horeca_store/app/modules/forgot_password/binding/forgot_password_binding.dart';
import 'package:the_horeca_store/app/modules/forgot_password/view/forgot_password.dart';
import 'package:the_horeca_store/app/modules/home_screen/binding/home_screen_binding.dart';
import 'package:the_horeca_store/app/modules/home_screen/view/home_screen.dart';
import 'package:the_horeca_store/app/modules/login_screen/binding/login_screen_binding.dart';
import 'package:the_horeca_store/app/modules/login_screen/view/login_screen.dart';
import 'package:the_horeca_store/app/modules/my_account/binding/my_account_binding.dart';
import 'package:the_horeca_store/app/modules/my_order_screen/binding/order_list_binding.dart';
import 'package:the_horeca_store/app/modules/my_account/view/my_account_screen.dart';
import 'package:the_horeca_store/app/modules/my_order_screen/view/order_list_screen.dart';
import 'package:the_horeca_store/app/modules/order_detail/binding/order_detail_binding.dart';
import 'package:the_horeca_store/app/modules/order_detail/view/order_detail.dart';
import 'package:the_horeca_store/app/modules/product_detail/binding/product_detail_binding.dart';
import 'package:the_horeca_store/app/modules/product_detail/view/product_detail_screen.dart';
import 'package:the_horeca_store/app/modules/product_list/binding/product_listview_binding.dart';
import 'package:the_horeca_store/app/modules/review_screen/binding/review_screen_binding.dart';
import 'package:the_horeca_store/app/modules/review_screen/view/review_screen.dart';
import 'package:the_horeca_store/app/modules/saved_address_screen/binding/address_list_binding.dart';
import 'package:the_horeca_store/app/modules/saved_address_screen/view/address_list_screen.dart';
import 'package:the_horeca_store/app/modules/search_screen/binding/search_screen_binding.dart';
import 'package:the_horeca_store/app/modules/search_screen/view/search_products_screen.dart';
import 'package:the_horeca_store/app/modules/shopping_bag/binding/shopping_bag_binding.dart';
import 'package:the_horeca_store/app/modules/shopping_bag/view/shopping_bag_view.dart';
import 'package:the_horeca_store/app/modules/signup_screen/binding/signup_screen_binding.dart';
import 'package:the_horeca_store/app/modules/signup_screen/view/signup_screen.dart';
import 'package:the_horeca_store/app/modules/sub_category/binding/sub_category_binding.dart';
import 'package:the_horeca_store/app/modules/sub_category/view/sub_category.dart';
import 'package:the_horeca_store/app/modules/test/test_screen.dart';
import 'package:the_horeca_store/app/modules/web/binding/web_view_screen_binding.dart';
import 'package:the_horeca_store/app/modules/web/view/webview_screen.dart';
import 'package:the_horeca_store/app/modules/wish_list_screen/view/wish_list_screen.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import '../modules/bottom_navigation/view/bottom_navigation_view.dart';
import '../modules/product_list/view/product_list_screen.dart';
import '../modules/thankyou_screen/thankyou_screen.dart';

class AppPages {
  // For Initial route
  static const initial = AppRoutes.dashboard;
  static final routes = [
    GetPage(
        name: AppRoutes.dashboard,
        page: () => DashboardScreen(),
        binding: DashboardScreenBinding()),
    GetPage(name: AppRoutes.loginScreen, page: () => LoginScreen(), binding: LoginScreenBinding()),
    GetPage(
        name: AppRoutes.signupScreen, page: () => SignupScreen(), binding: SignupScreenBinding()),
    GetPage(
        name: AppRoutes.productListview,
        page: () => ProductListScreen(),
        binding: ProductListBinding()),
    GetPage(name: AppRoutes.myAccount, page: () => MyAccountScreen(), binding: MyAccountBinding()),
    GetPage(name: AppRoutes.homeScreen, page: () => HomeScreen(), binding: HomeScreenBinding()),
    GetPage(
      name: AppRoutes.categoryScreen,
      page: () => CategoryListScreen(),
      binding: CategoryScreenBinding(),
    ),
    GetPage(name: AppRoutes.subCategory, page: () => SubCategory(), binding: SubCategoryBinding()),
    GetPage(
        name: AppRoutes.cartScreen, page: () => CartScreen(), binding: CartScreenBinding()),
    GetPage(
        name: AppRoutes.productDetail,
        page: () => ProductDetailScreen(),
        binding: ProductDetailBinding()),
    GetPage(
      name: AppRoutes.test,
      page: () => const TestScreen(),
    ),
    GetPage(
        name: AppRoutes.shoppingBag,
        page: () => const ShoppingBagView(),
        binding: ShoppingBagBinding()),
    GetPage(
        name: AppRoutes.webview,
        page: () => WebViewScreen(),
        binding: WebViewScreenBinding()),
    GetPage(
        name: AppRoutes.myOrderScreen,
        page: () => OrderListScreen(),
        binding: OrderListBinding()),
    GetPage(
        name: AppRoutes.savedAddressScreen,
        page: () => AddressListScreen(),
        binding: AddressListBinding()),
    GetPage(
        name: AppRoutes.wishListScreen, page: () => WishListScreen()),
    GetPage(
        name: AppRoutes.addAddressScreen,
        page: () => AddAddressScreen(),
        binding: AddAddressBinding()),
    GetPage(
        name: AppRoutes.searchScreen,
        page: () => SearchProductsScreen(),
        binding: SearchScreenBinding()),
    GetPage(
        name: AppRoutes.forgotPassword,
        page: () => ForgotPasswordScreen(),
        binding: ForgotPasswordBinding()),

    GetPage(
        name: AppRoutes.orderDetail,
        page: () => OrderDetail(),
        binding: OrderDetailBinding()),
    GetPage(
        name: AppRoutes.checkoutScreen,
        page: () => CheckoutScreen(),
        binding: CheckoutScreenBinding()),
    GetPage(
        name: AppRoutes.reviewScreen,
        page: () => ReviewScreen(),
        binding: ReviewScreenBinding()),
    GetPage(name: AppRoutes.thankyou,
        page: ()=>ThankYouScreen()),
  ];
}
