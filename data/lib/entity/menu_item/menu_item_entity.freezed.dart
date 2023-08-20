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
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  List<MenuItemTitleEntity> get titles => throw _privateConstructorUsedError;
  @HiveField(2)
  double get cost => throw _privateConstructorUsedError;
  @HiveField(3)
  String get image => throw _privateConstructorUsedError;
  @HiveField(4)
  List<MenuItemDescriptionEntity> get descriptions =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  List<MenuItemIngredientsEntity> get ingredients =>
      throw _privateConstructorUsedError;
  @HiveField(6)
  List<MenuItemCategoryEntity> get categories =>
      throw _privateConstructorUsedError;

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
      {@HiveField(0) int id,
      @HiveField(1) List<MenuItemTitleEntity> titles,
      @HiveField(2) double cost,
      @HiveField(3) String image,
      @HiveField(4) List<MenuItemDescriptionEntity> descriptions,
      @HiveField(5) List<MenuItemIngredientsEntity> ingredients,
      @HiveField(6) List<MenuItemCategoryEntity> categories});
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
    Object? categories = null,
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
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<MenuItemCategoryEntity>,
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
      {@HiveField(0) int id,
      @HiveField(1) List<MenuItemTitleEntity> titles,
      @HiveField(2) double cost,
      @HiveField(3) String image,
      @HiveField(4) List<MenuItemDescriptionEntity> descriptions,
      @HiveField(5) List<MenuItemIngredientsEntity> ingredients,
      @HiveField(6) List<MenuItemCategoryEntity> categories});
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
    Object? categories = null,
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
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<MenuItemCategoryEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuItemEntity extends _MenuItemEntity {
  _$_MenuItemEntity(
      {@HiveField(0) required this.id,
      @HiveField(1) required final List<MenuItemTitleEntity> titles,
      @HiveField(2) required this.cost,
      @HiveField(3) required this.image,
      @HiveField(4) required final List<MenuItemDescriptionEntity> descriptions,
      @HiveField(5) required final List<MenuItemIngredientsEntity> ingredients,
      @HiveField(6) required final List<MenuItemCategoryEntity> categories})
      : _titles = titles,
        _descriptions = descriptions,
        _ingredients = ingredients,
        _categories = categories,
        super._();

  factory _$_MenuItemEntity.fromJson(Map<String, dynamic> json) =>
      _$$_MenuItemEntityFromJson(json);

  @override
  @HiveField(0)
  final int id;
  final List<MenuItemTitleEntity> _titles;
  @override
  @HiveField(1)
  List<MenuItemTitleEntity> get titles {
    if (_titles is EqualUnmodifiableListView) return _titles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_titles);
  }

  @override
  @HiveField(2)
  final double cost;
  @override
  @HiveField(3)
  final String image;
  final List<MenuItemDescriptionEntity> _descriptions;
  @override
  @HiveField(4)
  List<MenuItemDescriptionEntity> get descriptions {
    if (_descriptions is EqualUnmodifiableListView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_descriptions);
  }

  final List<MenuItemIngredientsEntity> _ingredients;
  @override
  @HiveField(5)
  List<MenuItemIngredientsEntity> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<MenuItemCategoryEntity> _categories;
  @override
  @HiveField(6)
  List<MenuItemCategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'MenuItemEntity(id: $id, titles: $titles, cost: $cost, image: $image, descriptions: $descriptions, ingredients: $ingredients, categories: $categories)';
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
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_titles),
      cost,
      image,
      const DeepCollectionEquality().hash(_descriptions),
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_categories));

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
}

abstract class _MenuItemEntity extends MenuItemEntity {
  factory _MenuItemEntity(
      {@HiveField(0) required final int id,
      @HiveField(1) required final List<MenuItemTitleEntity> titles,
      @HiveField(2) required final double cost,
      @HiveField(3) required final String image,
      @HiveField(4) required final List<MenuItemDescriptionEntity> descriptions,
      @HiveField(5) required final List<MenuItemIngredientsEntity> ingredients,
      @HiveField(6)
      required final List<MenuItemCategoryEntity>
          categories}) = _$_MenuItemEntity;
  _MenuItemEntity._() : super._();

  factory _MenuItemEntity.fromJson(Map<String, dynamic> json) =
      _$_MenuItemEntity.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  List<MenuItemTitleEntity> get titles;
  @override
  @HiveField(2)
  double get cost;
  @override
  @HiveField(3)
  String get image;
  @override
  @HiveField(4)
  List<MenuItemDescriptionEntity> get descriptions;
  @override
  @HiveField(5)
  List<MenuItemIngredientsEntity> get ingredients;
  @override
  @HiveField(6)
  List<MenuItemCategoryEntity> get categories;
  @override
  @JsonKey(ignore: true)
  _$$_MenuItemEntityCopyWith<_$_MenuItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
