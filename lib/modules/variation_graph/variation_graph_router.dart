import 'package:get/get.dart';

import 'variation_graph_bindings.dart';
import 'views/variation_graph_page.dart';

class VariationGraphRouter {
  static const initial = '/variation_graph';

  static GetPage get page {
    return GetPage(
      name: initial,
      page: () => const VariationGraphPage(),
      binding: VariationGraphBindings(),
    );
  }
}
