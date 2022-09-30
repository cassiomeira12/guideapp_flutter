import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guideapp_flutter/styles/font/font_style.dart';
import 'package:guideapp_flutter/styles/sizer.dart';

import '../../../widgets/text_input/auto_complete_field.dart';
import '../../app/domain/models/active_model.dart';
import '../../app/domain/models/chart_active_model.dart';
import '../domain/price_variation_controller.dart';

class PriceVariationPage extends GetView<PriceVariationController> {
  const PriceVariationPage({Key? key}) : super(key: key);

  Future<bool> _onWillPop() async {
    Get.offAllNamed('/');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'price_variation'.tr,
            style: fontBody1(
              context,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => _onWillPop,
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 48,
              ),
              child: AutoCompleteField<ActiveModel>(
                hintText: 'search_active'.tr,
                labelText: 'search_active'.tr,
                controller: controller.searchController,
                fieldStyle: fontBody1(
                  context,
                  color: Colors.white,
                ),
                suggestionsCallback: (value) async {
                  if (value.isEmpty) {
                    return [];
                  }
                  return await controller.search(value);
                },
                itemBuilder: (context, ActiveModel model) {
                  return ListTile(
                    title: Text(
                      model.symbol,
                      style: fontBody1(context),
                    ),
                    subtitle: Text(
                      model.longName,
                      style: fontBody2(context),
                    ),
                  );
                },
                onSuggestionSelected: (ActiveModel model) {
                  controller.activeSelected.value = model;
                  controller.searchController.text = model.symbol;
                  controller.getChart(model.symbol);
                },
                itemNotFound: 'active_not_found'.tr,
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.loadingActive.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (controller.errorMessage.isNotEmpty) {
                    return Center(
                      child: Text(
                        controller.errorMessage,
                        style: fontBody1(
                          context,
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else if (controller.activeChart.value == null) {
                    return const SizedBox.shrink();
                  } else {
                    ChartActiveModel model = controller.activeChart.value!;
                    List<TableRow> rows = [];
                    rows.add(
                      _tableRow(
                        context,
                        day: 'day'.tr,
                        date: 'date'.tr,
                        price: 'price'.tr,
                        variationD1: 'variation_d1'.tr,
                        firstVariation: 'first_variation'.tr,
                      ),
                    );

                    for (var index = 0;
                        index < model.indicators.length;
                        index++) {
                      rows.add(
                        _tableRow(
                          context,
                          day: (index + 1).toString(),
                          date: model.indicators[index].dateFormated,
                          price: model.indicators[index].priceFormated,
                          variationD1:
                              model.indicators[index].variationD1Percent,
                          firstVariation:
                              model.indicators[index].firstVariationPercent,
                          variationD1Color:
                              model.indicators[index].variationD1 > 0
                                  ? Colors.green
                                  : Colors.red,
                          firstVariationColor:
                              model.indicators[index].firstVariation > 0
                                  ? Colors.green
                                  : Colors.red,
                        ),
                      );
                    }

                    return Column(
                      children: [
                        Text(
                          controller.activeSelected.value!.longName,
                          style: fontHead3(
                            context,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          controller.activeSelected.value!.sectorIndustry,
                          style: fontBody1(
                            context,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5.pxH),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(1),
                                  1: FlexColumnWidth(2.5),
                                  2: FlexColumnWidth(2.5),
                                  3: FlexColumnWidth(2),
                                  4: FlexColumnWidth(2),
                                },
                                border: const TableBorder(
                                  horizontalInside: BorderSide(
                                    color: Colors.white,
                                  ),
                                  verticalInside: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                children: rows,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _tableRow(
    BuildContext context, {
    required String day,
    required String date,
    required String price,
    required String variationD1,
    required String firstVariation,
    Color variationD1Color = Colors.white,
    Color firstVariationColor = Colors.white,
  }) {
    return TableRow(
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            day,
            style: fontBody1(
              context,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.only(left: 8),
          alignment: Alignment.center,
          child: Text(
            date,
            style: fontBody1(
              context,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.only(left: 8),
          alignment: Alignment.center,
          child: Text(
            price,
            style: fontBody1(
              context,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.only(left: 8),
          alignment: Alignment.center,
          child: Text(
            variationD1,
            style: fontBody1(
              context,
              color: variationD1Color,
            ),
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.only(left: 8),
          alignment: Alignment.center,
          child: Text(
            firstVariation,
            style: fontBody1(
              context,
              color: firstVariationColor,
            ),
          ),
        ),
      ],
    );
  }
}
