// import 'package:get/get.dart';
// import 'dashboard_controller.dart';

// class DashboardBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put(DashboardController());
// // Get.put<CategoriesController>(CategoriesController());
//   }
// }


import 'package:get/get.dart';
import '../category/categories_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => CategoriesController()); // REQUIRED
  }
}
