// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Change24hImpl _$$Change24hImplFromJson(Map<String, dynamic> json) =>
    _$Change24hImpl(
      krw: (json['krw'] as num?)?.toDouble(),
      usd: (json['usd'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$Change24hImplToJson(_$Change24hImpl instance) =>
    <String, dynamic>{
      'krw': instance.krw,
      'usd': instance.usd,
    };

_$WebSocketRsiImpl _$$WebSocketRsiImplFromJson(Map<String, dynamic> json) =>
    _$WebSocketRsiImpl(
      min15: (json['15m'] as num?)?.toDouble(),
      hour1: (json['1h'] as num?)?.toDouble(),
      hour4: (json['4h'] as num?)?.toDouble(),
      day1: (json['1d'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WebSocketRsiImplToJson(_$WebSocketRsiImpl instance) =>
    <String, dynamic>{
      '15m': instance.min15,
      '1h': instance.hour1,
      '4h': instance.hour4,
      '1d': instance.day1,
    };

_$WebSocketResponseImpl _$$WebSocketResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WebSocketResponseImpl(
      krw: (json['krw'] as num?)?.toDouble(),
      usd: (json['usd'] as num?)?.toDouble(),
      timestamp: json['timestamp'] as String?,
      kimchiPremium: (json['kimchi_premium'] as num?)?.toDouble(),
      change24h: json['change_24h'] == null
          ? null
          : Change24h.fromJson(json['change_24h'] as Map<String, dynamic>),
      rsi: json['rsi'] == null
          ? null
          : WebSocketRsi.fromJson(json['rsi'] as Map<String, dynamic>),
      dominance: (json['dominance'] as num?)?.toDouble(),
      high3w: json['high_3w'] == null
          ? null
          : High3w.fromJson(json['high_3w'] as Map<String, dynamic>),
      volume: json['volume'] == null
          ? null
          : Volume.fromJson(json['volume'] as Map<String, dynamic>),
      ethBtcRatio: (json['eth_btc_ratio'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WebSocketResponseImplToJson(
        _$WebSocketResponseImpl instance) =>
    <String, dynamic>{
      'krw': instance.krw,
      'usd': instance.usd,
      'timestamp': instance.timestamp,
      'kimchi_premium': instance.kimchiPremium,
      'change_24h': instance.change24h,
      'rsi': instance.rsi,
      'dominance': instance.dominance,
      'high_3w': instance.high3w,
      'volume': instance.volume,
      'eth_btc_ratio': instance.ethBtcRatio,
    };

_$High3wImpl _$$High3wImplFromJson(Map<String, dynamic> json) => _$High3wImpl(
      krw: (json['krw'] as num?)?.toDouble(),
      usd: (json['usd'] as num?)?.toDouble(),
      krwTimestamp: json['krw_timestamp'] as String?,
      usdTimestamp: json['usd_timestamp'] as String?,
    );

Map<String, dynamic> _$$High3wImplToJson(_$High3wImpl instance) =>
    <String, dynamic>{
      'krw': instance.krw,
      'usd': instance.usd,
      'krw_timestamp': instance.krwTimestamp,
      'usd_timestamp': instance.usdTimestamp,
    };

_$VolumeImpl _$$VolumeImplFromJson(Map<String, dynamic> json) => _$VolumeImpl(
      min1: (json['1m'] as num?)?.toDouble(),
      min5: (json['5m'] as num?)?.toDouble(),
      min15: (json['15m'] as num?)?.toDouble(),
      hour1: (json['1h'] as num?)?.toDouble(),
      hour24: (json['24h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$VolumeImplToJson(_$VolumeImpl instance) =>
    <String, dynamic>{
      '1m': instance.min1,
      '5m': instance.min5,
      '15m': instance.min15,
      '1h': instance.hour1,
      '24h': instance.hour24,
    };
