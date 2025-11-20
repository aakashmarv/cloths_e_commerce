import 'package:cloth_e_commerce/modules/category/category_binding.dart';
import 'package:cloth_e_commerce/modules/dashboard/dashboard_binding.dart';
import 'package:cloth_e_commerce/modules/dashboard/dashboard_view.dart';
import 'package:cloth_e_commerce/modules/splash/splash_binding.dart';
import 'package:get/get.dart';
import '../modules/product details/product_details_view.dart';
import '../modules/splash/splash_view.dart';

class AppRoutes {
  static const splash = '/splash';
  static const dashboard = '/dashboard';
  static const catogery = '/category';
  static const productDetailScreen = '/prdouctDetailScreen';

  static const _defaultTransition = Transition.cupertino;
  static const _transitionDuration = Duration(milliseconds: 500);

  static GetPage _buildPage({
    required String name,
    required GetPageBuilder page,
    Bindings? binding
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
      _buildPage(name: splash, page: () => const SplashView(),binding: SplashBinding(),),
      _buildPage(name: dashboard, page: () =>  DashboardView(), binding: DashboardBinding()),
      _buildPage(name: catogery, page: () =>  CategoriesView()),
      _buildPage(name: productDetailScreen, page: () =>  ProductDetailsView()),

    ];
  }
}
// , binding: CategoriesBinding()