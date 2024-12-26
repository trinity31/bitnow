import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:btc_price_app/data/remote/price_api_client.dart';
import 'package:btc_price_app/domain/model/price_response.dart';
import 'package:btc_price_app/core/constants.dart';
import 'package:flutter/foundation.dart';

part 'price_view_model.g.dart';

@riverpod
class PriceViewModel extends _$PriceViewModel {
  @override
  Future<(PriceResponse, PriceResponse)> build() async {
    return _fetchPrices();
  }

  Future<(PriceResponse, PriceResponse)> _fetchPrices() async {
    final dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));

    final client = PriceApiClient(dio);

    try {
      final krwPrice = await client.getKrwPrice();
      final usdPrice = await client.getUsdPrice();
      debugPrint('krwPrice: ${krwPrice.btcKrw}');
      return (krwPrice, usdPrice);
    } catch (e) {
      throw Exception('가격 정보를 가져오는데 실패했습니다: $e');
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchPrices());
  }
}
