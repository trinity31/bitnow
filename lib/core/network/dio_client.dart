import 'package:btc_price_app/utils/print.dart';
import 'package:dio/dio.dart';
import 'auth_interceptor.dart';
import '../constants.dart';

class DioClient {
  static Dio getInstance({bool withAuth = false}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ),
    );

    // 로깅 인터셉터 추가
    dio.interceptors.add(
      LogInterceptor(
        requestBody: false,
        responseBody: false,
        logPrint: (object) => safePrint(object.toString()),
      ),
    );

    // 인증이 필요한 경우 AuthInterceptor 추가
    if (withAuth) {
      dio.interceptors.add(AuthInterceptor());
    }

    return dio;
  }
}
