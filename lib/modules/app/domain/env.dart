import 'package:flutter/foundation.dart';

const Map<String, String> release = {
  'baseUrl': 'https://query2.finance.yahoo.com',
};

const Map<String, String> debug = {
  'baseUrl': 'https://query2.finance.yahoo.com',
};

final appEnv = Environment.fromJson(kDebugMode ? debug : release);

class Environment {
  final String baseUrl;

  const Environment({
    required this.baseUrl,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      baseUrl: json['baseUrl'],
    );
  }
}
