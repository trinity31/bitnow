import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) {
  final dio = Dio();
  dio.options.baseUrl = 'YOUR_BASE_URL'; // 실제 서버 URL로 변경
  return dio;
});
