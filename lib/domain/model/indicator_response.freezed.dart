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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rsi, signal);

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, min15, hour1, hour4, day1);

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dominance, timestamp);

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mvrv, timestamp);

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
  _$$MvrvResponseImplCopyWith<_$MvrvResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MAValue _$MAValueFromJson(Map<String, dynamic> json) {
  return _MAValue.fromJson(json);
}

/// @nodoc
mixin _$MAValue {
  @JsonKey(name: 'ma_value')
  double? get maValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'threshold_up')
  double? get thresholdUp => throw _privateConstructorUsedError;
  @JsonKey(name: 'threshold_down')
  double? get thresholdDown => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmed_up')
  bool? get confirmedUp => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmed_down')
  bool? get confirmedDown => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MAValueCopyWith<MAValue> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MAValueCopyWith<$Res> {
  factory $MAValueCopyWith(MAValue value, $Res Function(MAValue) then) =
      _$MAValueCopyWithImpl<$Res, MAValue>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ma_value') double? maValue,
      @JsonKey(name: 'threshold_up') double? thresholdUp,
      @JsonKey(name: 'threshold_down') double? thresholdDown,
      @JsonKey(name: 'confirmed_up') bool? confirmedUp,
      @JsonKey(name: 'confirmed_down') bool? confirmedDown});
}

/// @nodoc
class _$MAValueCopyWithImpl<$Res, $Val extends MAValue>
    implements $MAValueCopyWith<$Res> {
  _$MAValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maValue = freezed,
    Object? thresholdUp = freezed,
    Object? thresholdDown = freezed,
    Object? confirmedUp = freezed,
    Object? confirmedDown = freezed,
  }) {
    return _then(_value.copyWith(
      maValue: freezed == maValue
          ? _value.maValue
          : maValue // ignore: cast_nullable_to_non_nullable
              as double?,
      thresholdUp: freezed == thresholdUp
          ? _value.thresholdUp
          : thresholdUp // ignore: cast_nullable_to_non_nullable
              as double?,
      thresholdDown: freezed == thresholdDown
          ? _value.thresholdDown
          : thresholdDown // ignore: cast_nullable_to_non_nullable
              as double?,
      confirmedUp: freezed == confirmedUp
          ? _value.confirmedUp
          : confirmedUp // ignore: cast_nullable_to_non_nullable
              as bool?,
      confirmedDown: freezed == confirmedDown
          ? _value.confirmedDown
          : confirmedDown // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MAValueImplCopyWith<$Res> implements $MAValueCopyWith<$Res> {
  factory _$$MAValueImplCopyWith(
          _$MAValueImpl value, $Res Function(_$MAValueImpl) then) =
      __$$MAValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ma_value') double? maValue,
      @JsonKey(name: 'threshold_up') double? thresholdUp,
      @JsonKey(name: 'threshold_down') double? thresholdDown,
      @JsonKey(name: 'confirmed_up') bool? confirmedUp,
      @JsonKey(name: 'confirmed_down') bool? confirmedDown});
}

