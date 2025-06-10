import '../../core/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/model/alert/alert_model.dart';
import '../../data/remote/alert_api_client.dart';
import '../../core/network/dio_client.dart';
import '../../core/constants.dart';
import '../../utils/print.dart';

part 'alert_view_model.g.dart';

@riverpod
class AlertViewModel extends _$AlertViewModel {
  AlertApiClient? _client;

  AlertApiClient get client {
    _client ??= AlertApiClient(
      DioClient.getInstance(withAuth: true),
      baseUrl: ApiConstants.baseUrl,
    );
    return _client!;
  }

  @override
  Future<List<AlertResponse>> build() async {
    return getAlerts();
  }

  Future<List<AlertResponse>> getAlerts() async {
    try {
      return await client.getAlerts();
    } catch (e) {
      safePrint('알림 목록 조회 실패: $e');
      return [];
    }
  }

  Future<void> createAlert(AlertRequest request) async {
    try {
      await client.createAlert(request);
      ref.invalidateSelf();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 400) {
        safePrint('알림 생성 실패: ${e.response?.data}');
        final detail = e.response?.data['detail']['message'] as String?;
        if (detail != null) {
          safePrint('알림 생성 실패: $detail');
          throw AlertException(detail);
        }
      }
      rethrow;
    }
  }

  Future<void> deleteAlert(int alertId) async {
    try {
      await client.deleteAlert(alertId);
      ref.invalidateSelf();
    } catch (e) {
      safePrint('알림 삭제 실패: $e');
      rethrow;
    }
  }

  Future<void> reactivateAlert(int id) async {
    try {
      final response = await client.toggleAlert(id);
      ref.invalidateSelf();
    } catch (e) {
      safePrint('알림 상태 변경 실패: $e');
      rethrow;
    }
  }
}
