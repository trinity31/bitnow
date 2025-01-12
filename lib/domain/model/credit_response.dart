import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_response.freezed.dart';
part 'credit_response.g.dart';

@freezed
class CreditResponse with _$CreditResponse {
  factory CreditResponse({
    required int balance,
  }) = _CreditResponse;

  factory CreditResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditResponseFromJson(json);
}
