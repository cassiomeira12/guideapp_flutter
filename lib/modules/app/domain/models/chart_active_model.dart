// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

class ChartActiveModel {
  final String symbol;
  final List<Indicator> indicators;
  final double highest;
  final double lowest;
  final DateTime initialDate;
  final DateTime finalDate;

  ChartActiveModel({
    required this.symbol,
    required this.indicators,
    required this.highest,
    required this.lowest,
    required this.initialDate,
    required this.finalDate,
  });

  factory ChartActiveModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> meta = json['meta'];
    List<DateTime> timestamp = List.from(json['timestamp'] ?? [])
        .map<DateTime>((timestamp) =>
            DateTime.fromMillisecondsSinceEpoch(timestamp * 1000))
        .toList();

    var indicatorsQuote = List.from(json['indicators']['quote'] ?? []);

    Map<String, dynamic> quote =
        indicatorsQuote.isEmpty ? {} : indicatorsQuote.first;

    var opens = List.from(quote['open'] ?? []);
    var closes = List.from(quote['close'] ?? []);
    var highs = List.from(quote['high'] ?? []);
    var lows = List.from(quote['low'] ?? []);

    List<Indicator> indicators = [];

    double highest = 0;
    double lowest = highs.first;

    var indicatorIndex = 0;
    int index = timestamp.length > 30 ? timestamp.length - 30 : 0;

    for (; index < timestamp.length; index++, indicatorIndex++) {
      if (highs[index] > highest) {
        highest = highs[index];
      }
      if (lows[index] < lowest) {
        lowest = lows[index];
      }
      indicators.add(
        Indicator(
          timestamp: timestamp[index],
          open: opens[index],
          close: closes[index],
          high: highs[index],
          low: lows[index],
          first: indicatorIndex == 0 ? null : indicators.first,
          previous: indicatorIndex == 0 ? null : indicators[indicatorIndex - 1],
        ),
      );
    }

    return ChartActiveModel(
      symbol: meta['symbol'],
      indicators: indicators,
      highest: highest,
      lowest: lowest,
      initialDate: timestamp[timestamp.length > 30 ? timestamp.length - 30 : 0],
      finalDate: timestamp.last,
    );
  }
}

class Indicator {
  final DateTime timestamp;
  final double open;
  final double close;
  final double high;
  final double low;

  Indicator? first;
  Indicator? previous;

  Indicator({
    required this.timestamp,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
    this.first,
    this.previous,
  });

  String get priceFormated {
    return NumberFormat.simpleCurrency(locale: 'pt-BR').format(close);
  }

  int get day {
    return timestamp.day;
  }

  String get dateFormated {
    return DateFormat('dd/MM/yyyy').format(timestamp);
  }

  double get variationD1 {
    if (previous == null) {
      return 0;
    } else {
      var variation = ((close - previous!.close) / previous!.close) * 100;
      return variation;
    }
  }

  String get variationD1Percent {
    var value = variationD1;
    if (value == 0) return '';
    var variationFormated = NumberFormat.compactCurrency(
      symbol: '',
      locale: 'pt-BR',
      decimalDigits: 2,
    ).format(value);
    return '$variationFormated%';
  }

  double get firstVariation {
    if (previous == null) {
      return 0;
    } else {
      var variation = ((close - first!.close) / first!.close) * 100;
      return variation;
    }
  }

  String get firstVariationPercent {
    var value = firstVariation;
    if (value == 0) return '';
    var variationFormated = NumberFormat.compactCurrency(
      symbol: '',
      locale: 'pt-BR',
      decimalDigits: 2,
    ).format(value);
    return '$variationFormated%';
  }
}
