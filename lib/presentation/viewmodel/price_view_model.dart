import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:btc_price_app/data/remote/price_api_client.dart';
import 'package:btc_price_app/domain/model/price_response.dart';
import 'package:btc_price_app/core/constants.dart';
import 'package:flutter/foundation.dart';

part 'price_view_model.g.dart';

@Riverpod(keepAlive: true)
class PriceViewModel extends _$PriceViewModel {
  PriceViewModel() {
    debugPrint('🔵 PriceViewModel created');
  }

  void dispose() {
    debugPrint('🔴 PriceViewModel disposed');
  }

  static const int maxRetries = 3; // 최대 재시도 횟수
  static const Duration retryDelay = Duration(seconds: 2); // 재시도 간격

  @override
  Future<(PriceResponse, PriceResponse)> build() async {
    debugPrint('🏗️ PriceViewModel build called');
    return _fetchPrices();
  }

  Future<(PriceResponse, PriceResponse)> _fetchPrices(
      [int retryCount = 0]) async {
    try {
      final dio = Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ));

      final client = PriceApiClient(dio);

      final krwPrice = await client.getKrwPrice();
      final usdPrice = await client.getUsdPrice();
      return (krwPrice, usdPrice);
    } on DioException catch (e) {
      if (retryCount < maxRetries) {
        debugPrint('API 호출 실패, ${retryCount + 1}번째 재시도...');
        await Future.delayed(retryDelay);
        return _fetchPrices(retryCount + 1);
      }
      throw Exception('가격 정보를 가져오는데 실패했습니다: $e');
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchPrices());
  }
}
