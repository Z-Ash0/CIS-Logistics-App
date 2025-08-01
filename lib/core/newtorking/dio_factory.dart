import 'package:cis_logistics_app/core/newtorking/api_constants.dart';
import 'package:cis_logistics_app/core/newtorking/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final String baseUrl;

  DioFactory(this.baseUrl);

  Dio getDio() {
    Duration defaultTimeout = const Duration(seconds: 30);
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: defaultTimeout,
        receiveTimeout: defaultTimeout,
        headers: {ApiConstants.contentTypeKey: ApiConstants.contentTypeValue},
      ),
    );
    addDioInterceptor(dio);
    return dio;
  }

  void addDioInterceptor(Dio dio) {
    dio.interceptors.addAll([
      if (kDebugMode) ...{
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      },
      TokenInterceptor(),
    ]);
  }
}
