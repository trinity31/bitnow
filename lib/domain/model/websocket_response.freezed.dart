// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'websocket_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Change24h _$Change24hFromJson(Map<String, dynamic> json) {
  return _Change24h.fromJson(json);
}

/// @nodoc
mixin _$Change24h {
  double? get krw => throw _privateConstructorUsedError;
  double? get usd => throw _privateConstructorUsedError;

  /// Serializes this Change24h to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Change24h
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Change24hCopyWith<Change24h> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Change24hCopyWith<$Res> {
  factory $Change24hCopyWith(Change24h value, $Res Function(Change24h) then) =
      _$Change24hCopyWithImpl<$Res, Change24h>;
  @useResult
  $Res call({double? krw, double? usd});
}

/// @nodoc
class _$Change24hCopyWithImpl<$Res, $Val extends Change24h>
    implements $Change24hCopyWith<$Res> {
  _$Change24hCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Change24h
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? krw = freezed,
    Object? usd = freezed,
  }) {
    return _then(_value.copyWith(
      krw: freezed == krw
          ? _value.krw
          : krw // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: freezed == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Change24hImplCopyWith<$Res>
    implements $Change24hCopyWith<$Res> {
  factory _$$Change24hImplCopyWith(
          _$Change24hImpl value, $Res Function(_$Change24hImpl) then) =
      __$$Change24hImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? krw, double? usd});
}

/// @nodoc
class __$$Change24hImplCopyWithImpl<$Res>
    extends _$Change24hCopyWithImpl<$Res, _$Change24hImpl>
    implements _$$Change24hImplCopyWith<$Res> {
  __$$Change24hImplCopyWithImpl(
      _$Change24hImpl _value, $Res Function(_$Change24hImpl) _then)
      : super(_value, _then);

  /// Create a copy of Change24h
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? krw = freezed,
    Object? usd = freezed,
  }) {
    return _then(_$Change24hImpl(
      krw: freezed == krw
          ? _value.krw
          : krw // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: freezed == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Change24hImpl implements _Change24h {
  _$Change24hImpl({this.krw, this.usd});

  factory _$Change24hImpl.fromJson(Map<String, dynamic> json) =>
      _$$Change24hImplFromJson(json);

  @override
  final double? krw;
  @override
  final double? usd;

  @override
  String toString() {
    return 'Change24h(krw: $krw, usd: $usd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Change24hImpl &&
            (identical(other.krw, krw) || other.krw == krw) &&
            (identical(other.usd, usd) || other.usd == usd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, krw, usd);

  /// Create a copy of Change24h
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Change24hImplCopyWith<_$Change24hImpl> get copyWith =>
      __$$Change24hImplCopyWithImpl<_$Change24hImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Change24hImplToJson(
      this,
    );
  }
}

abstract class _Change24h implements Change24h {
  factory _Change24h({final double? krw, final double? usd}) = _$Change24hImpl;

  factory _Change24h.fromJson(Map<String, dynamic> json) =
      _$Change24hImpl.fromJson;

  @override
  double? get krw;
  @override
  double? get usd;

  /// Create a copy of Change24h
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Change24hImplCopyWith<_$Change24hImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WebSocketRsi _$WebSocketRsiFromJson(Map<String, dynamic> json) {
  return _WebSocketRsi.fromJson(json);
}

/// @nodoc
mixin _$WebSocketRsi {
  @JsonKey(name: '15m')
  double? get min15 => throw _privateConstructorUsedError;
  @JsonKey(name: '1h')
  double? get hour1 => throw _privateConstructorUsedError;
  @JsonKey(name: '4h')
  double? get hour4 => throw _privateConstructorUsedError;
  @JsonKey(name: '1d')
  double? get day1 => throw _privateConstructorUsedError;

  /// Serializes this WebSocketRsi to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WebSocketRsi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebSocketRsiCopyWith<WebSocketRsi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketRsiCopyWith<$Res> {
  factory $WebSocketRsiCopyWith(
          WebSocketRsi value, $Res Function(WebSocketRsi) then) =
      _$WebSocketRsiCopyWithImpl<$Res, WebSocketRsi>;
  @useResult
  $Res call(
      {@JsonKey(name: '15m') double? min15,
      @JsonKey(name: '1h') double? hour1,
      @JsonKey(name: '4h') double? hour4,
      @JsonKey(name: '1d') double? day1});
}

/// @nodoc
class _$WebSocketRsiCopyWithImpl<$Res, $Val extends WebSocketRsi>
    implements $WebSocketRsiCopyWith<$Res> {
  _$WebSocketRsiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebSocketRsi
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
              as double?,
      hour1: freezed == hour1
          ? _value.hour1
          : hour1 // ignore: cast_nullable_to_non_nullable
              as double?,
      hour4: freezed == hour4
          ? _value.hour4
          : hour4 // ignore: cast_nullable_to_non_nullable
              as double?,
      day1: freezed == day1
          ? _value.day1
          : day1 // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebSocketRsiImplCopyWith<$Res>
    implements $WebSocketRsiCopyWith<$Res> {
  factory _$$WebSocketRsiImplCopyWith(
          _$WebSocketRsiImpl value, $Res Function(_$WebSocketRsiImpl) then) =
      __$$WebSocketRsiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '15m') double? min15,
      @JsonKey(name: '1h') double? hour1,
      @JsonKey(name: '4h') double? hour4,
      @JsonKey(name: '1d') double? day1});
}

/// @nodoc
class __$$WebSocketRsiImplCopyWithImpl<$Res>
    extends _$WebSocketRsiCopyWithImpl<$Res, _$WebSocketRsiImpl>
    implements _$$WebSocketRsiImplCopyWith<$Res> {
  __$$WebSocketRsiImplCopyWithImpl(
      _$WebSocketRsiImpl _value, $Res Function(_$WebSocketRsiImpl) _then)
      : super(_value, _then);

  /// Create a copy of WebSocketRsi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min15 = freezed,
    Object? hour1 = freezed,
    Object? hour4 = freezed,
    Object? day1 = freezed,
  }) {
    return _then(_$WebSocketRsiImpl(
      min15: freezed == min15
          ? _value.min15
          : min15 // ignore: cast_nullable_to_non_nullable
              as double?,
      hour1: freezed == hour1
          ? _value.hour1
          : hour1 // ignore: cast_nullable_to_non_nullable
              as double?,
      hour4: freezed == hour4
          ? _value.hour4
          : hour4 // ignore: cast_nullable_to_non_nullable
              as double?,
      day1: freezed == day1
          ? _value.day1
          : day1 // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WebSocketRsiImpl implements _WebSocketRsi {
  _$WebSocketRsiImpl(
      {@JsonKey(name: '15m') this.min15,
      @JsonKey(name: '1h') this.hour1,
      @JsonKey(name: '4h') this.hour4,
      @JsonKey(name: '1d') this.day1});

  factory _$WebSocketRsiImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebSocketRsiImplFromJson(json);

  @override
  @JsonKey(name: '15m')
  final double? min15;
  @override
  @JsonKey(name: '1h')
  final double? hour1;
  @override
  @JsonKey(name: '4h')
  final double? hour4;
  @override
  @JsonKey(name: '1d')
  final double? day1;

  @override
  String toString() {
    return 'WebSocketRsi(min15: $min15, hour1: $hour1, hour4: $hour4, day1: $day1)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebSocketRsiImpl &&
            (identical(other.min15, min15) || other.min15 == min15) &&
            (identical(other.hour1, hour1) || other.hour1 == hour1) &&
            (identical(other.hour4, hour4) || other.hour4 == hour4) &&
            (identical(other.day1, day1) || other.day1 == day1));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min15, hour1, hour4, day1);

  /// Create a copy of WebSocketRsi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebSocketRsiImplCopyWith<_$WebSocketRsiImpl> get copyWith =>
      __$$WebSocketRsiImplCopyWithImpl<_$WebSocketRsiImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WebSocketRsiImplToJson(
      this,
    );
  }
}

