// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:intl/intl.dart';

class GraphWidget extends StatelessWidget {
  final double highestPrice;
  final double lowestPrice;
  final DateTime initialDate;
  final DateTime finalDate;
  final List<GraphValue> values;

  late double _dayFrequency;
  late double _dataFrequency;
  late double _priceFrequency;

  GraphWidget({
    Key? key,
    required this.highestPrice,
    required this.lowestPrice,
    required this.initialDate,
    required this.finalDate,
    required this.values,
  }) : super(key: key) {
    _dayFrequency = (finalDate.millisecondsSinceEpoch.toDouble() -
            initialDate.millisecondsSinceEpoch.toDouble()) /
        10;
    _dataFrequency = _dayFrequency / 3;
    _priceFrequency = ((highestPrice - lowestPrice) / lowestPrice) * 10;
  }

  @override
  Widget build(BuildContext context) {
    return Chart(
      layers: [
        ChartGridLayer(
          settings: ChartGridSettings(
            x: ChartGridSettingsAxis(
              color: Colors.white.withOpacity(0.2),
              frequency: _dayFrequency,
              max: finalDate.millisecondsSinceEpoch.toDouble(),
              min: initialDate.millisecondsSinceEpoch.toDouble(),
            ),
            y: ChartGridSettingsAxis(
              color: Colors.white.withOpacity(0.2),
              frequency: _priceFrequency,
              max: highestPrice,
              min: lowestPrice,
            ),
          ),
        ),
        ChartAxisLayer(
          settings: ChartAxisSettings(
            x: ChartAxisSettingsAxis(
              frequency: _dayFrequency,
              max: finalDate.millisecondsSinceEpoch.toDouble(),
              min: initialDate.millisecondsSinceEpoch.toDouble(),
              textStyle: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 10.0,
              ),
            ),
            y: ChartAxisSettingsAxis(
              frequency: _priceFrequency,
              max: highestPrice,
              min: lowestPrice,
              textStyle: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 10.0,
              ),
            ),
          ),
          labelX: (value) => DateFormat('dd/MM')
              .format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),
          labelY: (value) => value.toInt().toString(),
        ),
        ChartCandleLayer(
          items: values.map((value) {
            return _candle(
              x: value.date.millisecondsSinceEpoch.toDouble(),
              open: value.open,
              close: value.close,
              high: value.high,
              low: value.low,
            );
          }).toList(),
          settings: const ChartCandleSettings(),
        ),
      ],
    );
  }

  ChartCandleDataItem _candle({
    required double x,
    required double open,
    required double close,
    required double high,
    required double low,
  }) {
    return ChartCandleDataItem(
      color: close >= open ? Colors.green : Colors.red,
      value1: ChartCandleDataItemValue(
        max: open,
        min: close,
      ),
      value2: ChartCandleDataItemValue(
        max: high,
        min: low,
      ),
      x: x,
    );
  }
}

class GraphValue {
  final DateTime date;
  final double open;
  final double close;
  final double high;
  final double low;

  GraphValue({
    required this.date,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
  });
}
