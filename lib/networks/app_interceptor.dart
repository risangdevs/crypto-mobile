import 'dart:convert';

import 'package:crypto_mobile/networks/exception.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {

    dynamic body;
    body = options.queryParameters;
    if (options.data != null) {
      body = options.data;
    }
    if (body is Map) {
      body = json.encode(body);
    }

    options.headers["Accept"] = "*/*";

    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    print("[Request URL]: ${options.uri}");
    print("[Request]: $body");
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

    // if (accessToken != null) {
    //   options.headers["Authorization"] = "Bearer $accessToken";
    // }

    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    print("[Response]: ${json.encode(response.statusMessage)}");
    print("[Response]: ${json.encode(response.data)}");
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

    return handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    print("[Error]: ${err.error ?? err}");
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(err.requestOptions);
      default:
    }

    switch (err.response?.statusCode) {
      case 302:
        throw NotFoundException(err.requestOptions);
      case 400:
        throw BadRequestException(err.requestOptions, err.response);
      case 401:
        throw UnauthorizedException(err.requestOptions);
      case 404:
        throw NotFoundException(err.requestOptions);
      case 409:
        throw ConflictException(err.requestOptions);
      case 500:
        throw InternalServerErrorException(err.requestOptions);
    }

    return handler.next(err);
  }
}

