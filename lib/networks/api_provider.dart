import 'package:crypto_mobile/networks/app_interceptor.dart';
import 'package:crypto_mobile/networks/network_constants.dart';
import 'package:dio/dio.dart';


class ApiProvider {
  final dio = createDio();
  // final tokenDio = Dio(BaseOptions(baseUrl:host));

  ApiProvider._internal();

  static final _singleton = ApiProvider._internal();

  factory ApiProvider() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: host,
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ));

    dio.interceptors.add(AppInterceptors(dio));
    return dio;
  }
}