abstract class _WebSocketRsi implements WebSocketRsi {
  factory _WebSocketRsi(
      {@JsonKey(name: '15m') final double? min15,
      @JsonKey(name: '1h') final double? hour1,
      @JsonKey(name: '4h') final double? hour4,
      @JsonKey(name: '1d') final double? day1}) = _$WebSocketRsiImpl;

  factory _WebSocketRsi.fromJson(Map<String, dynamic> json) =
      _$WebSocketRsiImpl.fromJson;

  @override
  @JsonKey(name: '15m')
  double? get min15;
  @override
  @JsonKey(name: '1h')
  double? get hour1;
  @override
  @JsonKey(name: '4h')
  double? get hour4;
  @override
  @JsonKey(name: '1d')
  double? get day1;

  /// Create a copy of WebSocketRsi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebSocketRsiImplCopyWith<_$WebSocketRsiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WebSocketResponse _$WebSocketResponseFromJson(Map<String, dynamic> json) {
  return _WebSocketResponse.fromJson(json);
}

/// @nodoc
mixin _$WebSocketResponse {
  double? get krw => throw _privateConstructorUsedError;
  double? get usd => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'kimchi_premium')
  double? get kimchiPremium => throw _privateConstructorUsedError;
  @JsonKey(name: 'change_24h')
  Change24h? get change24h => throw _privateConstructorUsedError;
  WebSocketRsi? get rsi => throw _privateConstructorUsedError;
  double? get mvrv => throw _privateConstructorUsedError;
  double? get dominance => throw _privateConstructorUsedError;

  /// Serializes this WebSocketResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WebSocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebSocketResponseCopyWith<WebSocketResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketResponseCopyWith<$Res> {
  factory $WebSocketResponseCopyWith(
          WebSocketResponse value, $Res Function(WebSocketResponse) then) =
      _$WebSocketResponseCopyWithImpl<$Res, WebSocketResponse>;
  @useResult
  $Res call(
      {double? krw,
      double? usd,
      String? timestamp,
      @JsonKey(name: 'kimchi_premium') double? kimchiPremium,
      @JsonKey(name: 'change_24h') Change24h? change24h,
      WebSocketRsi? rsi,
      double? mvrv,
      double? dominance});

  $Change24hCopyWith<$Res>? get change24h;
  $WebSocketRsiCopyWith<$Res>? get rsi;
}

