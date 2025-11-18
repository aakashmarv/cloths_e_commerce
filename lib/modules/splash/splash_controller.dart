import 'package:get/get.dart';
import '../../roots/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    // Delay for animation to finish
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.dashboard);
    });
  }
}
