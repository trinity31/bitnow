// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceResponseImpl _$$PriceResponseImplFromJson(Map<String, dynamic> json) =>
    _$PriceResponseImpl(
      btcKrw: (json['btc_krw'] as num?)?.toDouble(),
      btcUsd: (json['btc_usd'] as num?)?.toDouble(),
      percentChange24h: (json['percent_change_24h'] as num?)?.toDouble(),
      timestamp: (json['timestamp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PriceResponseImplToJson(_$PriceResponseImpl instance) =>
    <String, dynamic>{
      'btc_krw': instance.btcKrw,
      'btc_usd': instance.btcUsd,
      'percent_change_24h': instance.percentChange24h,
      'timestamp': instance.timestamp,
    };