/// @nodoc
class __$$MAValueImplCopyWithImpl<$Res>
    extends _$MAValueCopyWithImpl<$Res, _$MAValueImpl>
    implements _$$MAValueImplCopyWith<$Res> {
  __$$MAValueImplCopyWithImpl(
      _$MAValueImpl _value, $Res Function(_$MAValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maValue = freezed,
    Object? thresholdUp = freezed,
    Object? thresholdDown = freezed,
    Object? confirmedUp = freezed,
    Object? confirmedDown = freezed,
  }) {
    return _then(_$MAValueImpl(
      maValue: freezed == maValue
          ? _value.maValue
          : maValue // ignore: cast_nullable_to_non_nullable
              as double?,
      thresholdUp: freezed == thresholdUp
          ? _value.thresholdUp
          : thresholdUp // ignore: cast_nullable_to_non_nullable
              as double?,
      thresholdDown: freezed == thresholdDown
          ? _value.thresholdDown
          : thresholdDown // ignore: cast_nullable_to_non_nullable
              as double?,
      confirmedUp: freezed == confirmedUp
          ? _value.confirmedUp
          : confirmedUp // ignore: cast_nullable_to_non_nullable
              as bool?,
      confirmedDown: freezed == confirmedDown
          ? _value.confirmedDown
          : confirmedDown // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MAValueImpl implements _MAValue {
  _$MAValueImpl(
      {@JsonKey(name: 'ma_value') this.maValue,
      @JsonKey(name: 'threshold_up') this.thresholdUp,
      @JsonKey(name: 'threshold_down') this.thresholdDown,
      @JsonKey(name: 'confirmed_up') this.confirmedUp,
      @JsonKey(name: 'confirmed_down') this.confirmedDown});

  factory _$MAValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$MAValueImplFromJson(json);

  @override
  @JsonKey(name: 'ma_value')
  final double? maValue;
  @override
  @JsonKey(name: 'threshold_up')
  final double? thresholdUp;
  @override
  @JsonKey(name: 'threshold_down')
  final double? thresholdDown;
  @override
  @JsonKey(name: 'confirmed_up')
  final bool? confirmedUp;
  @override
  @JsonKey(name: 'confirmed_down')
  final bool? confirmedDown;

  @override
  String toString() {
    return 'MAValue(maValue: $maValue, thresholdUp: $thresholdUp, thresholdDown: $thresholdDown, confirmedUp: $confirmedUp, confirmedDown: $confirmedDown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MAValueImpl &&
            (identical(other.maValue, maValue) || other.maValue == maValue) &&
            (identical(other.thresholdUp, thresholdUp) ||
                other.thresholdUp == thresholdUp) &&
            (identical(other.thresholdDown, thresholdDown) ||
                other.thresholdDown == thresholdDown) &&
            (identical(other.confirmedUp, confirmedUp) ||
                other.confirmedUp == confirmedUp) &&
            (identical(other.confirmedDown, confirmedDown) ||
                other.confirmedDown == confirmedDown));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, maValue, thresholdUp,
      thresholdDown, confirmedUp, confirmedDown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MAValueImplCopyWith<_$MAValueImpl> get copyWith =>
      __$$MAValueImplCopyWithImpl<_$MAValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MAValueImplToJson(
      this,
    );
  }
}

abstract class _MAValue implements MAValue {
  factory _MAValue(
          {@JsonKey(name: 'ma_value') final double? maValue,
          @JsonKey(name: 'threshold_up') final double? thresholdUp,
          @JsonKey(name: 'threshold_down') final double? thresholdDown,
          @JsonKey(name: 'confirmed_up') final bool? confirmedUp,
          @JsonKey(name: 'confirmed_down') final bool? confirmedDown}) =
      _$MAValueImpl;

  factory _MAValue.fromJson(Map<String, dynamic> json) = _$MAValueImpl.fromJson;

  @override
  @JsonKey(name: 'ma_value')
  double? get maValue;
  @override
  @JsonKey(name: 'threshold_up')
  double? get thresholdUp;
  @override
  @JsonKey(name: 'threshold_down')
  double? get thresholdDown;
  @override
  @JsonKey(name: 'confirmed_up')
  bool? get confirmedUp;
  @override
  @JsonKey(name: 'confirmed_down')
  bool? get confirmedDown;
  @override
  @JsonKey(ignore: true)
  _$$MAValueImplCopyWith<_$MAValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarketDiagnosis _$MarketDiagnosisFromJson(Map<String, dynamic> json) {
  return _MarketDiagnosis.fromJson(json);
}

/// @nodoc
mixin _$MarketDiagnosis {
  String? get trend => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketDiagnosisCopyWith<MarketDiagnosis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketDiagnosisCopyWith<$Res> {
  factory $MarketDiagnosisCopyWith(
          MarketDiagnosis value, $Res Function(MarketDiagnosis) then) =
      _$MarketDiagnosisCopyWithImpl<$Res, MarketDiagnosis>;
  @useResult
  $Res call({String? trend, String? description});
}

/// @nodoc
class _$MarketDiagnosisCopyWithImpl<$Res, $Val extends MarketDiagnosis>
    implements $MarketDiagnosisCopyWith<$Res> {
  _$MarketDiagnosisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trend = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketDiagnosisImplCopyWith<$Res>
    implements $MarketDiagnosisCopyWith<$Res> {
  factory _$$MarketDiagnosisImplCopyWith(_$MarketDiagnosisImpl value,
          $Res Function(_$MarketDiagnosisImpl) then) =
      __$$MarketDiagnosisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? trend, String? description});
}

/// @nodoc
class __$$MarketDiagnosisImplCopyWithImpl<$Res>
    extends _$MarketDiagnosisCopyWithImpl<$Res, _$MarketDiagnosisImpl>
    implements _$$MarketDiagnosisImplCopyWith<$Res> {
  __$$MarketDiagnosisImplCopyWithImpl(
      _$MarketDiagnosisImpl _value, $Res Function(_$MarketDiagnosisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trend = freezed,
    Object? description = freezed,
  }) {
    return _then(_$MarketDiagnosisImpl(
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketDiagnosisImpl implements _MarketDiagnosis {
  _$MarketDiagnosisImpl({this.trend, this.description});

  factory _$MarketDiagnosisImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketDiagnosisImplFromJson(json);

  @override
  final String? trend;
  @override
  final String? description;

  @override
  String toString() {
    return 'MarketDiagnosis(trend: $trend, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketDiagnosisImpl &&
            (identical(other.trend, trend) || other.trend == trend) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, trend, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketDiagnosisImplCopyWith<_$MarketDiagnosisImpl> get copyWith =>
      __$$MarketDiagnosisImplCopyWithImpl<_$MarketDiagnosisImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketDiagnosisImplToJson(
      this,
    );
  }
}

abstract class _MarketDiagnosis implements MarketDiagnosis {
  factory _MarketDiagnosis({final String? trend, final String? description}) =
      _$MarketDiagnosisImpl;

  factory _MarketDiagnosis.fromJson(Map<String, dynamic> json) =
      _$MarketDiagnosisImpl.fromJson;

  @override
  String? get trend;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$MarketDiagnosisImplCopyWith<_$MarketDiagnosisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MACrossResponse _$MACrossResponseFromJson(Map<String, dynamic> json) {
  return _MACrossResponse.fromJson(json);
}

/// @nodoc
mixin _$MACrossResponse {
  double? get price => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'ma_results')
  Map<String, dynamic>? get maResults => throw _privateConstructorUsedError;
  @JsonKey(name: 'market_diagnosis')
  MarketDiagnosis? get marketDiagnosis => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MACrossResponseCopyWith<MACrossResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MACrossResponseCopyWith<$Res> {
  factory $MACrossResponseCopyWith(
          MACrossResponse value, $Res Function(MACrossResponse) then) =
      _$MACrossResponseCopyWithImpl<$Res, MACrossResponse>;
  @useResult
  $Res call(
      {double? price,
      int? timestamp,
      @JsonKey(name: 'ma_results') Map<String, dynamic>? maResults,
      @JsonKey(name: 'market_diagnosis') MarketDiagnosis? marketDiagnosis});

  $MarketDiagnosisCopyWith<$Res>? get marketDiagnosis;
}

/// @nodoc
class _$MACrossResponseCopyWithImpl<$Res, $Val extends MACrossResponse>
    implements $MACrossResponseCopyWith<$Res> {
  _$MACrossResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? timestamp = freezed,
    Object? maResults = freezed,
    Object? marketDiagnosis = freezed,
  }) {
    return _then(_value.copyWith(
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      maResults: freezed == maResults
          ? _value.maResults
          : maResults // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      marketDiagnosis: freezed == marketDiagnosis
          ? _value.marketDiagnosis
          : marketDiagnosis // ignore: cast_nullable_to_non_nullable
              as MarketDiagnosis?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MarketDiagnosisCopyWith<$Res>? get marketDiagnosis {
    if (_value.marketDiagnosis == null) {
      return null;
    }

    return $MarketDiagnosisCopyWith<$Res>(_value.marketDiagnosis!, (value) {
      return _then(_value.copyWith(marketDiagnosis: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MACrossResponseImplCopyWith<$Res>
    implements $MACrossResponseCopyWith<$Res> {
  factory _$$MACrossResponseImplCopyWith(_$MACrossResponseImpl value,
          $Res Function(_$MACrossResponseImpl) then) =
      __$$MACrossResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? price,
      int? timestamp,
      @JsonKey(name: 'ma_results') Map<String, dynamic>? maResults,
      @JsonKey(name: 'market_diagnosis') MarketDiagnosis? marketDiagnosis});

  @override
  $MarketDiagnosisCopyWith<$Res>? get marketDiagnosis;
}

/// @nodoc
class __$$MACrossResponseImplCopyWithImpl<$Res>
    extends _$MACrossResponseCopyWithImpl<$Res, _$MACrossResponseImpl>
    implements _$$MACrossResponseImplCopyWith<$Res> {
  __$$MACrossResponseImplCopyWithImpl(
      _$MACrossResponseImpl _value, $Res Function(_$MACrossResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? timestamp = freezed,
    Object? maResults = freezed,
    Object? marketDiagnosis = freezed,
  }) {
    return _then(_$MACrossResponseImpl(
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      maResults: freezed == maResults
          ? _value._maResults
          : maResults // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      marketDiagnosis: freezed == marketDiagnosis
          ? _value.marketDiagnosis
          : marketDiagnosis // ignore: cast_nullable_to_non_nullable
              as MarketDiagnosis?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MACrossResponseImpl implements _MACrossResponse {
  _$MACrossResponseImpl(
      {this.price,
      this.timestamp,
      @JsonKey(name: 'ma_results') final Map<String, dynamic>? maResults,
      @JsonKey(name: 'market_diagnosis') this.marketDiagnosis})
      : _maResults = maResults;

  factory _$MACrossResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MACrossResponseImplFromJson(json);

  @override
  final double? price;
  @override
  final int? timestamp;
  final Map<String, dynamic>? _maResults;
  @override
  @JsonKey(name: 'ma_results')
  Map<String, dynamic>? get maResults {
    final value = _maResults;
    if (value == null) return null;
    if (_maResults is EqualUnmodifiableMapView) return _maResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'market_diagnosis')
  final MarketDiagnosis? marketDiagnosis;

  @override
  String toString() {
    return 'MACrossResponse(price: $price, timestamp: $timestamp, maResults: $maResults, marketDiagnosis: $marketDiagnosis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MACrossResponseImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._maResults, _maResults) &&
            (identical(other.marketDiagnosis, marketDiagnosis) ||
                other.marketDiagnosis == marketDiagnosis));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, price, timestamp,
      const DeepCollectionEquality().hash(_maResults), marketDiagnosis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MACrossResponseImplCopyWith<_$MACrossResponseImpl> get copyWith =>
      __$$MACrossResponseImplCopyWithImpl<_$MACrossResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MACrossResponseImplToJson(
      this,
    );
  }
}

abstract class _MACrossResponse implements MACrossResponse {
  factory _MACrossResponse(
      {final double? price,
      final int? timestamp,
      @JsonKey(name: 'ma_results') final Map<String, dynamic>? maResults,
      @JsonKey(name: 'market_diagnosis')
      final MarketDiagnosis? marketDiagnosis}) = _$MACrossResponseImpl;

  factory _MACrossResponse.fromJson(Map<String, dynamic> json) =
      _$MACrossResponseImpl.fromJson;

  @override
  double? get price;
  @override
  int? get timestamp;
  @override
  @JsonKey(name: 'ma_results')
  Map<String, dynamic>? get maResults;
  @override
  @JsonKey(name: 'market_diagnosis')
  MarketDiagnosis? get marketDiagnosis;
  @override
  @JsonKey(ignore: true)
  _$$MACrossResponseImplCopyWith<_$MACrossResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FearGreedResponse _$FearGreedResponseFromJson(Map<String, dynamic> json) {
  return _FearGreedResponse.fromJson(json);
}

/// @nodoc
mixin _$FearGreedResponse {
  int? get value => throw _privateConstructorUsedError;
  String? get classification => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FearGreedResponseCopyWith<FearGreedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FearGreedResponseCopyWith<$Res> {
  factory $FearGreedResponseCopyWith(
          FearGreedResponse value, $Res Function(FearGreedResponse) then) =
      _$FearGreedResponseCopyWithImpl<$Res, FearGreedResponse>;
  @useResult
  $Res call({int? value, String? classification});
}

/// @nodoc
class _$FearGreedResponseCopyWithImpl<$Res, $Val extends FearGreedResponse>
    implements $FearGreedResponseCopyWith<$Res> {
  _$FearGreedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? classification = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      classification: freezed == classification
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FearGreedResponseImplCopyWith<$Res>
    implements $FearGreedResponseCopyWith<$Res> {
  factory _$$FearGreedResponseImplCopyWith(_$FearGreedResponseImpl value,
          $Res Function(_$FearGreedResponseImpl) then) =
      __$$FearGreedResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? value, String? classification});
}

/// @nodoc
class __$$FearGreedResponseImplCopyWithImpl<$Res>
    extends _$FearGreedResponseCopyWithImpl<$Res, _$FearGreedResponseImpl>
    implements _$$FearGreedResponseImplCopyWith<$Res> {
  __$$FearGreedResponseImplCopyWithImpl(_$FearGreedResponseImpl _value,
      $Res Function(_$FearGreedResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? classification = freezed,
  }) {
    return _then(_$FearGreedResponseImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      classification: freezed == classification
          ? _value.classification
          : classification // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FearGreedResponseImpl implements _FearGreedResponse {
  _$FearGreedResponseImpl({this.value, this.classification});

  factory _$FearGreedResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FearGreedResponseImplFromJson(json);

  @override
  final int? value;
  @override
  final String? classification;

  @override
  String toString() {
    return 'FearGreedResponse(value: $value, classification: $classification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FearGreedResponseImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.classification, classification) ||
                other.classification == classification));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, classification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FearGreedResponseImplCopyWith<_$FearGreedResponseImpl> get copyWith =>
      __$$FearGreedResponseImplCopyWithImpl<_$FearGreedResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FearGreedResponseImplToJson(
      this,
    );
  }
}

abstract class _FearGreedResponse implements FearGreedResponse {
  factory _FearGreedResponse({final int? value, final String? classification}) =
      _$FearGreedResponseImpl;

  factory _FearGreedResponse.fromJson(Map<String, dynamic> json) =
      _$FearGreedResponseImpl.fromJson;

  @override
  int? get value;
  @override
  String? get classification;
  @override
  @JsonKey(ignore: true)
  _$$FearGreedResponseImplCopyWith<_$FearGreedResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
