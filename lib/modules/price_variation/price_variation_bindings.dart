import 'package:get/get.dart';

import 'domain/price_variation_controller.dart';

class PriceVariationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PriceVariationController(interface: Get.find()));
  }
}
