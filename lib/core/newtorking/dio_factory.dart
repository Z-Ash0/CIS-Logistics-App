import 'package:cis_logistics_app/core/newtorking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Dio getDio() {
    Duration defaultTimeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = defaultTimeout
        ..options.receiveTimeout = defaultTimeout;

      addDioHeaders();
      addDioInterceptor();
    }

    return dio!;
  }

  static void addDioHeaders() async {
    dio?.options.headers = {ApiConstants.accept: ApiConstants.acceptType};
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      ApiConstants.authorization: ApiConstants.bearerPrefix + token,
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
