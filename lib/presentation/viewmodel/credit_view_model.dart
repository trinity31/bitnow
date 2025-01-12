import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/model/credit_response.dart';
import '../../data/remote/credit_api_client.dart';
import '../../core/network/dio_client.dart';
import '../../core/constants.dart';
import '../../utils/print.dart';

part 'credit_view_model.g.dart';

@Riverpod(keepAlive: true)
class CreditViewModel extends _$CreditViewModel {
  CreditApiClient? _client;

  CreditApiClient get client {
    _client ??= CreditApiClient(
      DioClient.getInstance(withAuth: true),
      baseUrl: ApiConstants.baseUrl,
    );
    return _client!;
  }

  @override
  Future<CreditResponse> build() async {
    return getBalance();
  }

  Future<CreditResponse> getBalance() async {
    try {
      return await client.getBalance();
    } catch (e) {
      safePrint('크레딧 잔액 조회 실패: $e');
      rethrow;
    }
  }

  Future<void> earnCreditFromAd() async {
    try {
      await client.earnCreditFromAd();
      ref.invalidateSelf(); // 잔액 새로고침
    } catch (e) {
      safePrint('크레딧 적립 실패: $e');
      rethrow;
    }
  }
}
