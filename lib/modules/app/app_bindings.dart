import 'package:get/get.dart';
import 'package:guideapp_flutter/modules/app/domain/env.dart';
import 'package:guideapp_flutter/utils/network/network_rest_interface.dart';
import 'package:guideapp_flutter/utils/network/network_rest_repository.dart';

import 'domain/app_controller.dart';
import 'interface/finance_interface.dart';
import 'repository/finance_repository.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put<NetworkRestInterface>(
      NetworkRestRepository(
        baseUrl: appEnv.baseUrl,
      ),
    );
    Get.put<FinanceInterface>(FinanceRepository(network: Get.find()));
  }
}
