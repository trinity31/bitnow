import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String baseUrl = 'http://192.168.0.37:8000';
  // WebSocket URL에서 'ws://'로 시작하도록 수정
  static const String wsUrl = 'ws://192.168.0.37:8000/ws/price';

  // API 엔드포인트
  static const String krwPriceEndpoint = '/prices/krw';
  static const String usdPriceEndpoint = '/prices/usd';

  // 지표 엔드포인트
  static const String rsiEndpoint = '/indicator/rsi';
  static const String dominanceEndpoint = '/indicator/dominance';
  static const String mvrvEndpoint = '/indicator/mvrv';
}
