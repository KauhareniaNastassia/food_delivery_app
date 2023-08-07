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

MenuItemEntity _$MenuItemEntityFromJson(Map<String, dynamic> json) {
  return _MenuItemEntity.fromJson(json);
}

/// @nodoc
mixin _$MenuItemEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      String title,
      double cost,
      String image,
      String description,
      List<String> ingredients,
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
    Object? title = null,
    Object? cost = null,
    Object? image = null,
    Object? description = null,
    Object? ingredients = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      String title,
      double cost,
      String image,
      String description,
      List<String> ingredients,
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
    Object? title = null,
    Object? cost = null,
    Object? image = null,
    Object? description = null,
    Object? ingredients = null,
    Object? category = null,
  }) {
    return _then(_$_MenuItemEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuItemEntity implements _MenuItemEntity {
  _$_MenuItemEntity(
      {required this.id,
      required this.title,
      required this.cost,
      required this.image,
      required this.description,
      required final List<String> ingredients,
      required this.category})
      : _ingredients = ingredients;

  factory _$_MenuItemEntity.fromJson(Map<String, dynamic> json) =>
      _$$_MenuItemEntityFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final double cost;
  @override
  final String image;
  @override
  final String description;
  final List<String> _ingredients;
  @override
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final String category;

  @override
  String toString() {
    return 'MenuItemEntity(id: $id, title: $title, cost: $cost, image: $image, description: $description, ingredients: $ingredients, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuItemEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, cost, image,
      description, const DeepCollectionEquality().hash(_ingredients), category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuItemEntityCopyWith<_$_MenuItemEntity> get copyWith =>
      __$$_MenuItemEntityCopyWithImpl<_$_MenuItemEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuItemEntityToJson(
      this,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}

abstract class _MenuItemEntity implements MenuItemEntity {
  factory _MenuItemEntity(
      {required final int id,
      required final String title,
      required final double cost,
      required final String image,
      required final String description,
      required final List<String> ingredients,
      required final String category}) = _$_MenuItemEntity;

  factory _MenuItemEntity.fromJson(Map<String, dynamic> json) =
      _$_MenuItemEntity.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  double get cost;
  @override
  String get image;
  @override
  String get description;
  @override
  List<String> get ingredients;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_MenuItemEntityCopyWith<_$_MenuItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
