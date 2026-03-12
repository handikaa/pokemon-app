import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constant/api_constants.dart';
import '../error/exceptions.dart';
import 'dio_interceptors.dart';

class DioClient {
  DioClient._();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: ApiConstants.connectTimeout),
      receiveTimeout: const Duration(milliseconds: ApiConstants.receiveTimeout),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.addAll([if (kDebugMode) DioInterceptors.prettyLogger()]);

  /// Exposes the Dio instance when needed.
  static Dio get instance => _dio;

  /// Base GET request handler.
  ///
  /// Returns the [Response] if the request succeeds with status code 200.
  /// Throws custom exceptions for network, unauthorized, not found,
  /// and other server-related errors.
  static Future<Response<dynamic>> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        data: body,
        options: options,
      );

      if (response.statusCode == 200) {
        return response;
      }

      throw _mapStatusCodeToException(
        statusCode: response.statusCode,
        message: _extractErrorMessage(response.data),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      if (e is ServerException ||
          e is NetworkException ||
          e is UnauthorizedException ||
          e is NotFoundException ||
          e is CacheException) {
        rethrow;
      }

      throw ServerException('Unexpected error occurred: $e');
    }
  }

  static Exception _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return NetworkException('Connection timeout, please try again.');

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return NetworkException('No internet connection.');

      case DioExceptionType.badResponse:
        return _mapStatusCodeToException(
          statusCode: e.response?.statusCode,
          message: _extractErrorMessage(e.response?.data),
        );

      case DioExceptionType.cancel:
        return ServerException('Request was cancelled.');

      default:
        return ServerException(
          e.message ?? 'An unexpected server error occurred.',
        );
    }
  }

  static Exception _mapStatusCodeToException({
    required int? statusCode,
    String? message,
  }) {
    switch (statusCode) {
      case 401:
      case 403:
        return UnauthorizedException(message ?? 'Unauthorized');

      case 404:
        return NotFoundException(message ?? 'Data not found');

      case 500:
      case 501:
      case 502:
      case 503:
        return ServerException(message ?? 'Server error');

      default:
        return ServerException(
          message ?? 'Request failed with status code: $statusCode',
        );
    }
  }

  static String? _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message']?.toString() ??
          data['error']?.toString() ??
          data['detail']?.toString();
    }

    return null;
  }
}
