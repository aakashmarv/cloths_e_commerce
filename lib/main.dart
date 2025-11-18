import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'constants/app_strings.dart';
import 'roots/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final appState = Get.find<AppStateController>();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          // theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.lightTheme,
          // themeMode: appState.themeMode.value,
          initialRoute: AppRoutes.splash,
          getPages: AppRoutes.getRoutes(),
        );
      },
    );
  }
}
