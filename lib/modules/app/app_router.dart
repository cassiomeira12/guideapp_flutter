import 'package:get/get.dart';

import '../price_variation/price_variation_router.dart';
import '../splash/splash_router.dart';
import '../variation_graph/variation_graph_router.dart';

class AppRouter {
  static const initial = '/';

  static final List<GetPage> pages = [
    SplashRouter.page,
    PriceVariationRouter.page,
    VariationGraphRouter.page,
  ];
}
