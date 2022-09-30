import 'package:get/get.dart';

import 'view/splash_page.dart';

class SplashRouter {
  static const initial = '/';

  static GetPage get page {
    return GetPage(
      name: initial,
      page: () => const SplashPage(),
    );
  }
}
