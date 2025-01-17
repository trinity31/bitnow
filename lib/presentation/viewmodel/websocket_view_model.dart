import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:btc_price_app/data/remote/websocket_client.dart';
import 'package:btc_price_app/domain/model/websocket_response.dart';
import 'package:btc_price_app/core/constants.dart';
import 'package:flutter/foundation.dart';
import '../../utils/print.dart';

part 'websocket_view_model.g.dart';

@Riverpod(keepAlive: true)
class WebSocketViewModel extends _$WebSocketViewModel {
  WebSocketClient? _client;

  WebSocketViewModel() {
    safePrint('🔵 WebSocketViewModel created');
  }

  void dispose() {
    safePrint('🔴 WebSocketViewModel disposed');
  }

  @override
  Stream<WebSocketResponse> build() {
    safePrint('🏗️ WebSocketViewModel build called');
    _client = WebSocketClient(
      baseUrl: ApiConstants.baseUrl.replaceFirst('http', 'ws'),
    );

    ref.onDispose(() {
      _client?.disconnect();
    });

    _client!.connect();
    return _client!.priceStream;
  }

  void reconnect() {
    safePrint('웹소켓 재연결 시도');
    //state = const AsyncLoading();
    _client?.reconnect();
    // _client?.connect();
  }
}
