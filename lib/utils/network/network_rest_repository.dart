import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'network_error.dart';
import 'network_rest_interface.dart';

class NetworkRestRepository implements NetworkRestInterface {
  final String baseUrl;

  final int receiveTimeout;
  final int connectTimeout;

  NetworkRestRepository({
    required this.baseUrl,
    this.receiveTimeout = 60,
    this.connectTimeout = 60,
  });

  Future<Dio> _instanceDio() async {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: Duration(seconds: receiveTimeout).inMilliseconds,
      connectTimeout: Duration(seconds: connectTimeout).inMilliseconds,
      contentType: 'application/json',
    ));

    return dio;
  }

  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic>? queryParameters,
    String? contentType,
  }) async {
    final dio = await _instanceDio();

    dio.options.headers.addAll(headers);

    try {
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
      );
      return response;
    } on DioError catch (error) {
      if (error.response == null) {
        throw NetworkError(
          message: 'Ops! verifique sua conexão com a internet.',
        );
      }
      debugPrint(error.toString());
      rethrow;
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }
}
