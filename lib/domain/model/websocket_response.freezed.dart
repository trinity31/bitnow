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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, krw, usd);

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, min15, hour1, hour4, day1);

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
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
  double? get dominance => throw _privateConstructorUsedError;
  @JsonKey(name: 'high_3w')
  High3w? get high3w => throw _privateConstructorUsedError;
  Volume? get volume => throw _privateConstructorUsedError;
  @JsonKey(name: 'eth_btc_ratio')
  double? get ethBtcRatio => throw _privateConstructorUsedError;
  @JsonKey(name: 'stablecoin_inflow_ratio')
  double? get stablecoinInflowRatio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      double? dominance,
      @JsonKey(name: 'high_3w') High3w? high3w,
      Volume? volume,
      @JsonKey(name: 'eth_btc_ratio') double? ethBtcRatio,
      @JsonKey(name: 'stablecoin_inflow_ratio') double? stablecoinInflowRatio});

  $Change24hCopyWith<$Res>? get change24h;
  $WebSocketRsiCopyWith<$Res>? get rsi;
  $High3wCopyWith<$Res>? get high3w;
  $VolumeCopyWith<$Res>? get volume;
}

/// @nodoc
class _$WebSocketResponseCopyWithImpl<$Res, $Val extends WebSocketResponse>
    implements $WebSocketResponseCopyWith<$Res> {
  _$WebSocketResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? krw = freezed,
    Object? usd = freezed,
    Object? timestamp = freezed,
    Object? kimchiPremium = freezed,
    Object? change24h = freezed,
    Object? rsi = freezed,
    Object? dominance = freezed,
    Object? high3w = freezed,
    Object? volume = freezed,
    Object? ethBtcRatio = freezed,
    Object? stablecoinInflowRatio = freezed,
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
      dominance: freezed == dominance
          ? _value.dominance
          : dominance // ignore: cast_nullable_to_non_nullable
              as double?,
      high3w: freezed == high3w
          ? _value.high3w
          : high3w // ignore: cast_nullable_to_non_nullable
              as High3w?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as Volume?,
      ethBtcRatio: freezed == ethBtcRatio
          ? _value.ethBtcRatio
          : ethBtcRatio // ignore: cast_nullable_to_non_nullable
              as double?,
      stablecoinInflowRatio: freezed == stablecoinInflowRatio
          ? _value.stablecoinInflowRatio
          : stablecoinInflowRatio // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

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

  @override
  @pragma('vm:prefer-inline')
  $High3wCopyWith<$Res>? get high3w {
    if (_value.high3w == null) {
      return null;
    }

    return $High3wCopyWith<$Res>(_value.high3w!, (value) {
      return _then(_value.copyWith(high3w: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VolumeCopyWith<$Res>? get volume {
    if (_value.volume == null) {
      return null;
    }

    return $VolumeCopyWith<$Res>(_value.volume!, (value) {
      return _then(_value.copyWith(volume: value) as $Val);
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
      double? dominance,
      @JsonKey(name: 'high_3w') High3w? high3w,
      Volume? volume,
      @JsonKey(name: 'eth_btc_ratio') double? ethBtcRatio,
      @JsonKey(name: 'stablecoin_inflow_ratio') double? stablecoinInflowRatio});

  @override
  $Change24hCopyWith<$Res>? get change24h;
  @override
  $WebSocketRsiCopyWith<$Res>? get rsi;
  @override
  $High3wCopyWith<$Res>? get high3w;
  @override
  $VolumeCopyWith<$Res>? get volume;
}

/// @nodoc
class __$$WebSocketResponseImplCopyWithImpl<$Res>
    extends _$WebSocketResponseCopyWithImpl<$Res, _$WebSocketResponseImpl>
    implements _$$WebSocketResponseImplCopyWith<$Res> {
  __$$WebSocketResponseImplCopyWithImpl(_$WebSocketResponseImpl _value,
      $Res Function(_$WebSocketResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? krw = freezed,
    Object? usd = freezed,
    Object? timestamp = freezed,
    Object? kimchiPremium = freezed,
    Object? change24h = freezed,
    Object? rsi = freezed,
    Object? dominance = freezed,
    Object? high3w = freezed,
    Object? volume = freezed,
    Object? ethBtcRatio = freezed,
    Object? stablecoinInflowRatio = freezed,
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
      dominance: freezed == dominance
          ? _value.dominance
          : dominance // ignore: cast_nullable_to_non_nullable
              as double?,
      high3w: freezed == high3w
          ? _value.high3w
          : high3w // ignore: cast_nullable_to_non_nullable
              as High3w?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as Volume?,
      ethBtcRatio: freezed == ethBtcRatio
          ? _value.ethBtcRatio
          : ethBtcRatio // ignore: cast_nullable_to_non_nullable
              as double?,
      stablecoinInflowRatio: freezed == stablecoinInflowRatio
          ? _value.stablecoinInflowRatio
          : stablecoinInflowRatio // ignore: cast_nullable_to_non_nullable
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
      this.dominance,
      @JsonKey(name: 'high_3w') this.high3w,
      this.volume,
      @JsonKey(name: 'eth_btc_ratio') this.ethBtcRatio,
      @JsonKey(name: 'stablecoin_inflow_ratio') this.stablecoinInflowRatio});

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
  final double? dominance;
  @override
  @JsonKey(name: 'high_3w')
  final High3w? high3w;
  @override
  final Volume? volume;
  @override
  @JsonKey(name: 'eth_btc_ratio')
  final double? ethBtcRatio;
  @override
  @JsonKey(name: 'stablecoin_inflow_ratio')
  final double? stablecoinInflowRatio;

  @override
  String toString() {
    return 'WebSocketResponse(krw: $krw, usd: $usd, timestamp: $timestamp, kimchiPremium: $kimchiPremium, change24h: $change24h, rsi: $rsi, dominance: $dominance, high3w: $high3w, volume: $volume, ethBtcRatio: $ethBtcRatio, stablecoinInflowRatio: $stablecoinInflowRatio)';
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
            (identical(other.dominance, dominance) ||
                other.dominance == dominance) &&
            (identical(other.high3w, high3w) || other.high3w == high3w) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.ethBtcRatio, ethBtcRatio) ||
                other.ethBtcRatio == ethBtcRatio) &&
            (identical(other.stablecoinInflowRatio, stablecoinInflowRatio) ||
                other.stablecoinInflowRatio == stablecoinInflowRatio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      krw,
      usd,
      timestamp,
      kimchiPremium,
      change24h,
      rsi,
      dominance,
      high3w,
      volume,
      ethBtcRatio,
      stablecoinInflowRatio);

  @JsonKey(ignore: true)
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
      final double? dominance,
      @JsonKey(name: 'high_3w') final High3w? high3w,
      final Volume? volume,
      @JsonKey(name: 'eth_btc_ratio') final double? ethBtcRatio,
      @JsonKey(name: 'stablecoin_inflow_ratio')
      final double? stablecoinInflowRatio}) = _$WebSocketResponseImpl;

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
  double? get dominance;
  @override
  @JsonKey(name: 'high_3w')
  High3w? get high3w;
  @override
  Volume? get volume;
  @override
  @JsonKey(name: 'eth_btc_ratio')
  double? get ethBtcRatio;
  @override
  @JsonKey(name: 'stablecoin_inflow_ratio')
  double? get stablecoinInflowRatio;
  @override
  @JsonKey(ignore: true)
  _$$WebSocketResponseImplCopyWith<_$WebSocketResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

High3w _$High3wFromJson(Map<String, dynamic> json) {
  return _High3w.fromJson(json);
}

/// @nodoc
mixin _$High3w {
  double? get krw => throw _privateConstructorUsedError;
  double? get usd => throw _privateConstructorUsedError;
  @JsonKey(name: 'krw_timestamp')
  String? get krwTimestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'usd_timestamp')
  String? get usdTimestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $High3wCopyWith<High3w> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $High3wCopyWith<$Res> {
  factory $High3wCopyWith(High3w value, $Res Function(High3w) then) =
      _$High3wCopyWithImpl<$Res, High3w>;
  @useResult
  $Res call(
      {double? krw,
      double? usd,
      @JsonKey(name: 'krw_timestamp') String? krwTimestamp,
      @JsonKey(name: 'usd_timestamp') String? usdTimestamp});
}

/// @nodoc
class _$High3wCopyWithImpl<$Res, $Val extends High3w>
    implements $High3wCopyWith<$Res> {
  _$High3wCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? krw = freezed,
    Object? usd = freezed,
    Object? krwTimestamp = freezed,
    Object? usdTimestamp = freezed,
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
      krwTimestamp: freezed == krwTimestamp
          ? _value.krwTimestamp
          : krwTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      usdTimestamp: freezed == usdTimestamp
          ? _value.usdTimestamp
          : usdTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$High3wImplCopyWith<$Res> implements $High3wCopyWith<$Res> {
  factory _$$High3wImplCopyWith(
          _$High3wImpl value, $Res Function(_$High3wImpl) then) =
      __$$High3wImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? krw,
      double? usd,
      @JsonKey(name: 'krw_timestamp') String? krwTimestamp,
      @JsonKey(name: 'usd_timestamp') String? usdTimestamp});
}

/// @nodoc
class __$$High3wImplCopyWithImpl<$Res>
    extends _$High3wCopyWithImpl<$Res, _$High3wImpl>
    implements _$$High3wImplCopyWith<$Res> {
  __$$High3wImplCopyWithImpl(
      _$High3wImpl _value, $Res Function(_$High3wImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? krw = freezed,
    Object? usd = freezed,
    Object? krwTimestamp = freezed,
    Object? usdTimestamp = freezed,
  }) {
    return _then(_$High3wImpl(
      krw: freezed == krw
          ? _value.krw
          : krw // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: freezed == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
      krwTimestamp: freezed == krwTimestamp
          ? _value.krwTimestamp
          : krwTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      usdTimestamp: freezed == usdTimestamp
          ? _value.usdTimestamp
          : usdTimestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$High3wImpl implements _High3w {
  _$High3wImpl(
      {this.krw,
      this.usd,
      @JsonKey(name: 'krw_timestamp') this.krwTimestamp,
      @JsonKey(name: 'usd_timestamp') this.usdTimestamp});

  factory _$High3wImpl.fromJson(Map<String, dynamic> json) =>
      _$$High3wImplFromJson(json);

  @override
  final double? krw;
  @override
  final double? usd;
  @override
  @JsonKey(name: 'krw_timestamp')
  final String? krwTimestamp;
  @override
  @JsonKey(name: 'usd_timestamp')
  final String? usdTimestamp;

  @override
  String toString() {
    return 'High3w(krw: $krw, usd: $usd, krwTimestamp: $krwTimestamp, usdTimestamp: $usdTimestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$High3wImpl &&
            (identical(other.krw, krw) || other.krw == krw) &&
            (identical(other.usd, usd) || other.usd == usd) &&
            (identical(other.krwTimestamp, krwTimestamp) ||
                other.krwTimestamp == krwTimestamp) &&
            (identical(other.usdTimestamp, usdTimestamp) ||
                other.usdTimestamp == usdTimestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, krw, usd, krwTimestamp, usdTimestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$High3wImplCopyWith<_$High3wImpl> get copyWith =>
      __$$High3wImplCopyWithImpl<_$High3wImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$High3wImplToJson(
      this,
    );
  }
}

abstract class _High3w implements High3w {
  factory _High3w(
          {final double? krw,
          final double? usd,
          @JsonKey(name: 'krw_timestamp') final String? krwTimestamp,
          @JsonKey(name: 'usd_timestamp') final String? usdTimestamp}) =
      _$High3wImpl;

  factory _High3w.fromJson(Map<String, dynamic> json) = _$High3wImpl.fromJson;

  @override
  double? get krw;
  @override
  double? get usd;
  @override
  @JsonKey(name: 'krw_timestamp')
  String? get krwTimestamp;
  @override
  @JsonKey(name: 'usd_timestamp')
  String? get usdTimestamp;
  @override
  @JsonKey(ignore: true)
  _$$High3wImplCopyWith<_$High3wImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Volume _$VolumeFromJson(Map<String, dynamic> json) {
  return _Volume.fromJson(json);
}

/// @nodoc
mixin _$Volume {
  @JsonKey(name: '1m')
  double? get min1 => throw _privateConstructorUsedError;
  @JsonKey(name: '5m')
  double? get min5 => throw _privateConstructorUsedError;
  @JsonKey(name: '15m')
  double? get min15 => throw _privateConstructorUsedError;
  @JsonKey(name: '1h')
  double? get hour1 => throw _privateConstructorUsedError;
  @JsonKey(name: '24h')
  double? get hour24 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VolumeCopyWith<Volume> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolumeCopyWith<$Res> {
  factory $VolumeCopyWith(Volume value, $Res Function(Volume) then) =
      _$VolumeCopyWithImpl<$Res, Volume>;
  @useResult
  $Res call(
      {@JsonKey(name: '1m') double? min1,
      @JsonKey(name: '5m') double? min5,
      @JsonKey(name: '15m') double? min15,
      @JsonKey(name: '1h') double? hour1,
      @JsonKey(name: '24h') double? hour24});
}

/// @nodoc
class _$VolumeCopyWithImpl<$Res, $Val extends Volume>
    implements $VolumeCopyWith<$Res> {
  _$VolumeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min1 = freezed,
    Object? min5 = freezed,
    Object? min15 = freezed,
    Object? hour1 = freezed,
    Object? hour24 = freezed,
  }) {
    return _then(_value.copyWith(
      min1: freezed == min1
          ? _value.min1
          : min1 // ignore: cast_nullable_to_non_nullable
              as double?,
      min5: freezed == min5
          ? _value.min5
          : min5 // ignore: cast_nullable_to_non_nullable
              as double?,
      min15: freezed == min15
          ? _value.min15
          : min15 // ignore: cast_nullable_to_non_nullable
              as double?,
      hour1: freezed == hour1
          ? _value.hour1
          : hour1 // ignore: cast_nullable_to_non_nullable
              as double?,
      hour24: freezed == hour24
          ? _value.hour24
          : hour24 // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VolumeImplCopyWith<$Res> implements $VolumeCopyWith<$Res> {
  factory _$$VolumeImplCopyWith(
          _$VolumeImpl value, $Res Function(_$VolumeImpl) then) =
      __$$VolumeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '1m') double? min1,
      @JsonKey(name: '5m') double? min5,
      @JsonKey(name: '15m') double? min15,
      @JsonKey(name: '1h') double? hour1,
      @JsonKey(name: '24h') double? hour24});
}

/// @nodoc
class __$$VolumeImplCopyWithImpl<$Res>
    extends _$VolumeCopyWithImpl<$Res, _$VolumeImpl>
    implements _$$VolumeImplCopyWith<$Res> {
  __$$VolumeImplCopyWithImpl(
      _$VolumeImpl _value, $Res Function(_$VolumeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min1 = freezed,
    Object? min5 = freezed,
    Object? min15 = freezed,
    Object? hour1 = freezed,
    Object? hour24 = freezed,
  }) {
    return _then(_$VolumeImpl(
      min1: freezed == min1
          ? _value.min1
          : min1 // ignore: cast_nullable_to_non_nullable
              as double?,
      min5: freezed == min5
          ? _value.min5
          : min5 // ignore: cast_nullable_to_non_nullable
              as double?,
      min15: freezed == min15
          ? _value.min15
          : min15 // ignore: cast_nullable_to_non_nullable
              as double?,
      hour1: freezed == hour1
          ? _value.hour1
          : hour1 // ignore: cast_nullable_to_non_nullable
              as double?,
      hour24: freezed == hour24
          ? _value.hour24
          : hour24 // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VolumeImpl implements _Volume {
  _$VolumeImpl(
      {@JsonKey(name: '1m') this.min1,
      @JsonKey(name: '5m') this.min5,
      @JsonKey(name: '15m') this.min15,
      @JsonKey(name: '1h') this.hour1,
      @JsonKey(name: '24h') this.hour24});

  factory _$VolumeImpl.fromJson(Map<String, dynamic> json) =>
      _$$VolumeImplFromJson(json);

  @override
  @JsonKey(name: '1m')
  final double? min1;
  @override
  @JsonKey(name: '5m')
  final double? min5;
  @override
  @JsonKey(name: '15m')
  final double? min15;
  @override
  @JsonKey(name: '1h')
  final double? hour1;
  @override
  @JsonKey(name: '24h')
  final double? hour24;

  @override
  String toString() {
    return 'Volume(min1: $min1, min5: $min5, min15: $min15, hour1: $hour1, hour24: $hour24)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VolumeImpl &&
            (identical(other.min1, min1) || other.min1 == min1) &&
            (identical(other.min5, min5) || other.min5 == min5) &&
            (identical(other.min15, min15) || other.min15 == min15) &&
            (identical(other.hour1, hour1) || other.hour1 == hour1) &&
            (identical(other.hour24, hour24) || other.hour24 == hour24));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, min1, min5, min15, hour1, hour24);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VolumeImplCopyWith<_$VolumeImpl> get copyWith =>
      __$$VolumeImplCopyWithImpl<_$VolumeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VolumeImplToJson(
      this,
    );
  }
}

abstract class _Volume implements Volume {
  factory _Volume(
      {@JsonKey(name: '1m') final double? min1,
      @JsonKey(name: '5m') final double? min5,
      @JsonKey(name: '15m') final double? min15,
      @JsonKey(name: '1h') final double? hour1,
      @JsonKey(name: '24h') final double? hour24}) = _$VolumeImpl;

  factory _Volume.fromJson(Map<String, dynamic> json) = _$VolumeImpl.fromJson;

  @override
  @JsonKey(name: '1m')
  double? get min1;
  @override
  @JsonKey(name: '5m')
  double? get min5;
  @override
  @JsonKey(name: '15m')
  double? get min15;
  @override
  @JsonKey(name: '1h')
  double? get hour1;
  @override
  @JsonKey(name: '24h')
  double? get hour24;
  @override
  @JsonKey(ignore: true)
  _$$VolumeImplCopyWith<_$VolumeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
