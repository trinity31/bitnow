// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceResponse _$PriceResponseFromJson(Map<String, dynamic> json) {
  return _PriceResponse.fromJson(json);
}

/// @nodoc
mixin _$PriceResponse {
  @JsonKey(name: 'btc_krw')
  double? get btcKrw => throw _privateConstructorUsedError;
  @JsonKey(name: 'btc_usd')
  double? get btcUsd => throw _privateConstructorUsedError;
  @JsonKey(name: 'percent_change_24h')
  double? get percentChange24h => throw _privateConstructorUsedError;
  @JsonKey(name: 'kimchi_premium')
  double? get kimchiPremium => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this PriceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PriceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriceResponseCopyWith<PriceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceResponseCopyWith<$Res> {
  factory $PriceResponseCopyWith(
          PriceResponse value, $Res Function(PriceResponse) then) =
      _$PriceResponseCopyWithImpl<$Res, PriceResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'btc_krw') double? btcKrw,
      @JsonKey(name: 'btc_usd') double? btcUsd,
      @JsonKey(name: 'percent_change_24h') double? percentChange24h,
      @JsonKey(name: 'kimchi_premium') double? kimchiPremium,
      int? timestamp});
}

/// @nodoc
class _$PriceResponseCopyWithImpl<$Res, $Val extends PriceResponse>
    implements $PriceResponseCopyWith<$Res> {
  _$PriceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? btcKrw = freezed,
    Object? btcUsd = freezed,
    Object? percentChange24h = freezed,
    Object? kimchiPremium = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      btcKrw: freezed == btcKrw
          ? _value.btcKrw
          : btcKrw // ignore: cast_nullable_to_non_nullable
              as double?,
      btcUsd: freezed == btcUsd
          ? _value.btcUsd
          : btcUsd // ignore: cast_nullable_to_non_nullable
              as double?,
      percentChange24h: freezed == percentChange24h
          ? _value.percentChange24h
          : percentChange24h // ignore: cast_nullable_to_non_nullable
              as double?,
      kimchiPremium: freezed == kimchiPremium
          ? _value.kimchiPremium
          : kimchiPremium // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceResponseImplCopyWith<$Res>
    implements $PriceResponseCopyWith<$Res> {
  factory _$$PriceResponseImplCopyWith(
          _$PriceResponseImpl value, $Res Function(_$PriceResponseImpl) then) =
      __$$PriceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'btc_krw') double? btcKrw,
      @JsonKey(name: 'btc_usd') double? btcUsd,
      @JsonKey(name: 'percent_change_24h') double? percentChange24h,
      @JsonKey(name: 'kimchi_premium') double? kimchiPremium,
      int? timestamp});
}

/// @nodoc
class __$$PriceResponseImplCopyWithImpl<$Res>
    extends _$PriceResponseCopyWithImpl<$Res, _$PriceResponseImpl>
    implements _$$PriceResponseImplCopyWith<$Res> {
  __$$PriceResponseImplCopyWithImpl(
      _$PriceResponseImpl _value, $Res Function(_$PriceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? btcKrw = freezed,
    Object? btcUsd = freezed,
    Object? percentChange24h = freezed,
    Object? kimchiPremium = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$PriceResponseImpl(
      btcKrw: freezed == btcKrw
          ? _value.btcKrw
          : btcKrw // ignore: cast_nullable_to_non_nullable
              as double?,
      btcUsd: freezed == btcUsd
          ? _value.btcUsd
          : btcUsd // ignore: cast_nullable_to_non_nullable
              as double?,
      percentChange24h: freezed == percentChange24h
          ? _value.percentChange24h
          : percentChange24h // ignore: cast_nullable_to_non_nullable
              as double?,
      kimchiPremium: freezed == kimchiPremium
          ? _value.kimchiPremium
          : kimchiPremium // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceResponseImpl implements _PriceResponse {
  _$PriceResponseImpl(
      {@JsonKey(name: 'btc_krw') this.btcKrw,
      @JsonKey(name: 'btc_usd') this.btcUsd,
      @JsonKey(name: 'percent_change_24h') this.percentChange24h,
      @JsonKey(name: 'kimchi_premium') this.kimchiPremium,
      this.timestamp});

  factory _$PriceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceResponseImplFromJson(json);

  @override
  @JsonKey(name: 'btc_krw')
  final double? btcKrw;
  @override
  @JsonKey(name: 'btc_usd')
  final double? btcUsd;
  @override
  @JsonKey(name: 'percent_change_24h')
  final double? percentChange24h;
  @override
  @JsonKey(name: 'kimchi_premium')
  final double? kimchiPremium;
  @override
  final int? timestamp;

  @override
  String toString() {
    return 'PriceResponse(btcKrw: $btcKrw, btcUsd: $btcUsd, percentChange24h: $percentChange24h, kimchiPremium: $kimchiPremium, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceResponseImpl &&
            (identical(other.btcKrw, btcKrw) || other.btcKrw == btcKrw) &&
            (identical(other.btcUsd, btcUsd) || other.btcUsd == btcUsd) &&
            (identical(other.percentChange24h, percentChange24h) ||
                other.percentChange24h == percentChange24h) &&
            (identical(other.kimchiPremium, kimchiPremium) ||
                other.kimchiPremium == kimchiPremium) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, btcKrw, btcUsd, percentChange24h, kimchiPremium, timestamp);

  /// Create a copy of PriceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceResponseImplCopyWith<_$PriceResponseImpl> get copyWith =>
      __$$PriceResponseImplCopyWithImpl<_$PriceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceResponseImplToJson(
      this,
    );
  }
}

abstract class _PriceResponse implements PriceResponse {
  factory _PriceResponse(
      {@JsonKey(name: 'btc_krw') final double? btcKrw,
      @JsonKey(name: 'btc_usd') final double? btcUsd,
      @JsonKey(name: 'percent_change_24h') final double? percentChange24h,
      @JsonKey(name: 'kimchi_premium') final double? kimchiPremium,
      final int? timestamp}) = _$PriceResponseImpl;

  factory _PriceResponse.fromJson(Map<String, dynamic> json) =
      _$PriceResponseImpl.fromJson;

  @override
  @JsonKey(name: 'btc_krw')
  double? get btcKrw;
  @override
  @JsonKey(name: 'btc_usd')
  double? get btcUsd;
  @override
  @JsonKey(name: 'percent_change_24h')
  double? get percentChange24h;
  @override
  @JsonKey(name: 'kimchi_premium')
  double? get kimchiPremium;
  @override
  int? get timestamp;

  /// Create a copy of PriceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceResponseImplCopyWith<_$PriceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
