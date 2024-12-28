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
