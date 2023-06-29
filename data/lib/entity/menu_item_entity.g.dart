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
    );

Map<String, dynamic> _$$_MenuItemEntityToJson(_$_MenuItemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cost': instance.cost,
      'image': instance.image,
    };
