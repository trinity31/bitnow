import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:btc_price_app/domain/model/websocket_response.dart';
import 'dart:convert';
import '../../utils/print.dart';
import 'dart:async';

class WebSocketClient {
  WebSocketChannel? _channel;
  final String baseUrl;
  final _controller = StreamController<WebSocketResponse>.broadcast();
  bool _isConnected = false;

  WebSocketClient({required this.baseUrl});

  void connect() {
    try {
      _channel = WebSocketChannel.connect(
        Uri.parse('$baseUrl/ws/price'),
      );
      // safePrint('WebSocket 연결 성공');
      // _isConnected = true;

      _channel!.stream.listen(
        (data) {
          if (!_isConnected) {
            _isConnected = true;
            safePrint('WebSocket 연결 성공');
          } 
          final jsonMap = jsonDecode(data);
          _controller.add(WebSocketResponse.fromJson(jsonMap));
        },
        onError: (error) {
          safePrint('WebSocket 에러 발생: $error');
          _isConnected = false;
          _controller.addError(error);
        },
        onDone: () {
          safePrint('WebSocket 연결이 종료되었습니다.');
          if (_isConnected) {
            _controller.addError('Unexpected WebSocket disconnection');
          }
          _isConnected = false;
        },
      );
    } catch (e) {
      safePrint('WebSocket 연결 실패: $e');
      _isConnected = false;
      rethrow;
    }
  }

  Stream<WebSocketResponse> get priceStream => _controller.stream;

  bool get isConnected => _isConnected;

  void reconnect() {
    safePrint('웹소켓 재연결 시도');
    disconnect();
    connect();
  }

  void disconnect() {
    _isConnected = false;
    _channel?.sink.close();
    _channel = null;
  }
}
