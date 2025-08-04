import 'dart:io';
import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  /// Maps DioException to user-friendly error message
  static String handleDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiErrorMessages.connectionTimeout;

      case DioExceptionType.badResponse:
        return _handleHttpStatusCode(exception.response);

      case DioExceptionType.cancel:
        return ApiErrorMessages.requestCancelled;

      case DioExceptionType.connectionError:
        return _isNetworkError(exception)
            ? ApiErrorMessages.noInternetConnection
            : ApiErrorMessages.serverUnreachable;

      case DioExceptionType.unknown:
        return _isNetworkError(exception)
            ? ApiErrorMessages.noInternetConnection
            : ApiErrorMessages.unknownError;

      case DioExceptionType.badCertificate:
        return ApiErrorMessages.serverUnreachable;
    }
  }

  /// Maps HTTP status codes to appropriate error messages
  static String _handleHttpStatusCode([Response? response]) {
    final statusCode = response?.statusCode;
    if (statusCode == null) return ApiErrorMessages.unknownError;

    // Try to parse error response using ApiErrorModel for more specific messages
    if (response != null) {
      final specificMessage = _parseErrorResponse(response, statusCode);
      if (specificMessage != null) return specificMessage;
    }

    switch (statusCode) {
      case 400:
        return ApiErrorMessages.badRequest;
      case 401:
        return ApiErrorMessages.unauthorized;
      case 403:
        return ApiErrorMessages.forbidden;
      case 404:
        return ApiErrorMessages.notFound;
      case 422:
        return ApiErrorMessages.validationError;
      case 429:
        return ApiErrorMessages.tooManyRequests;
      case 500:
        return ApiErrorMessages.internalServerError;
      case 502:
        return ApiErrorMessages.badGateway;
      case 503:
        return ApiErrorMessages.serviceUnavailable;
      default:
        if (statusCode >= 400 && statusCode < 500) {
          return ApiErrorMessages.badRequest;
        } else if (statusCode >= 500) {
          return ApiErrorMessages.internalServerError;
        }
        return ApiErrorMessages.unknownError;
    }
  }

  static String? _parseErrorResponse(Response response, int statusCode) {
    try {
      if (response.data is! Map<String, dynamic>) {
        return null;
      }
      final errorModel = ApiErrorModel.fromJson(response.data);
      final message = errorModel.message;

      if (message == null || message.isEmpty) {
        return null;
      }

      if (statusCode == 401 &&
          message.toLowerCase().contains('invalid credentials')) {
        return ApiErrorMessages.invalidCredentials;
      }
      return message;
    } catch (e) {
      return null;
    }
  }

  /// Checks if the exception is related to network connectivity
  static bool _isNetworkError(DioException exception) {
    if (exception.error is SocketException ||
        exception.error is HttpException) {
      return true;
    }

    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout ||
        exception.type == DioExceptionType.connectionError) {
      return true;
    }

    final message = exception.message?.toLowerCase() ?? '';
    final errorString = exception.error?.toString().toLowerCase() ?? '';

    final networkKeywords = [
      'network',
      'connection',
      'unreachable',
      'timeout',
      'host lookup failed',
      'no route to host',
      'connection refused',
    ];

    return networkKeywords.any(
      (keyword) => message.contains(keyword) || errorString.contains(keyword),
    );
  }

  static String extractErrorMessage(dynamic error) {
    if (error is DioException) {
      return handleDioException(error);
    }

    if (error is SocketException) {
      return ApiErrorMessages.noInternetConnection;
    }

    if (error is FormatException) {
      return ApiErrorMessages.parseError;
    }

    final errorString = error?.toString();
    return !errorString.isNullOrEmpty()
        ? errorString!
        : ApiErrorMessages.unknownError;
  }
}
