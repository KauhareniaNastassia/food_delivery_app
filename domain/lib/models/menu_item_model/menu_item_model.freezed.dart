// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuItemModel {
  int get id => throw _privateConstructorUsedError;
  List<MenuItemTitleModel> get titles => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  List<MenuItemDescriptionModel> get descriptions =>
      throw _privateConstructorUsedError;
  List<MenuItemIngredientsModel> get ingredients =>
      throw _privateConstructorUsedError;
  List<MenuItemCategoryModel> get categories =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuItemModelCopyWith<MenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemModelCopyWith<$Res> {
  factory $MenuItemModelCopyWith(
          MenuItemModel value, $Res Function(MenuItemModel) then) =
      _$MenuItemModelCopyWithImpl<$Res, MenuItemModel>;
  @useResult
  $Res call(
      {int id,
      List<MenuItemTitleModel> titles,
      double cost,
      String image,
      List<MenuItemDescriptionModel> descriptions,
      List<MenuItemIngredientsModel> ingredients,
      List<MenuItemCategoryModel> categories});
}

/// @nodoc
class _$MenuItemModelCopyWithImpl<$Res, $Val extends MenuItemModel>
    implements $MenuItemModelCopyWith<$Res> {
  _$MenuItemModelCopyWithImpl(this._value, this._then);

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
              as List<MenuItemTitleModel>,
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
              as List<MenuItemDescriptionModel>,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<MenuItemIngredientsModel>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<MenuItemCategoryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuItemModelCopyWith<$Res>
    implements $MenuItemModelCopyWith<$Res> {
  factory _$$_MenuItemModelCopyWith(
          _$_MenuItemModel value, $Res Function(_$_MenuItemModel) then) =
      __$$_MenuItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      List<MenuItemTitleModel> titles,
      double cost,
      String image,
      List<MenuItemDescriptionModel> descriptions,
      List<MenuItemIngredientsModel> ingredients,
      List<MenuItemCategoryModel> categories});
}

/// @nodoc
class __$$_MenuItemModelCopyWithImpl<$Res>
    extends _$MenuItemModelCopyWithImpl<$Res, _$_MenuItemModel>
    implements _$$_MenuItemModelCopyWith<$Res> {
  __$$_MenuItemModelCopyWithImpl(
      _$_MenuItemModel _value, $Res Function(_$_MenuItemModel) _then)
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
    return _then(_$_MenuItemModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      titles: null == titles
          ? _value._titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<MenuItemTitleModel>,
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
              as List<MenuItemDescriptionModel>,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<MenuItemIngredientsModel>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<MenuItemCategoryModel>,
    ));
  }
}

/// @nodoc

class _$_MenuItemModel implements _MenuItemModel {
  _$_MenuItemModel(
      {required this.id,
      required final List<MenuItemTitleModel> titles,
      required this.cost,
      required this.image,
      required final List<MenuItemDescriptionModel> descriptions,
      required final List<MenuItemIngredientsModel> ingredients,
      required final List<MenuItemCategoryModel> categories})
      : _titles = titles,
        _descriptions = descriptions,
        _ingredients = ingredients,
        _categories = categories;

  @override
  final int id;
  final List<MenuItemTitleModel> _titles;
  @override
  List<MenuItemTitleModel> get titles {
    if (_titles is EqualUnmodifiableListView) return _titles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_titles);
  }

  @override
  final double cost;
  @override
  final String image;
  final List<MenuItemDescriptionModel> _descriptions;
  @override
  List<MenuItemDescriptionModel> get descriptions {
    if (_descriptions is EqualUnmodifiableListView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_descriptions);
  }

  final List<MenuItemIngredientsModel> _ingredients;
  @override
  List<MenuItemIngredientsModel> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<MenuItemCategoryModel> _categories;
  @override
  List<MenuItemCategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'MenuItemModel(id: $id, titles: $titles, cost: $cost, image: $image, descriptions: $descriptions, ingredients: $ingredients, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuItemModel &&
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
  _$$_MenuItemModelCopyWith<_$_MenuItemModel> get copyWith =>
      __$$_MenuItemModelCopyWithImpl<_$_MenuItemModel>(this, _$identity);
}

abstract class _MenuItemModel implements MenuItemModel {
  factory _MenuItemModel(
          {required final int id,
          required final List<MenuItemTitleModel> titles,
          required final double cost,
          required final String image,
          required final List<MenuItemDescriptionModel> descriptions,
          required final List<MenuItemIngredientsModel> ingredients,
          required final List<MenuItemCategoryModel> categories}) =
      _$_MenuItemModel;

  @override
  int get id;
  @override
  List<MenuItemTitleModel> get titles;
  @override
  double get cost;
  @override
  String get image;
  @override
  List<MenuItemDescriptionModel> get descriptions;
  @override
  List<MenuItemIngredientsModel> get ingredients;
  @override
  List<MenuItemCategoryModel> get categories;
  @override
  @JsonKey(ignore: true)
  _$$_MenuItemModelCopyWith<_$_MenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
