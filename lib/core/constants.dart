import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

class ApiConstants {
  static String get baseUrl {
    // 릴리즈 모드일 때는 프로덕션 URL 사용
    return dotenv.env['BASE_URL_DEV'] ?? 'http://localhost:8000';
    //return dotenv.env['BASE_URL_PROD'] ?? 'http://localhost:8000';
  }

  static String get wsUrl => baseUrl.replaceFirst(
      RegExp(r'https?'), baseUrl.startsWith('https') ? 'wss' : 'ws');

  // API 엔드포인트
  static const String krwPriceEndpoint = '/prices/krw';
  static const String usdPriceEndpoint = '/prices/usd';

  // 지표 엔드포인트
  static const String rsiEndpoint = '/indicator/rsi';
  static const String dominanceEndpoint = '/indicator/dominance';
  static const String mvrvEndpoint = '/indicator/mvrv';
  static const String maCrossEndpoint = '/indicator/ma-cross';
}
