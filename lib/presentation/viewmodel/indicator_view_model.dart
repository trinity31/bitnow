import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:btc_price_app/data/remote/indicator_api_client.dart';
import 'package:btc_price_app/domain/model/indicator_response.dart';
import 'package:btc_price_app/core/constants.dart';
import 'package:flutter/foundation.dart';
import '../../utils/print.dart';

part 'indicator_view_model.g.dart';

@Riverpod(keepAlive: true)
class IndicatorViewModel extends _$IndicatorViewModel {
  IndicatorViewModel() {
    safePrint('🔵 IndicatorViewModel created');
  }

  void dispose() {
    safePrint('🔴 IndicatorViewModel disposed');
  }

  @override
  Future<(RsiResponse, DominanceResponse, MvrvResponse)> build() async {
    safePrint('🏗️ IndicatorViewModel build called');
    return _fetchIndicators();
  }

  Future<(RsiResponse, DominanceResponse, MvrvResponse)>
      _fetchIndicators() async {
    final dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));

    final client = IndicatorApiClient(dio);

    try {
      final rsi = await client.getRsi();
      final dominance = await client.getDominance();
      final mvrv = await client.getMvrv();
      return (rsi, dominance, mvrv);
    } catch (e) {
      throw Exception('[IndicatorViewModel] 지표 정보를 가져오는데 실패했습니다: $e');
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchIndicators());
  }

  Future<void> createMvrv(double value) async {
    final dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));

    final client = IndicatorApiClient(dio);

    try {
      await client.createMvrv({'value': value});
      refresh();
    } catch (e) {
      throw Exception('MVRV 생성 실패: $e');
    }
  }

  Future<void> updateMvrv(double value) async {
    final dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));

    final client = IndicatorApiClient(dio);

    try {
      await client.updateMvrv({'value': value});
      refresh();
    } catch (e) {
      throw Exception('MVRV 업데이트 실패: $e');
    }
  }
}
