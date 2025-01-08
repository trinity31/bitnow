import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:btc_price_app/domain/model/websocket_response.dart';
import 'dart:convert';
import '../../utils/print.dart';
import 'dart:async';

class WebSocketClient {
  WebSocketChannel? _channel;
  final String baseUrl;

  final _controller = StreamController<WebSocketResponse>.broadcast();

  WebSocketClient({required this.baseUrl});

  void connect() {
    try {
      _channel = WebSocketChannel.connect(
        Uri.parse('$baseUrl/ws/price'),
      );
      safePrint('WebSocket 연결 성공');

      _channel!.stream.listen(
        (data) {
          final jsonMap = jsonDecode(data);
          _controller.add(WebSocketResponse.fromJson(jsonMap));
        },
        onError: (error) {
          safePrint('WebSocket 에러 발생: $error');
          reconnect();
        },
        onDone: () {
          safePrint('WebSocket 연결이 종료되었습니다.');
          reconnect();
        },
      );
    } catch (e) {
      safePrint('WebSocket 연결 실패: $e');
      rethrow;
    }
  }

  Stream<WebSocketResponse> get priceStream => _controller.stream;

  bool get isConnected => _channel != null;

  void reconnect() {
    safePrint('웹소켓 재연결 시도');
    disconnect();
    connect();
  }

  void disconnect() {
    _channel?.sink.close();
    _channel = null;
  }
}
