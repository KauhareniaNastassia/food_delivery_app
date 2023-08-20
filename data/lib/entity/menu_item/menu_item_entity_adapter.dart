import 'dart:developer';

import 'package:data/data.dart';

class MenuItemEntityAdapter extends TypeAdapter<MenuItemEntity> {
  @override
  final int typeId = 0; // Unique identifier for the adapter

  @override
  MenuItemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return MenuItemEntity(
      id: fields[0] as int,
      titles: (fields[1] as List<dynamic>)
          .map((titleItemJson) => MenuItemTitleEntity.fromJson(titleItemJson))
          .toList(),
      cost: fields[2] as double,
      image: fields[3] as String,
      descriptions: (fields[4] as List<dynamic>)
          .map((descriptionItemJson) =>
          MenuItemDescriptionEntity.fromJson(descriptionItemJson))
          .toList(),
      ingredients: (fields[5] as List<dynamic>)
          .map((ingredientItemJson) =>
          MenuItemIngredientsEntity.fromJson(ingredientItemJson))
          .toList(),
      categories: (fields[6] as List<dynamic>)
          .map((categoryItemJson) =>
          MenuItemCategoryEntity.fromJson(categoryItemJson))
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemEntity obj) {
    writer
      ..writeByte(7) // Number of fields in the object
      ..writeByte(0) // Field index 0
      ..write(obj.id)
      ..writeByte(1) // Field index 1
      ..write(obj.titles)
      ..writeByte(2) // Field index 2
      ..write(obj.cost)
      ..writeByte(3) // Field index 3
      ..write(obj.image)
      ..writeByte(4) // Field index 4
      ..write(obj.descriptions)
      ..writeByte(5) // Field index 5
      ..write(obj.ingredients)
      ..writeByte(6) // Field index 6
      ..write(obj.categories);
  }
}



/*class MenuItemEntityAdapter extends TypeAdapter<MenuItemEntity> {
  @override
  final int typeId = 0;

  @override
  MenuItemEntity read(BinaryReader reader) {

    return MenuItemEntity(
      id: reader.read(),
      titles: reader.readList().cast<MenuItemTitleEntity>(),
      cost: reader.read(),
      image: reader.read(),
      descriptions: reader.readList().cast<MenuItemDescriptionEntity>(),
      ingredients: reader.readList().cast<MenuItemIngredientsEntity>(),
      categories: reader.readList().cast<MenuItemCategoryEntity>(),
    );

  }

  @override
  void write(BinaryWriter writer, MenuItemEntity obj) {
    writer.write(obj.id);

    writer.write(obj.titles.length);
    for (final MenuItemTitleEntity title in obj.titles) {
      writer.write(title);
    }

   // writer.write(obj.titles.map((titleItem) => titleItem.toJson()).toList());
    writer.writeDouble(obj.cost);
    writer.writeString(obj.image);
    writer.write(obj.descriptions);
    writer.write(obj.ingredients);
    writer.write(obj.categories);
  }
}*/

/*class MenuItemEntityAdapter extends TypeAdapter<MenuItemEntity> {
  @override
  final int typeId = 0;

  @override
  MenuItemEntity read(BinaryReader reader) {
    final id = reader.readInt();
    final titlesLength = reader.readInt();
    final titles = List<MenuItemTitleEntity>.generate(
      titlesLength,
          (_) => MenuItemTitleEntity.fromJson(reader.read()),
    );
    final cost = reader.readDouble();
    final image = reader.readString();
    final descriptionsLength = reader.readInt();
    final descriptions = List<MenuItemDescriptionEntity>.generate(
      descriptionsLength,
          (_) => MenuItemDescriptionEntity.fromJson(reader.read()),
    );
    final ingredientsLength = reader.readInt();
    final ingredients = List<MenuItemIngredientsEntity>.generate(
      ingredientsLength,
          (_) => MenuItemIngredientsEntity.fromJson(reader.read()),
    );
    final categoriesLength = reader.readInt();
    final categories = List<MenuItemCategoryEntity>.generate(
      categoriesLength,
          (_) => MenuItemCategoryEntity.fromJson(reader.read()),
    );

    return MenuItemEntity(
      id: id,
      titles: titles,
      cost: cost,
      image: image,
      descriptions: descriptions,
      ingredients: ingredients,
      categories: categories,
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemEntity obj) {
    writer.writeInt(obj.id);
    writer.writeInt(obj.titles.length);
    obj.titles.forEach((title) => writer.writeMap(title.toMap()));
    writer.writeDouble(obj.cost);
    writer.writeString(obj.image);
    writer.writeInt(obj.descriptions.length);
    obj.descriptions.forEach((description) => writer.writeMap(description.toMap()));
    writer.writeInt(obj.ingredients.length);
    obj.ingredients.forEach((ingredient) => writer.writeMap(ingredient.toMap()));
    writer.writeInt(obj.categories.length);
    obj.categories.forEach((category) => writer.writeMap(category.toMap()));
  }
}*/


/*class MenuItemTitleEntityAdapter extends TypeAdapter<MenuItemTitleEntity> {
  @override
  final int typeId = 3; // Assign a unique ID for this adapter

  @override
  MenuItemTitleEntity read(BinaryReader reader) {
    log('MenuItemTitleEntityAdapter');
    return MenuItemTitleEntity(
      title:  reader.read(),
      languageCode: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemTitleEntity obj) {
    writer.write(obj.title);
    writer.write(obj.languageCode);
  }
}

class MenuItemDescriptionEntityAdapter extends TypeAdapter<MenuItemDescriptionEntity> {
  @override
  final int typeId = 4; // Assign a unique ID for this adapter

  @override
  MenuItemDescriptionEntity read(BinaryReader reader) {
    final title = reader.read();
    final languageCode = reader.read();

    return MenuItemDescriptionEntity(
      description: reader.read(),
      languageCode: languageCode,
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemDescriptionEntity obj) {
    writer.write(obj.description);
    writer.write(obj.languageCode);
  }
}

class MenuItemIngredientsEntityAdapter extends TypeAdapter<MenuItemIngredientsEntity> {
  @override
  final int typeId = 5; // Assign a unique ID for this adapter

  @override
  MenuItemIngredientsEntity read(BinaryReader reader) {
    final title = reader.read();
    final languageCode = reader.read();

    return MenuItemIngredientsEntity(
      ingredientsList: reader.read(),
      languageCode: languageCode,
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemIngredientsEntity obj) {
    writer.write(obj.ingredientsList);
    writer.write(obj.languageCode);
  }
}

class MenuItemCategoryEntityAdapter extends TypeAdapter<MenuItemCategoryEntity> {
  @override
  final int typeId = 6; // Assign a unique ID for this adapter

  @override
  MenuItemCategoryEntity read(BinaryReader reader) {
    final title = reader.read();
    final languageCode = reader.read();

    return MenuItemCategoryEntity(
      category: reader.read(),
      languageCode: languageCode,
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemCategoryEntity obj) {
    writer.write(obj.category);
    writer.write(obj.languageCode);
  }
}*/
