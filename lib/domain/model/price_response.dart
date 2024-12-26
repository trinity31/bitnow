import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_response.freezed.dart';
part 'price_response.g.dart';

@freezed
class PriceResponse with _$PriceResponse {
  factory PriceResponse({
    @JsonKey(name: 'btc_krw') double? btcKrw,
    @JsonKey(name: 'btc_usd') double? btcUsd,
    @JsonKey(name: 'percent_change_24h') double? percentChange24h,
    @JsonKey(name: 'kimchi_premium') double? kimchiPremium,
    int? timestamp,
  }) = _PriceResponse;

  factory PriceResponse.fromJson(Map<String, dynamic> json) =>
      _$PriceResponseFromJson(json);
}
