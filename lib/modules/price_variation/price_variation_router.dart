import 'package:get/get.dart';

import 'price_variation_bindings.dart';
import 'views/price_variation_page.dart';

class PriceVariationRouter {
  static const initial = '/';

  static GetPage get page {
    return GetPage(
      name: initial,
      page: () => const PriceVariationPage(),
      binding: PriceVariationBindings(),
    );
  }
}
