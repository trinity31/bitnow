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
    };
