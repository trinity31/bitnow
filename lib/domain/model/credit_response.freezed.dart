// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreditResponse _$CreditResponseFromJson(Map<String, dynamic> json) {
  return _CreditResponse.fromJson(json);
}

/// @nodoc
mixin _$CreditResponse {
  int get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditResponseCopyWith<CreditResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditResponseCopyWith<$Res> {
  factory $CreditResponseCopyWith(
          CreditResponse value, $Res Function(CreditResponse) then) =
      _$CreditResponseCopyWithImpl<$Res, CreditResponse>;
  @useResult
  $Res call({int balance});
}

/// @nodoc
class _$CreditResponseCopyWithImpl<$Res, $Val extends CreditResponse>
    implements $CreditResponseCopyWith<$Res> {
  _$CreditResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditResponseImplCopyWith<$Res>
    implements $CreditResponseCopyWith<$Res> {
  factory _$$CreditResponseImplCopyWith(_$CreditResponseImpl value,
          $Res Function(_$CreditResponseImpl) then) =
      __$$CreditResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int balance});
}

/// @nodoc
class __$$CreditResponseImplCopyWithImpl<$Res>
    extends _$CreditResponseCopyWithImpl<$Res, _$CreditResponseImpl>
    implements _$$CreditResponseImplCopyWith<$Res> {
  __$$CreditResponseImplCopyWithImpl(
      _$CreditResponseImpl _value, $Res Function(_$CreditResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
  }) {
    return _then(_$CreditResponseImpl(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditResponseImpl implements _CreditResponse {
  _$CreditResponseImpl({required this.balance});

  factory _$CreditResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditResponseImplFromJson(json);

  @override
  final int balance;

  @override
  String toString() {
    return 'CreditResponse(balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditResponseImpl &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditResponseImplCopyWith<_$CreditResponseImpl> get copyWith =>
      __$$CreditResponseImplCopyWithImpl<_$CreditResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditResponseImplToJson(
      this,
    );
  }
}

abstract class _CreditResponse implements CreditResponse {
  factory _CreditResponse({required final int balance}) = _$CreditResponseImpl;

  factory _CreditResponse.fromJson(Map<String, dynamic> json) =
      _$CreditResponseImpl.fromJson;

  @override
  int get balance;
  @override
  @JsonKey(ignore: true)
  _$$CreditResponseImplCopyWith<_$CreditResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
