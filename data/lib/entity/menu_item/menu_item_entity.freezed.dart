/*
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuItemEntity {
  int get id => throw _privateConstructorUsedError;
  List<MenuItemTitleEntity> get titles => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<MenuItemDescriptionEntity> get descriptions =>
      throw _privateConstructorUsedError;
  List<MenuItemIngredientsEntity> get ingredients =>
      throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuItemEntityCopyWith<MenuItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemEntityCopyWith<$Res> {
  factory $MenuItemEntityCopyWith(
          MenuItemEntity value, $Res Function(MenuItemEntity) then) =
      _$MenuItemEntityCopyWithImpl<$Res, MenuItemEntity>;
  @useResult
  $Res call(
      {int id,
      List<MenuItemTitleEntity> titles,
      double cost,
      String image,
      List<MenuItemDescriptionEntity> descriptions,
      List<MenuItemIngredientsEntity> ingredients,
      String category});
}

/// @nodoc
class _$MenuItemEntityCopyWithImpl<$Res, $Val extends MenuItemEntity>
    implements $MenuItemEntityCopyWith<$Res> {
  _$MenuItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titles = null,
    Object? cost = null,
    Object? image = null,
    Object? descriptions = null,
    Object? ingredients = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      titles: null == titles
          ? _value.titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<MenuItemTitleEntity>,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<MenuItemDescriptionEntity>,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<MenuItemIngredientsEntity>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuItemEntityCopyWith<$Res>
    implements $MenuItemEntityCopyWith<$Res> {
  factory _$$_MenuItemEntityCopyWith(
          _$_MenuItemEntity value, $Res Function(_$_MenuItemEntity) then) =
      __$$_MenuItemEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      List<MenuItemTitleEntity> titles,
      double cost,
      String image,
      List<MenuItemDescriptionEntity> descriptions,
      List<MenuItemIngredientsEntity> ingredients,
      String category});
}

/// @nodoc
class __$$_MenuItemEntityCopyWithImpl<$Res>
    extends _$MenuItemEntityCopyWithImpl<$Res, _$_MenuItemEntity>
    implements _$$_MenuItemEntityCopyWith<$Res> {
  __$$_MenuItemEntityCopyWithImpl(
      _$_MenuItemEntity _value, $Res Function(_$_MenuItemEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? titles = null,
    Object? cost = null,
    Object? image = null,
    Object? descriptions = null,
    Object? ingredients = null,
    Object? category = null,
  }) {
    return _then(_$_MenuItemEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      titles: null == titles
          ? _value._titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<MenuItemTitleEntity>,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      descriptions: null == descriptions
          ? _value._descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as List<MenuItemDescriptionEntity>,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<MenuItemIngredientsEntity>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MenuItemEntity implements _MenuItemEntity {
  _$_MenuItemEntity(
      {required this.id,
      required final List<MenuItemTitleEntity> titles,
      required this.cost,
      required this.image,
      required final List<MenuItemDescriptionEntity> descriptions,
      required final List<MenuItemIngredientsEntity> ingredients,
      required this.category})
      : _titles = titles,
        _descriptions = descriptions,
        _ingredients = ingredients;

  @override
  final int id;
  final List<MenuItemTitleEntity> _titles;
  @override
  List<MenuItemTitleEntity> get titles {
    if (_titles is EqualUnmodifiableListView) return _titles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_titles);
  }

  @override
  final double cost;
  @override
  final String image;
  final List<MenuItemDescriptionEntity> _descriptions;
  @override
  List<MenuItemDescriptionEntity> get descriptions {
    if (_descriptions is EqualUnmodifiableListView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_descriptions);
  }

  final List<MenuItemIngredientsEntity> _ingredients;
  @override
  List<MenuItemIngredientsEntity> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final String category;

  @override
  String toString() {
    return 'MenuItemEntity(id: $id, titles: $titles, cost: $cost, image: $image, descriptions: $descriptions, ingredients: $ingredients, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuItemEntity &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._titles, _titles) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._descriptions, _descriptions) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_titles),
      cost,
      image,
      const DeepCollectionEquality().hash(_descriptions),
      const DeepCollectionEquality().hash(_ingredients),
      category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuItemEntityCopyWith<_$_MenuItemEntity> get copyWith =>
      __$$_MenuItemEntityCopyWithImpl<_$_MenuItemEntity>(this, _$identity);

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}

abstract class _MenuItemEntity implements MenuItemEntity {
  factory _MenuItemEntity(
      {required final int id,
      required final List<MenuItemTitleEntity> titles,
      required final double cost,
      required final String image,
      required final List<MenuItemDescriptionEntity> descriptions,
      required final List<MenuItemIngredientsEntity> ingredients,
      required final String category}) = _$_MenuItemEntity;

  @override
  int get id;
  @override
  List<MenuItemTitleEntity> get titles;
  @override
  double get cost;
  @override
  String get image;
  @override
  List<MenuItemDescriptionEntity> get descriptions;
  @override
  List<MenuItemIngredientsEntity> get ingredients;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_MenuItemEntityCopyWith<_$_MenuItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
*/
