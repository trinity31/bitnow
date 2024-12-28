import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:btc_price_app/data/remote/websocket_client.dart';
import 'package:btc_price_app/domain/model/websocket_response.dart';
import 'package:btc_price_app/core/constants.dart';
import 'package:flutter/foundation.dart';

part 'websocket_view_model.g.dart';

@Riverpod(keepAlive: true)
class WebSocketViewModel extends _$WebSocketViewModel {
  WebSocketClient? _client;

  WebSocketViewModel() {
    debugPrint('🔵 WebSocketViewModel created');
  }

  void dispose() {
    debugPrint('🔴 WebSocketViewModel disposed');
  }

  @override
  Stream<WebSocketResponse> build() {
    debugPrint('🏗️ WebSocketViewModel build called');
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
    _client?.disconnect();
    _client?.connect();
  }
}
