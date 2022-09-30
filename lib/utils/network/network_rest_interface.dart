import 'package:dio/dio.dart';

abstract class NetworkRestInterface {
  Future<Response> get(
    String url, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic>? queryParameters,
    String? contentType,
  });
}
