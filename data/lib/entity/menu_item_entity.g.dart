// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuItemEntity _$$_MenuItemEntityFromJson(Map<String, dynamic> json) =>
    _$_MenuItemEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      cost: (json['cost'] as num).toDouble(),
      image: json['image'] as String,
      description: json['description'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$$_MenuItemEntityToJson(_$_MenuItemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cost': instance.cost,
      'image': instance.image,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'amount': instance.amount,
    };
