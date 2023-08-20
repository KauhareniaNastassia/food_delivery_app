// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuItemEntityAdapter extends TypeAdapter<MenuItemEntity> {
  @override
  final int typeId = 0;

  @override
  MenuItemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuItemEntity(
      id: fields[0] as int,
      titles: (fields[1] as List).cast<MenuItemTitleEntity>(),
      cost: fields[2] as double,
      image: fields[3] as String,
      descriptions: (fields[4] as List).cast<MenuItemDescriptionEntity>(),
      ingredients: (fields[5] as List).cast<MenuItemIngredientsEntity>(),
      categories: (fields[6] as List).cast<MenuItemCategoryEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titles)
      ..writeByte(2)
      ..write(obj.cost)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.descriptions)
      ..writeByte(5)
      ..write(obj.ingredients)
      ..writeByte(6)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuItemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuItemEntity _$$_MenuItemEntityFromJson(Map<String, dynamic> json) =>
    _$_MenuItemEntity(
      id: json['id'] as int,
      titles: (json['titles'] as List<dynamic>)
          .map((e) => MenuItemTitleEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      cost: (json['cost'] as num).toDouble(),
      image: json['image'] as String,
      descriptions: (json['descriptions'] as List<dynamic>)
          .map((e) =>
              MenuItemDescriptionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) =>
              MenuItemIngredientsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map(
              (e) => MenuItemCategoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MenuItemEntityToJson(_$_MenuItemEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titles': instance.titles,
      'cost': instance.cost,
      'image': instance.image,
      'descriptions': instance.descriptions,
      'ingredients': instance.ingredients,
      'categories': instance.categories,
    };
