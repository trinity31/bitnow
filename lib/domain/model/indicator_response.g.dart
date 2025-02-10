// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indicator_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RsiDataImpl _$$RsiDataImplFromJson(Map<String, dynamic> json) =>
    _$RsiDataImpl(
      rsi: (json['rsi'] as num?)?.toDouble(),
      signal: json['signal'] as String?,
    );

Map<String, dynamic> _$$RsiDataImplToJson(_$RsiDataImpl instance) =>
    <String, dynamic>{
      'rsi': instance.rsi,
      'signal': instance.signal,
    };

_$RsiResponseImpl _$$RsiResponseImplFromJson(Map<String, dynamic> json) =>
    _$RsiResponseImpl(
      min15: json['15m'] == null
          ? null
          : RsiData.fromJson(json['15m'] as Map<String, dynamic>),
      hour1: json['1h'] == null
          ? null
          : RsiData.fromJson(json['1h'] as Map<String, dynamic>),
      hour4: json['4h'] == null
          ? null
          : RsiData.fromJson(json['4h'] as Map<String, dynamic>),
      day1: json['1d'] == null
          ? null
          : RsiData.fromJson(json['1d'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RsiResponseImplToJson(_$RsiResponseImpl instance) =>
    <String, dynamic>{
      '15m': instance.min15,
      '1h': instance.hour1,
      '4h': instance.hour4,
      '1d': instance.day1,
    };

_$DominanceResponseImpl _$$DominanceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DominanceResponseImpl(
      dominance: (json['dominance'] as num?)?.toDouble(),
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$$DominanceResponseImplToJson(
        _$DominanceResponseImpl instance) =>
    <String, dynamic>{
      'dominance': instance.dominance,
      'timestamp': instance.timestamp,
    };

_$MvrvResponseImpl _$$MvrvResponseImplFromJson(Map<String, dynamic> json) =>
    _$MvrvResponseImpl(
      mvrv: (json['mvrv'] as num?)?.toDouble(),
      timestamp: json['timestamp'] as String?,
    );

Map<String, dynamic> _$$MvrvResponseImplToJson(_$MvrvResponseImpl instance) =>
    <String, dynamic>{
      'mvrv': instance.mvrv,
      'timestamp': instance.timestamp,
    };

_$MAValueImpl _$$MAValueImplFromJson(Map<String, dynamic> json) =>
    _$MAValueImpl(
      maValue: (json['ma_value'] as num?)?.toDouble(),
      thresholdUp: (json['threshold_up'] as num?)?.toDouble(),
      thresholdDown: (json['threshold_down'] as num?)?.toDouble(),
      confirmedUp: json['confirmed_up'] as bool?,
      confirmedDown: json['confirmed_down'] as bool?,
    );

Map<String, dynamic> _$$MAValueImplToJson(_$MAValueImpl instance) =>
    <String, dynamic>{
      'ma_value': instance.maValue,
      'threshold_up': instance.thresholdUp,
      'threshold_down': instance.thresholdDown,
      'confirmed_up': instance.confirmedUp,
      'confirmed_down': instance.confirmedDown,
    };

_$MACrossResponseImpl _$$MACrossResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MACrossResponseImpl(
      price: (json['price'] as num?)?.toDouble(),
      timestamp: (json['timestamp'] as num?)?.toInt(),
      maResults: json['ma_results'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MACrossResponseImplToJson(
        _$MACrossResponseImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'timestamp': instance.timestamp,
      'ma_results': instance.maResults,
    };
