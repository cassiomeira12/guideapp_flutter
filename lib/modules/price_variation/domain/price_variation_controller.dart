import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/domain/models/active_model.dart';
import '../../app/domain/models/chart_active_model.dart';
import '../../app/interface/finance_interface.dart';

class PriceVariationController extends GetxController {
  final FinanceInterface interface;

  late TextEditingController searchController;

  RxBool loadingActive = RxBool(false);
  Rx<ActiveModel?> activeSelected = Rx(null);
  Rx<ChartActiveModel?> activeChart = Rx(null);
  String errorMessage = '';

  PriceVariationController({
    required this.interface,
  });

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController(text: 'PETR4.SA');
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      loadingActive.value = true;
      var list = await search(searchController.text);
      activeSelected.value = list.isNotEmpty ? list.first : null;
      getChart(searchController.text);
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      loadingActive.value = false;
    }
  }

  Future<ChartActiveModel> getChart(String code) async {
    try {
      loadingActive.value = true;
      return activeChart.value = await interface.getChart(code);
    } catch (error) {
      errorMessage = error.toString();
      throw errorMessage;
    } finally {
      loadingActive.value = false;
    }
  }

  Future<List<ActiveModel>> search(String search) async {
    try {
      return await interface.search(search);
    } catch (error) {
      errorMessage = error.toString();
      rethrow;
    }
  }
}
