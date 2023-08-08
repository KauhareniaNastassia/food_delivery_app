// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderItemModel {
  int get id => throw _privateConstructorUsedError; //required String userId,
  ShoppingCartModel get shoppingCart => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
          OrderItemModel value, $Res Function(OrderItemModel) then) =
      _$OrderItemModelCopyWithImpl<$Res, OrderItemModel>;
  @useResult
  $Res call({int id, ShoppingCartModel shoppingCart, String date});
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res, $Val extends OrderItemModel>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shoppingCart = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shoppingCart: null == shoppingCart
          ? _value.shoppingCart
          : shoppingCart // ignore: cast_nullable_to_non_nullable
              as ShoppingCartModel,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderItemModelCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$$_OrderItemModelCopyWith(
          _$_OrderItemModel value, $Res Function(_$_OrderItemModel) then) =
      __$$_OrderItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, ShoppingCartModel shoppingCart, String date});
}

/// @nodoc
class __$$_OrderItemModelCopyWithImpl<$Res>
    extends _$OrderItemModelCopyWithImpl<$Res, _$_OrderItemModel>
    implements _$$_OrderItemModelCopyWith<$Res> {
  __$$_OrderItemModelCopyWithImpl(
      _$_OrderItemModel _value, $Res Function(_$_OrderItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shoppingCart = null,
    Object? date = null,
  }) {
    return _then(_$_OrderItemModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shoppingCart: null == shoppingCart
          ? _value.shoppingCart
          : shoppingCart // ignore: cast_nullable_to_non_nullable
              as ShoppingCartModel,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OrderItemModel implements _OrderItemModel {
  _$_OrderItemModel(
      {required this.id, required this.shoppingCart, required this.date});

  @override
  final int id;
//required String userId,
  @override
  final ShoppingCartModel shoppingCart;
  @override
  final String date;

  @override
  String toString() {
    return 'OrderItemModel(id: $id, shoppingCart: $shoppingCart, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shoppingCart, shoppingCart) ||
                other.shoppingCart == shoppingCart) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, shoppingCart, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderItemModelCopyWith<_$_OrderItemModel> get copyWith =>
      __$$_OrderItemModelCopyWithImpl<_$_OrderItemModel>(this, _$identity);
}

abstract class _OrderItemModel implements OrderItemModel {
  factory _OrderItemModel(
      {required final int id,
      required final ShoppingCartModel shoppingCart,
      required final String date}) = _$_OrderItemModel;

  @override
  int get id;
  @override //required String userId,
  ShoppingCartModel get shoppingCart;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_OrderItemModelCopyWith<_$_OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
