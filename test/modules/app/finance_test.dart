import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guideapp_flutter/modules/app/domain/env.dart';
import 'package:guideapp_flutter/modules/app/interface/finance_interface.dart';
import 'package:guideapp_flutter/modules/app/repository/finance_repository.dart';
import 'package:guideapp_flutter/utils/network/network_rest_interface.dart';
import 'package:guideapp_flutter/utils/network/network_rest_repository.dart';

void main() {
  NetworkRestInterface network = NetworkRestRepository(
    baseUrl: appEnv.baseUrl,
  );

  FinanceInterface interface = FinanceRepository(
    network: network,
  );

  const code = 'PETR4.SA';

  test('Test getChar successful', () async {
    String? errorMessage;
    try {
      var model = await interface.getChart(code);
      debugPrint(model.symbol);
      debugPrint(model.indicators.length.toString());
      expect(model, isNotNull);
    } catch (error) {
      errorMessage = error.toString();
      debugPrint(errorMessage);
    }
    expect(errorMessage, isNull);
  });

  test('Test search successful', () async {
    String? errorMessage;
    try {
      var model = await interface.search(code);
      expect(model, isNotNull);
    } catch (error) {
      errorMessage = error.toString();
      debugPrint(errorMessage);
    }
    expect(errorMessage, isNull);
  });
}
