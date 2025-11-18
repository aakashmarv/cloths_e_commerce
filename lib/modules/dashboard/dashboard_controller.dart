import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:io';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  DateTime? lastBackPressTime;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void handleBackPress() {
    // If not in home tab → go to home tab
    if (currentIndex.value != 0) {
      currentIndex.value = 0;
      return;
    }

    DateTime now = DateTime.now();

    if (lastBackPressTime == null ||
        now.difference(lastBackPressTime!) > const Duration(seconds: 2)) {
      lastBackPressTime = now;

      Fluttertoast.showToast(
        msg: "Press back again to exit",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

      return;
    }

    // Exit app
    exit(0);
  }
}
