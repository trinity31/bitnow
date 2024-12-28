import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:btc_price_app/domain/model/websocket_response.dart';
import 'dart:convert';
import '../../utils/print.dart';

class WebSocketClient {
  WebSocketChannel? _channel;
  final String baseUrl;

  WebSocketClient({required this.baseUrl});

  void connect() {
    try {
      _channel = WebSocketChannel.connect(
        Uri.parse('$baseUrl/ws/price'),
      );
      safePrint('WebSocket 연결 성공');
    } catch (e) {
      safePrint('WebSocket 연결 실패: $e');
      rethrow;
    }
  }

  Stream<WebSocketResponse> get priceStream => _channel!.stream.map((data) {
        final json = jsonDecode(data);
        return WebSocketResponse.fromJson(json);
      });

  void disconnect() {
    _channel?.sink.close();
    _channel = null;
  }

  bool get isConnected => _channel != null;
}
