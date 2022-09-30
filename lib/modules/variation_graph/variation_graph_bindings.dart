import 'package:get/get.dart';

import 'domain/variation_graph_controller.dart';

class VariationGraphBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(VariationGraphController(interface: Get.find()));
  }
}
