import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get baseUrl =>
      dotenv.env['BASE_URL'] ?? 'http://127.0.0.1:8000';

  // API 엔드포인트
  static const String krwPriceEndpoint = '/prices/krw';
  static const String usdPriceEndpoint = '/prices/usd';

  // 지표 엔드포인트
  static const String rsiEndpoint = '/indicator/rsi';
  static const String dominanceEndpoint = '/indicator/dominance';
  static const String mvrvEndpoint = '/indicator/mvrv';
}
