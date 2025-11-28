import 'package:cloth_e_commerce/modules/Search/search_screen.dart';
import 'package:cloth_e_commerce/modules/address/new_address_binding.dart';
import 'package:cloth_e_commerce/modules/address/new_address_view.dart';
import 'package:cloth_e_commerce/modules/cart/cart_view.dart';
import 'package:cloth_e_commerce/modules/cart/payment_screen.dart';
import 'package:cloth_e_commerce/modules/category/category_binding.dart';
import 'package:cloth_e_commerce/modules/dashboard/dashboard_binding.dart';
import 'package:cloth_e_commerce/modules/dashboard/dashboard_view.dart';
import 'package:cloth_e_commerce/modules/orders/order_list_view.dart';
import 'package:cloth_e_commerce/modules/splash/splash_binding.dart';
import 'package:get/get.dart';
import '../modules/product details/product_details_view.dart';
import '../modules/splash/splash_view.dart';

class AppRoutes {
  static const splash = '/splash';
  static const dashboard = '/dashboard';
  static const catogery = '/category';
  static const productDetailScreen = '/prdouctDetailScreen';
  static const cartScreen = '/cartScreen';
  static const newAddressScreen = '/newAddressScreen';
  static const paymentScreen = '/paymentScreen';
  static const searchScreen = '/searchScreen';
  static const myOrderScreen = '/myOrderScreen';

  static const _defaultTransition = Transition.cupertino;
  static const _transitionDuration = Duration(milliseconds: 500);

  static GetPage _buildPage({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
  }) {
    return GetPage(
      name: name,
      page: page,
      binding: binding,
      transition: _defaultTransition,
      transitionDuration: _transitionDuration,
    );
  }

  static List<GetPage> getRoutes() {
    return [
      _buildPage(
        name: splash,
        page: () => const SplashView(),
        binding: SplashBinding(),
      ),
      _buildPage(
        name: dashboard,
        page: () => DashboardView(),
        binding: DashboardBinding(),
      ),
      _buildPage(
        name: newAddressScreen,
        page: () => NewAddressView(),
        binding: NewAddressBinding(),
      ),
      _buildPage(name: catogery, page: () => CategoriesView()),
      _buildPage(name: productDetailScreen, page: () => ProductDetailsView()),
      _buildPage(name: cartScreen, page: () => CartView()),
      _buildPage(name: paymentScreen, page: () => PaymentScreen()),
      _buildPage(name: searchScreen, page: () => SearchScreen()),
      _buildPage(name: myOrderScreen, page: () => MyOrdersScreen())
    ];
  }
}
