// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'indicator_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RsiData _$RsiDataFromJson(Map<String, dynamic> json) {
  return _RsiData.fromJson(json);
}

/// @nodoc
mixin _$RsiData {
  double? get rsi => throw _privateConstructorUsedError;
  String? get signal => throw _privateConstructorUsedError;

  /// Serializes this RsiData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RsiData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RsiDataCopyWith<RsiData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RsiDataCopyWith<$Res> {
  factory $RsiDataCopyWith(RsiData value, $Res Function(RsiData) then) =
      _$RsiDataCopyWithImpl<$Res, RsiData>;
  @useResult
  $Res call({double? rsi, String? signal});
}

/// @nodoc
class _$RsiDataCopyWithImpl<$Res, $Val extends RsiData>
    implements $RsiDataCopyWith<$Res> {
  _$RsiDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RsiData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rsi = freezed,
    Object? signal = freezed,
  }) {
    return _then(_value.copyWith(
      rsi: freezed == rsi
          ? _value.rsi
          : rsi // ignore: cast_nullable_to_non_nullable
              as double?,
      signal: freezed == signal
          ? _value.signal
          : signal // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RsiDataImplCopyWith<$Res> implements $RsiDataCopyWith<$Res> {
  factory _$$RsiDataImplCopyWith(
          _$RsiDataImpl value, $Res Function(_$RsiDataImpl) then) =
      __$$RsiDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? rsi, String? signal});
}

