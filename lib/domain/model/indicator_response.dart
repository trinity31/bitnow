import 'package:freezed_annotation/freezed_annotation.dart';

part 'indicator_response.freezed.dart';
part 'indicator_response.g.dart';

@freezed
class RsiData with _$RsiData {
  factory RsiData({
    double? rsi,
    String? signal,
  }) = _RsiData;

  factory RsiData.fromJson(Map<String, dynamic> json) =>
      _$RsiDataFromJson(json);
}

@freezed
class RsiResponse with _$RsiResponse {
  factory RsiResponse({
    @JsonKey(name: '15m') RsiData? min15,
    @JsonKey(name: '1h') RsiData? hour1,
    @JsonKey(name: '4h') RsiData? hour4,
    @JsonKey(name: '1d') RsiData? day1,
  }) = _RsiResponse;

  factory RsiResponse.fromJson(Map<String, dynamic> json) =>
      _$RsiResponseFromJson(json);
}

@freezed
class DominanceResponse with _$DominanceResponse {
  factory DominanceResponse({
    double? dominance,
    String? timestamp,
  }) = _DominanceResponse;

  factory DominanceResponse.fromJson(Map<String, dynamic> json) =>
      _$DominanceResponseFromJson(json);
}

@freezed
class MvrvResponse with _$MvrvResponse {
  factory MvrvResponse({
    double? mvrv,
    String? timestamp,
  }) = _MvrvResponse;

  factory MvrvResponse.fromJson(Map<String, dynamic> json) =>
      _$MvrvResponseFromJson(json);
}

@freezed
class MAValue with _$MAValue {
  factory MAValue({
    @JsonKey(name: 'ma_value') double? maValue,
    @JsonKey(name: 'threshold_up') double? thresholdUp,
    @JsonKey(name: 'threshold_down') double? thresholdDown,
    @JsonKey(name: 'confirmed_up') bool? confirmedUp,
    @JsonKey(name: 'confirmed_down') bool? confirmedDown,
  }) = _MAValue;

  factory MAValue.fromJson(Map<String, dynamic> json) =>
      _$MAValueFromJson(json);
}

@freezed
class MarketDiagnosis with _$MarketDiagnosis {
  factory MarketDiagnosis({
    String? trend,
    String? description,
  }) = _MarketDiagnosis;

  factory MarketDiagnosis.fromJson(Map<String, dynamic> json) =>
      _$MarketDiagnosisFromJson(json);
}

@freezed
class MACrossResponse with _$MACrossResponse {
  factory MACrossResponse({
    double? price,
    int? timestamp,
    @JsonKey(name: 'ma_results') Map<String, dynamic>? maResults,
    @JsonKey(name: 'market_diagnosis') MarketDiagnosis? marketDiagnosis,
  }) = _MACrossResponse;

  factory MACrossResponse.fromJson(Map<String, dynamic> json) =>
      _$MACrossResponseFromJson(json);
}
