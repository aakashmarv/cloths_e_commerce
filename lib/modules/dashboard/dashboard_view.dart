import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../category/categories_view copy.dart';
// import '../category/categories_view.dart';
import '../home/home_screen.dart';
import '../profile/account_screen.dart';
import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
    DashboardView({super.key});
// DashboardView({super.key}) {
//   if (!Get.isRegistered<CategoriesController>()) {
//     Get.lazyPut(() => CategoriesController());
//   }
// }

  // DashboardView({super.key}) {
  //   Get.lazyPut(() => CategoriesController());
  // }
  final List<Widget> _screens =  [
    HomeScreen(),
    CategoriesView(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // prevents auto popping
      onPopInvoked: (bool didPop) {
        if (didPop) return;
        controller.handleBackPress();
      },
      child: Scaffold(
        body: Obx(() {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _screens[controller.currentIndex.value],
          );
        }),
      
        bottomNavigationBar: _bottomNavBar(),
      ),
    );
  }

  Widget _bottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(0, Icons.home_rounded, 'Home'),
              _navItem(1, Icons.grid_view_rounded, 'Categories'),
              _navItem(2, Icons.person_rounded, 'Account'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label) {
    return Obx(() {
      final isSelected = controller.currentIndex.value == index;

      return GestureDetector(
        onTap: () => controller.changeTab(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 16 : 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: isSelected ?  AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.black : Colors.grey,
                size: 24,
              ),
              if (isSelected) ...[
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}
