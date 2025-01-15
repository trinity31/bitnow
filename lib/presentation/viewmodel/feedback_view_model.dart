import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/remote/feedback_api_client.dart';
import '../../domain/model/feedback/feedback_model.dart';
import '../../utils/print.dart';
import '../../core/network/dio_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'feedback_view_model.g.dart';

@Riverpod(keepAlive: true)
class FeedbackViewModel extends _$FeedbackViewModel {
  FeedbackApiClient? _client;

  FeedbackApiClient get client {
    _client ??= FeedbackApiClient(
      DioClient.getInstance(withAuth: false),
      baseUrl: dotenv.env['SLACK_WEBHOOK_URL']!,
    );
    return _client!;
  }

  FeedbackViewModel() {
    safePrint('🔵 FeedbackViewModel created');
  }

  void dispose() {
    safePrint('🔴 FeedbackViewModel disposed');
  }

  @override
  Future<void> build() async {
    safePrint('🏗️ FeedbackViewModel build called');
    return Future.value();
  }

  Future<void> sendFeedback(String content, String? email) async {
    state = const AsyncValue.loading();
    safePrint('🔵 sendFeedback called');

    state = await AsyncValue.guard(() async {
      final request = FeedbackRequest(content: content, email: email);
      safePrint('🔵 request: $request');
      await client.sendFeedback(request);
    });
  }
}
