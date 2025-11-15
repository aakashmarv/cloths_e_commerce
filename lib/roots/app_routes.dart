
import 'package:get/get.dart';

import '../view/splash_screen.dart';

class AppRoutes {
  static const splash = '/splash';

  static const _defaultTransition = Transition.cupertino;
  static const _transitionDuration = Duration(milliseconds: 500);

  static GetPage _buildPage({
    required String name,
    required GetPageBuilder page,
  }) {
    return GetPage(
      name: name,
      page: page,
      transition: _defaultTransition,
      transitionDuration: _transitionDuration,
    );
  }

  static List<GetPage> getRoutes() {
    return [
      _buildPage(name: splash, page: () => SplashScreen()),
     
    ];
  }
}
