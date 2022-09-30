import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guideapp_flutter/styles/sizer.dart';

import '../../../styles/font/font_style.dart';
import '../../../widgets/text_input/auto_complete_field.dart';
import '../../app/domain/models/active_model.dart';
import '../../app/domain/models/chart_active_model.dart';
import '../domain/variation_graph_controller.dart';
import 'widgets/graph_widget.dart';

class VariationGraphPage extends GetView<VariationGraphController> {
  const VariationGraphPage({
    Key? key,
  }) : super(key: key);

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
            'variation_graph'.tr,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 48,
              ),
              child: AutoCompleteField<ActiveModel>(
                hintText: 'search_active'.tr,
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
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                          Container(
                            width: 100.pxW,
                            height: 40.pxH,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: GraphWidget(
                              initialDate: model.initialDate,
                              finalDate: model.finalDate,
                              highestPrice: model.highest,
                              lowestPrice: model.lowest,
                              values: model.indicators.map((indicator) {
                                return GraphValue(
                                  date: indicator.timestamp,
                                  open: indicator.open,
                                  close: indicator.close,
                                  high: indicator.high,
                                  low: indicator.low,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
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
}
