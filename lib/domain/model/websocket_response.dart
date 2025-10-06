import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

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
    Volume? volume,
    @JsonKey(name: 'eth_btc_ratio') double? ethBtcRatio,
  }) = _WebSocketResponse;

  static WebSocketResponse _fromJson(Map<String, dynamic> json) {
    // volume 데이터가 예상과 다른 형식으로 오면 null로 처리
    try {
      if (json.containsKey('volume')) {
        // volume 데이터 형식 검사
        final volumeData = json['volume'];
        if (volumeData is! Map<String, dynamic>) {
          // volume 데이터 형식이 예상과 다르면 null로 설정
          json['volume'] = null;
        } else {
          // 각 필드가 숫자인지 검사
          final Map<String, dynamic> volume = volumeData;
          volume.forEach((key, value) {
            if (value is! num) {
              // 숫자가 아닌 값이 있으면 null로 설정
              volume[key] = null;
            }
          });
        }
      }
      return _$WebSocketResponseFromJson(json);
    } catch (e) {
      // 예외 발생 시 기본 응답 생성
      return WebSocketResponse(
        krw: json['krw'] as double?,
        usd: json['usd'] as double?,
        timestamp: json['timestamp'] as String?,
        kimchiPremium: json['kimchi_premium'] as double?,
        // volume 데이터는 null로 처리
        volume: null,
      );
    }
  }

  factory WebSocketResponse.fromJson(Map<String, dynamic> json) =>
      _fromJson(json);
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

@freezed
class Volume with _$Volume {
  factory Volume({
    @JsonKey(name: '1m') double? min1,
    @JsonKey(name: '5m') double? min5,
    @JsonKey(name: '15m') double? min15,
    @JsonKey(name: '1h') double? hour1,
    @JsonKey(name: '24h') double? hour24,
  }) = _Volume;

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);
}
