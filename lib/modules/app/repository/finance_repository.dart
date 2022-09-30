import 'package:flutter/foundation.dart';
import 'package:guideapp_flutter/modules/app/domain/models/active_model.dart';
import 'package:guideapp_flutter/modules/app/domain/models/chart_active_model.dart';

import '../../../utils/network/network_error.dart';
import '../../../utils/network/network_rest_interface.dart';
import '../interface/finance_interface.dart';

class FinanceRepository implements FinanceInterface {
  final NetworkRestInterface network;

  FinanceRepository({
    required this.network,
  });

  @override
  Future<ChartActiveModel> getChart(String code) async {
    try {
      var yesterday = DateTime.now().subtract(const Duration(days: 1));
      var mesPassado = yesterday.subtract(const Duration(days: 45));

      var period1 = mesPassado.millisecondsSinceEpoch ~/ 1000;
      var period2 = yesterday.millisecondsSinceEpoch ~/ 1000;

      var response = await network.get(
        '/v8/finance/chart/$code',
        queryParameters: {
          'interval': '1d',
          'period1': period1,
          'period2': period2,
        },
      );

      var data = response.data;
      var chart = data['chart'];
      var error = chart['error'];

      if (error != null) {
        throw 'Não foi possível carregar o gráfico para esse ativo.';
      }

      var results = List.from(chart['result'] ?? []);
      if (results.isEmpty) {
        throw 'Não foi possível carregar o gráfico para esse ativo.';
      } else {
        var model = ChartActiveModel.fromJson(results.first);
        return model;
      }
    } catch (error) {
      debugPrint(error.toString());
      throw error.toString();
    }
  }

  @override
  Future<List<ActiveModel>> search(String search) async {
    try {
      var response = await network.get(
        '/v1/finance/search',
        queryParameters: {
          'q': search,
          'lang': 'pt-BR',
        },
      );

      var data = response.data;
      var quotes = List.from(data['quotes'] ?? []);

      return quotes.map((json) {
        return ActiveModel.fromJson(json);
      }).toList();
    } on NetworkError catch (error) {
      throw error.message;
    } catch (error) {
      debugPrint(error.toString());
      throw error.toString();
    }
  }
}