/// @nodoc
class _$WebSocketResponseCopyWithImpl<$Res, $Val extends WebSocketResponse>
    implements $WebSocketResponseCopyWith<$Res> {
  _$WebSocketResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebSocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? krw = freezed,
    Object? usd = freezed,
    Object? timestamp = freezed,
    Object? kimchiPremium = freezed,
    Object? change24h = freezed,
    Object? rsi = freezed,
    Object? mvrv = freezed,
    Object? dominance = freezed,
  }) {
    return _then(_value.copyWith(
      krw: freezed == krw
          ? _value.krw
          : krw // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: freezed == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      kimchiPremium: freezed == kimchiPremium
          ? _value.kimchiPremium
          : kimchiPremium // ignore: cast_nullable_to_non_nullable
              as double?,
      change24h: freezed == change24h
          ? _value.change24h
          : change24h // ignore: cast_nullable_to_non_nullable
              as Change24h?,
      rsi: freezed == rsi
          ? _value.rsi
          : rsi // ignore: cast_nullable_to_non_nullable
              as WebSocketRsi?,
      mvrv: freezed == mvrv
          ? _value.mvrv
          : mvrv // ignore: cast_nullable_to_non_nullable
              as double?,
      dominance: freezed == dominance
          ? _value.dominance
          : dominance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of WebSocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Change24hCopyWith<$Res>? get change24h {
    if (_value.change24h == null) {
      return null;
    }

    return $Change24hCopyWith<$Res>(_value.change24h!, (value) {
      return _then(_value.copyWith(change24h: value) as $Val);
    });
  }

  /// Create a copy of WebSocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WebSocketRsiCopyWith<$Res>? get rsi {
    if (_value.rsi == null) {
      return null;
    }

    return $WebSocketRsiCopyWith<$Res>(_value.rsi!, (value) {
      return _then(_value.copyWith(rsi: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WebSocketResponseImplCopyWith<$Res>
    implements $WebSocketResponseCopyWith<$Res> {
  factory _$$WebSocketResponseImplCopyWith(_$WebSocketResponseImpl value,
          $Res Function(_$WebSocketResponseImpl) then) =
      __$$WebSocketResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? krw,
      double? usd,
      String? timestamp,
      @JsonKey(name: 'kimchi_premium') double? kimchiPremium,
      @JsonKey(name: 'change_24h') Change24h? change24h,
      WebSocketRsi? rsi,
      double? mvrv,
      double? dominance});

  @override
  $Change24hCopyWith<$Res>? get change24h;
  @override
  $WebSocketRsiCopyWith<$Res>? get rsi;
}

/// @nodoc
class __$$WebSocketResponseImplCopyWithImpl<$Res>
    extends _$WebSocketResponseCopyWithImpl<$Res, _$WebSocketResponseImpl>
    implements _$$WebSocketResponseImplCopyWith<$Res> {
  __$$WebSocketResponseImplCopyWithImpl(_$WebSocketResponseImpl _value,
      $Res Function(_$WebSocketResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WebSocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? krw = freezed,
    Object? usd = freezed,
    Object? timestamp = freezed,
    Object? kimchiPremium = freezed,
    Object? change24h = freezed,
    Object? rsi = freezed,
    Object? mvrv = freezed,
    Object? dominance = freezed,
  }) {
    return _then(_$WebSocketResponseImpl(
      krw: freezed == krw
          ? _value.krw
          : krw // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: freezed == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      kimchiPremium: freezed == kimchiPremium
          ? _value.kimchiPremium
          : kimchiPremium // ignore: cast_nullable_to_non_nullable
              as double?,
      change24h: freezed == change24h
          ? _value.change24h
          : change24h // ignore: cast_nullable_to_non_nullable
              as Change24h?,
      rsi: freezed == rsi
          ? _value.rsi
          : rsi // ignore: cast_nullable_to_non_nullable
              as WebSocketRsi?,
      mvrv: freezed == mvrv
          ? _value.mvrv
          : mvrv // ignore: cast_nullable_to_non_nullable
              as double?,
      dominance: freezed == dominance
          ? _value.dominance
          : dominance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WebSocketResponseImpl implements _WebSocketResponse {
  _$WebSocketResponseImpl(
      {this.krw,
      this.usd,
      this.timestamp,
      @JsonKey(name: 'kimchi_premium') this.kimchiPremium,
      @JsonKey(name: 'change_24h') this.change24h,
      this.rsi,
      this.mvrv,
      this.dominance});

  factory _$WebSocketResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebSocketResponseImplFromJson(json);

  @override
  final double? krw;
  @override
  final double? usd;
  @override
  final String? timestamp;
  @override
  @JsonKey(name: 'kimchi_premium')
  final double? kimchiPremium;
  @override
  @JsonKey(name: 'change_24h')
  final Change24h? change24h;
  @override
  final WebSocketRsi? rsi;
  @override
  final double? mvrv;
  @override
  final double? dominance;

  @override
  String toString() {
    return 'WebSocketResponse(krw: $krw, usd: $usd, timestamp: $timestamp, kimchiPremium: $kimchiPremium, change24h: $change24h, rsi: $rsi, mvrv: $mvrv, dominance: $dominance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebSocketResponseImpl &&
            (identical(other.krw, krw) || other.krw == krw) &&
            (identical(other.usd, usd) || other.usd == usd) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.kimchiPremium, kimchiPremium) ||
                other.kimchiPremium == kimchiPremium) &&
            (identical(other.change24h, change24h) ||
                other.change24h == change24h) &&
            (identical(other.rsi, rsi) || other.rsi == rsi) &&
            (identical(other.mvrv, mvrv) || other.mvrv == mvrv) &&
            (identical(other.dominance, dominance) ||
                other.dominance == dominance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, krw, usd, timestamp,
      kimchiPremium, change24h, rsi, mvrv, dominance);

  /// Create a copy of WebSocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebSocketResponseImplCopyWith<_$WebSocketResponseImpl> get copyWith =>
      __$$WebSocketResponseImplCopyWithImpl<_$WebSocketResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WebSocketResponseImplToJson(
      this,
    );
  }
}

abstract class _WebSocketResponse implements WebSocketResponse {
  factory _WebSocketResponse(
      {final double? krw,
      final double? usd,
      final String? timestamp,
      @JsonKey(name: 'kimchi_premium') final double? kimchiPremium,
      @JsonKey(name: 'change_24h') final Change24h? change24h,
      final WebSocketRsi? rsi,
      final double? mvrv,
      final double? dominance}) = _$WebSocketResponseImpl;

  factory _WebSocketResponse.fromJson(Map<String, dynamic> json) =
      _$WebSocketResponseImpl.fromJson;

  @override
  double? get krw;
  @override
  double? get usd;
  @override
  String? get timestamp;
  @override
  @JsonKey(name: 'kimchi_premium')
  double? get kimchiPremium;
  @override
  @JsonKey(name: 'change_24h')
  Change24h? get change24h;
  @override
  WebSocketRsi? get rsi;
  @override
  double? get mvrv;
  @override
  double? get dominance;

  /// Create a copy of WebSocketResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebSocketResponseImplCopyWith<_$WebSocketResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
