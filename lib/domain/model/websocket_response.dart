import 'package:freezed_annotation/freezed_annotation.dart';

part 'websocket_response.freezed.dart';
part 'websocket_response.g.dart';

@freezed
class Change24h with _$Change24h {
  factory Change24h({
    double? krw,
    double? usd,
  }) = _Change24h;

  factory Change24h.fromJson(Map<String, dynamic> json) =>
      _$Change24hFromJson(json);
}

@freezed
class WebSocketRsi with _$WebSocketRsi {
  factory WebSocketRsi({
    @JsonKey(name: '15m') double? min15,
    @JsonKey(name: '1h') double? hour1,
    @JsonKey(name: '4h') double? hour4,
    @JsonKey(name: '1d') double? day1,
  }) = _WebSocketRsi;

  factory WebSocketRsi.fromJson(Map<String, dynamic> json) =>
      _$WebSocketRsiFromJson(json);
}

@freezed
class WebSocketResponse with _$WebSocketResponse {
  factory WebSocketResponse({
    double? krw,
    double? usd,
    String? timestamp,
    @JsonKey(name: 'kimchi_premium') double? kimchiPremium,
    @JsonKey(name: 'change_24h') Change24h? change24h,
    WebSocketRsi? rsi,
    double? dominance,
    @JsonKey(name: 'high_3w') High3w? high3w,
  }) = _WebSocketResponse;

  factory WebSocketResponse.fromJson(Map<String, dynamic> json) =>
      _$WebSocketResponseFromJson(json);
}

@freezed
class High3w with _$High3w {
  factory High3w({
    double? krw,
    double? usd,
    @JsonKey(name: 'krw_timestamp') String? krwTimestamp,
    @JsonKey(name: 'usd_timestamp') String? usdTimestamp,
  }) = _High3w;

  factory High3w.fromJson(Map<String, dynamic> json) => _$High3wFromJson(json);
}