/// @nodoc
class __$$RsiDataImplCopyWithImpl<$Res>
    extends _$RsiDataCopyWithImpl<$Res, _$RsiDataImpl>
    implements _$$RsiDataImplCopyWith<$Res> {
  __$$RsiDataImplCopyWithImpl(
      _$RsiDataImpl _value, $Res Function(_$RsiDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RsiData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rsi = freezed,
    Object? signal = freezed,
  }) {
    return _then(_$RsiDataImpl(
      rsi: freezed == rsi
          ? _value.rsi
          : rsi // ignore: cast_nullable_to_non_nullable
              as double?,
      signal: freezed == signal
          ? _value.signal
          : signal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RsiDataImpl implements _RsiData {
  _$RsiDataImpl({this.rsi, this.signal});

  factory _$RsiDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RsiDataImplFromJson(json);

  @override
  final double? rsi;
  @override
  final String? signal;

  @override
  String toString() {
    return 'RsiData(rsi: $rsi, signal: $signal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RsiDataImpl &&
            (identical(other.rsi, rsi) || other.rsi == rsi) &&
            (identical(other.signal, signal) || other.signal == signal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rsi, signal);

  /// Create a copy of RsiData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RsiDataImplCopyWith<_$RsiDataImpl> get copyWith =>
      __$$RsiDataImplCopyWithImpl<_$RsiDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RsiDataImplToJson(
      this,
    );
  }
}

abstract class _RsiData implements RsiData {
  factory _RsiData({final double? rsi, final String? signal}) = _$RsiDataImpl;

  factory _RsiData.fromJson(Map<String, dynamic> json) = _$RsiDataImpl.fromJson;

  @override
  double? get rsi;
  @override
  String? get signal;

  /// Create a copy of RsiData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RsiDataImplCopyWith<_$RsiDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RsiResponse _$RsiResponseFromJson(Map<String, dynamic> json) {
  return _RsiResponse.fromJson(json);
}

/// @nodoc
mixin _$RsiResponse {
  @JsonKey(name: '15m')
  RsiData? get min15 => throw _privateConstructorUsedError;
  @JsonKey(name: '1h')
  RsiData? get hour1 => throw _privateConstructorUsedError;
  @JsonKey(name: '4h')
  RsiData? get hour4 => throw _privateConstructorUsedError;
  @JsonKey(name: '1d')
  RsiData? get day1 => throw _privateConstructorUsedError;

  /// Serializes this RsiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RsiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RsiResponseCopyWith<RsiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RsiResponseCopyWith<$Res> {
  factory $RsiResponseCopyWith(
          RsiResponse value, $Res Function(RsiResponse) then) =
      _$RsiResponseCopyWithImpl<$Res, RsiResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: '15m') RsiData? min15,
      @JsonKey(name: '1h') RsiData? hour1,
      @JsonKey(name: '4h') RsiData? hour4,
      @JsonKey(name: '1d') RsiData? day1});

  $RsiDataCopyWith<$Res>? get min15;
  $RsiDataCopyWith<$Res>? get hour1;
  $RsiDataCopyWith<$Res>? get hour4;
  $RsiDataCopyWith<$Res>? get day1;
}

/// @nodoc
class _$RsiResponseCopyWithImpl<$Res, $Val extends RsiResponse>
    implements $RsiResponseCopyWith<$Res> {
  _$RsiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RsiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min15 = freezed,
    Object? hour1 = freezed,
    Object? hour4 = freezed,
    Object? day1 = freezed,
  }) {
    return _then(_value.copyWith(
      min15: freezed == min15
          ? _value.min15
          : min15 // ignore: cast_nullable_to_non_nullable
              as RsiData?,
      hour1: freezed == hour1
          ? _value.hour1
          : hour1 // ignore: cast_nullable_to_non_nullable
              as RsiData?,
      hour4: freezed == hour4
          ? _value.hour4
          : hour4 // ignore: cast_nullable_to_non_nullable
              as RsiData?,
      day1: freezed == day1
          ? _value.day1
          : day1 // ignore: cast_nullable_to_non_nullable
              as RsiData?,
    ) as $Val);
  }

  /// Create a copy of RsiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RsiDataCopyWith<$Res>? get min15 {
    if (_value.min15 == null) {
      return null;
    }

    return $RsiDataCopyWith<$Res>(_value.min15!, (value) {
      return _then(_value.copyWith(min15: value) as $Val);
    });
  }

  /// Create a copy of RsiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RsiDataCopyWith<$Res>? get hour1 {
    if (_value.hour1 == null) {
      return null;
    }

    return $RsiDataCopyWith<$Res>(_value.hour1!, (value) {
      return _then(_value.copyWith(hour1: value) as $Val);
    });
  }

  /// Create a copy of RsiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RsiDataCopyWith<$Res>? get hour4 {
    if (_value.hour4 == null) {
      return null;
    }

    return $RsiDataCopyWith<$Res>(_value.hour4!, (value) {
      return _then(_value.copyWith(hour4: value) as $Val);
    });
  }

  /// Create a copy of RsiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RsiDataCopyWith<$Res>? get day1 {
    if (_value.day1 == null) {
      return null;
    }

    return $RsiDataCopyWith<$Res>(_value.day1!, (value) {
      return _then(_value.copyWith(day1: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RsiResponseImplCopyWith<$Res>
    implements $RsiResponseCopyWith<$Res> {
  factory _$$RsiResponseImplCopyWith(
          _$RsiResponseImpl value, $Res Function(_$RsiResponseImpl) then) =
      __$$RsiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '15m') RsiData? min15,
      @JsonKey(name: '1h') RsiData? hour1,
      @JsonKey(name: '4h') RsiData? hour4,
      @JsonKey(name: '1d') RsiData? day1});

  @override
  $RsiDataCopyWith<$Res>? get min15;
  @override
  $RsiDataCopyWith<$Res>? get hour1;
  @override
  $RsiDataCopyWith<$Res>? get hour4;
  @override
  $RsiDataCopyWith<$Res>? get day1;
}

/// @nodoc
class __$$RsiResponseImplCopyWithImpl<$Res>
    extends _$RsiResponseCopyWithImpl<$Res, _$RsiResponseImpl>
    implements _$$RsiResponseImplCopyWith<$Res> {
  __$$RsiResponseImplCopyWithImpl(
      _$RsiResponseImpl _value, $Res Function(_$RsiResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RsiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min15 = freezed,
    Object? hour1 = freezed,
    Object? hour4 = freezed,
    Object? day1 = freezed,
  }) {
    return _then(_$RsiResponseImpl(
      min15: freezed == min15
          ? _value.min15
          : min15 // ignore: cast_nullable_to_non_nullable
              as RsiData?,
      hour1: freezed == hour1
          ? _value.hour1
          : hour1 // ignore: cast_nullable_to_non_nullable
              as RsiData?,
      hour4: freezed == hour4
          ? _value.hour4
          : hour4 // ignore: cast_nullable_to_non_nullable
              as RsiData?,
      day1: freezed == day1
          ? _value.day1
          : day1 // ignore: cast_nullable_to_non_nullable
              as RsiData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RsiResponseImpl implements _RsiResponse {
  _$RsiResponseImpl(
      {@JsonKey(name: '15m') this.min15,
      @JsonKey(name: '1h') this.hour1,
      @JsonKey(name: '4h') this.hour4,
      @JsonKey(name: '1d') this.day1});

  factory _$RsiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RsiResponseImplFromJson(json);

  @override
  @JsonKey(name: '15m')
  final RsiData? min15;
  @override
  @JsonKey(name: '1h')
  final RsiData? hour1;
  @override
  @JsonKey(name: '4h')
  final RsiData? hour4;
  @override
  @JsonKey(name: '1d')
  final RsiData? day1;

  @override
  String toString() {
    return 'RsiResponse(min15: $min15, hour1: $hour1, hour4: $hour4, day1: $day1)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RsiResponseImpl &&
            (identical(other.min15, min15) || other.min15 == min15) &&
            (identical(other.hour1, hour1) || other.hour1 == hour1) &&
            (identical(other.hour4, hour4) || other.hour4 == hour4) &&
            (identical(other.day1, day1) || other.day1 == day1));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min15, hour1, hour4, day1);

  /// Create a copy of RsiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RsiResponseImplCopyWith<_$RsiResponseImpl> get copyWith =>
      __$$RsiResponseImplCopyWithImpl<_$RsiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RsiResponseImplToJson(
      this,
    );
  }
}

abstract class _RsiResponse implements RsiResponse {
  factory _RsiResponse(
      {@JsonKey(name: '15m') final RsiData? min15,
      @JsonKey(name: '1h') final RsiData? hour1,
      @JsonKey(name: '4h') final RsiData? hour4,
      @JsonKey(name: '1d') final RsiData? day1}) = _$RsiResponseImpl;

  factory _RsiResponse.fromJson(Map<String, dynamic> json) =
      _$RsiResponseImpl.fromJson;

  @override
  @JsonKey(name: '15m')
  RsiData? get min15;
  @override
  @JsonKey(name: '1h')
  RsiData? get hour1;
  @override
  @JsonKey(name: '4h')
  RsiData? get hour4;
  @override
  @JsonKey(name: '1d')
  RsiData? get day1;

  /// Create a copy of RsiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RsiResponseImplCopyWith<_$RsiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DominanceResponse _$DominanceResponseFromJson(Map<String, dynamic> json) {
  return _DominanceResponse.fromJson(json);
}

/// @nodoc
mixin _$DominanceResponse {
  double? get dominance => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this DominanceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DominanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DominanceResponseCopyWith<DominanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DominanceResponseCopyWith<$Res> {
  factory $DominanceResponseCopyWith(
          DominanceResponse value, $Res Function(DominanceResponse) then) =
      _$DominanceResponseCopyWithImpl<$Res, DominanceResponse>;
  @useResult
  $Res call({double? dominance, String? timestamp});
}

/// @nodoc
class _$DominanceResponseCopyWithImpl<$Res, $Val extends DominanceResponse>
    implements $DominanceResponseCopyWith<$Res> {
  _$DominanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DominanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dominance = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      dominance: freezed == dominance
          ? _value.dominance
          : dominance // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DominanceResponseImplCopyWith<$Res>
    implements $DominanceResponseCopyWith<$Res> {
  factory _$$DominanceResponseImplCopyWith(_$DominanceResponseImpl value,
          $Res Function(_$DominanceResponseImpl) then) =
      __$$DominanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? dominance, String? timestamp});
}

/// @nodoc
class __$$DominanceResponseImplCopyWithImpl<$Res>
    extends _$DominanceResponseCopyWithImpl<$Res, _$DominanceResponseImpl>
    implements _$$DominanceResponseImplCopyWith<$Res> {
  __$$DominanceResponseImplCopyWithImpl(_$DominanceResponseImpl _value,
      $Res Function(_$DominanceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DominanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dominance = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$DominanceResponseImpl(
      dominance: freezed == dominance
          ? _value.dominance
          : dominance // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DominanceResponseImpl implements _DominanceResponse {
  _$DominanceResponseImpl({this.dominance, this.timestamp});

  factory _$DominanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DominanceResponseImplFromJson(json);

  @override
  final double? dominance;
  @override
  final String? timestamp;

  @override
  String toString() {
    return 'DominanceResponse(dominance: $dominance, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DominanceResponseImpl &&
            (identical(other.dominance, dominance) ||
                other.dominance == dominance) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dominance, timestamp);

  /// Create a copy of DominanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DominanceResponseImplCopyWith<_$DominanceResponseImpl> get copyWith =>
      __$$DominanceResponseImplCopyWithImpl<_$DominanceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DominanceResponseImplToJson(
      this,
    );
  }
}

abstract class _DominanceResponse implements DominanceResponse {
  factory _DominanceResponse(
      {final double? dominance,
      final String? timestamp}) = _$DominanceResponseImpl;

  factory _DominanceResponse.fromJson(Map<String, dynamic> json) =
      _$DominanceResponseImpl.fromJson;

  @override
  double? get dominance;
  @override
  String? get timestamp;

  /// Create a copy of DominanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DominanceResponseImplCopyWith<_$DominanceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MvrvResponse _$MvrvResponseFromJson(Map<String, dynamic> json) {
  return _MvrvResponse.fromJson(json);
}

/// @nodoc
mixin _$MvrvResponse {
  double? get mvrv => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this MvrvResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MvrvResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MvrvResponseCopyWith<MvrvResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MvrvResponseCopyWith<$Res> {
  factory $MvrvResponseCopyWith(
          MvrvResponse value, $Res Function(MvrvResponse) then) =
      _$MvrvResponseCopyWithImpl<$Res, MvrvResponse>;
  @useResult
  $Res call({double? mvrv, String? timestamp});
}

/// @nodoc
class _$MvrvResponseCopyWithImpl<$Res, $Val extends MvrvResponse>
    implements $MvrvResponseCopyWith<$Res> {
  _$MvrvResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MvrvResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mvrv = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      mvrv: freezed == mvrv
          ? _value.mvrv
          : mvrv // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MvrvResponseImplCopyWith<$Res>
    implements $MvrvResponseCopyWith<$Res> {
  factory _$$MvrvResponseImplCopyWith(
          _$MvrvResponseImpl value, $Res Function(_$MvrvResponseImpl) then) =
      __$$MvrvResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? mvrv, String? timestamp});
}

/// @nodoc
class __$$MvrvResponseImplCopyWithImpl<$Res>
    extends _$MvrvResponseCopyWithImpl<$Res, _$MvrvResponseImpl>
    implements _$$MvrvResponseImplCopyWith<$Res> {
  __$$MvrvResponseImplCopyWithImpl(
      _$MvrvResponseImpl _value, $Res Function(_$MvrvResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MvrvResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mvrv = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$MvrvResponseImpl(
      mvrv: freezed == mvrv
          ? _value.mvrv
          : mvrv // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MvrvResponseImpl implements _MvrvResponse {
  _$MvrvResponseImpl({this.mvrv, this.timestamp});

  factory _$MvrvResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MvrvResponseImplFromJson(json);

  @override
  final double? mvrv;
  @override
  final String? timestamp;

  @override
  String toString() {
    return 'MvrvResponse(mvrv: $mvrv, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MvrvResponseImpl &&
            (identical(other.mvrv, mvrv) || other.mvrv == mvrv) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mvrv, timestamp);

  /// Create a copy of MvrvResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MvrvResponseImplCopyWith<_$MvrvResponseImpl> get copyWith =>
      __$$MvrvResponseImplCopyWithImpl<_$MvrvResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MvrvResponseImplToJson(
      this,
    );
  }
}

abstract class _MvrvResponse implements MvrvResponse {
  factory _MvrvResponse({final double? mvrv, final String? timestamp}) =
      _$MvrvResponseImpl;

  factory _MvrvResponse.fromJson(Map<String, dynamic> json) =
      _$MvrvResponseImpl.fromJson;

  @override
  double? get mvrv;
  @override
  String? get timestamp;

  /// Create a copy of MvrvResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MvrvResponseImplCopyWith<_$MvrvResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
