import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

class ApiConstants {
  static String get baseUrl {
    // 릴리즈 모드일 때는 프로덕션 URL 사용
    //return dotenv.env['BASE_URL_DEV'] ?? 'http://localhost:8000';
    return dotenv.env['BASE_URL_PROD'] ?? 'http://localhost:8000';
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
  static const String fearGreedEndpoint = '/indicator/fear-greed';
}

class Constants {
  // 다른 상수들...

  // 테스트 모드에서는 테스트 광고 ID를 사용하고, 릴리스 모드에서는 플랫폼별 .env 파일의 실제 광고 ID를 사용합니다.
  static String get bannerAdUnitId {
    if (kDebugMode) {
      // 테스트 광고 ID (플랫폼별)
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/6300978111';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      } else {
        return 'ca-app-pub-3940256099942544/6300978111';
      }
    } else {
      // 실제 광고 ID (플랫폼별)
      if (Platform.isAndroid) {
        return dotenv.env['ADMOB_BANNER_AD_UNIT_ID_ANDROID'] ??
            'ca-app-pub-4447113193580859/3101398954';
      } else if (Platform.isIOS) {
        return dotenv.env['ADMOB_BANNER_AD_UNIT_ID_IOS'] ??
            'ca-app-pub-4447113193580859/7040643962';
      } else {
        // 기본값 (안드로이드 ID)
        return 'ca-app-pub-4447113193580859/3101398954';
      }
    }
  }
}
