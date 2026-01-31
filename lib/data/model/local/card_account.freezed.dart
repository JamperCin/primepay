// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CardAccount _$CardAccountFromJson(Map<String, dynamic> json) {
  return _CardAccount.fromJson(json);
}

/// @nodoc
mixin _$CardAccount {
  @JsonKey(name: 'card_owner')
  Customer get cardOwner => throw _privateConstructorUsedError;

  /// Serializes this CardAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardAccountCopyWith<CardAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardAccountCopyWith<$Res> {
  factory $CardAccountCopyWith(
          CardAccount value, $Res Function(CardAccount) then) =
      _$CardAccountCopyWithImpl<$Res, CardAccount>;
  @useResult
  $Res call({@JsonKey(name: 'card_owner') Customer cardOwner});

  $CustomerCopyWith<$Res> get cardOwner;
}

/// @nodoc
class _$CardAccountCopyWithImpl<$Res, $Val extends CardAccount>
    implements $CardAccountCopyWith<$Res> {
  _$CardAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardOwner = null,
  }) {
    return _then(_value.copyWith(
      cardOwner: null == cardOwner
          ? _value.cardOwner
          : cardOwner // ignore: cast_nullable_to_non_nullable
              as Customer,
    ) as $Val);
  }

  /// Create a copy of CardAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get cardOwner {
    return $CustomerCopyWith<$Res>(_value.cardOwner, (value) {
      return _then(_value.copyWith(cardOwner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardAccountImplCopyWith<$Res>
    implements $CardAccountCopyWith<$Res> {
  factory _$$CardAccountImplCopyWith(
          _$CardAccountImpl value, $Res Function(_$CardAccountImpl) then) =
      __$$CardAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'card_owner') Customer cardOwner});

  @override
  $CustomerCopyWith<$Res> get cardOwner;
}

/// @nodoc
class __$$CardAccountImplCopyWithImpl<$Res>
    extends _$CardAccountCopyWithImpl<$Res, _$CardAccountImpl>
    implements _$$CardAccountImplCopyWith<$Res> {
  __$$CardAccountImplCopyWithImpl(
      _$CardAccountImpl _value, $Res Function(_$CardAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of CardAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardOwner = null,
  }) {
    return _then(_$CardAccountImpl(
      cardOwner: null == cardOwner
          ? _value.cardOwner
          : cardOwner // ignore: cast_nullable_to_non_nullable
              as Customer,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardAccountImpl implements _CardAccount {
  const _$CardAccountImpl(
      {@JsonKey(name: 'card_owner') this.cardOwner = const Customer()});

  factory _$CardAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardAccountImplFromJson(json);

  @override
  @JsonKey(name: 'card_owner')
  final Customer cardOwner;

  @override
  String toString() {
    return 'CardAccount(cardOwner: $cardOwner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardAccountImpl &&
            (identical(other.cardOwner, cardOwner) ||
                other.cardOwner == cardOwner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cardOwner);

  /// Create a copy of CardAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardAccountImplCopyWith<_$CardAccountImpl> get copyWith =>
      __$$CardAccountImplCopyWithImpl<_$CardAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardAccountImplToJson(
      this,
    );
  }
}

abstract class _CardAccount implements CardAccount {
  const factory _CardAccount(
          {@JsonKey(name: 'card_owner') final Customer cardOwner}) =
      _$CardAccountImpl;

  factory _CardAccount.fromJson(Map<String, dynamic> json) =
      _$CardAccountImpl.fromJson;

  @override
  @JsonKey(name: 'card_owner')
  Customer get cardOwner;

  /// Create a copy of CardAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardAccountImplCopyWith<_$CardAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
