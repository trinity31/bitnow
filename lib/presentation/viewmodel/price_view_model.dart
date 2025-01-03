import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:btc_price_app/data/remote/price_api_client.dart';
import 'package:btc_price_app/domain/model/price_response.dart';
import 'package:btc_price_app/core/constants.dart';
import 'package:flutter/foundation.dart';
import '../../utils/print.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'price_view_model.g.dart';

@Riverpod(keepAlive: true)
class PriceViewModel extends AsyncNotifier<double?> {
  WebSocketChannel? _channel;

  @override
  Future<double?> build() async {
    _initWebSocket();
    return null;
  }

  void _initWebSocket() {
    try {
      _channel?.sink.close();
      _channel = WebSocketChannel.connect(
        Uri.parse(ApiConstants.wsUrl),
      );

      _channel?.stream.listen(
        (data) {
          final price = double.tryParse(data.toString());
          if (price != null) {
            state = AsyncData(price);
          }
        },
        onError: (error) {
          print('WebSocket 오류: $error');
          state = AsyncError(error, StackTrace.current);
          // 재연결 시도
          Future.delayed(const Duration(seconds: 5), _initWebSocket);
        },
        onDone: () {
          print('WebSocket 연결 종료');
          // 연결이 종료되면 재연결 시도
          Future.delayed(const Duration(seconds: 5), _initWebSocket);
        },
      );
    } catch (e) {
      print('WebSocket 연결 실패: $e');
      state = AsyncError(e, StackTrace.current);
      // 연결 실패시 재연결 시도
      Future.delayed(const Duration(seconds: 5), _initWebSocket);
    }
  }

  @override
  void dispose() {
    _channel?.sink.close();
    super.dispose();
  }
}
