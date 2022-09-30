import '../domain/models/active_model.dart';
import '../domain/models/chart_active_model.dart';

abstract class FinanceInterface {
  Future<ChartActiveModel> getChart(String code);
  Future<List<ActiveModel>> search(String search);
}
