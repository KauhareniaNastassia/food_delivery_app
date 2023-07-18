import 'package:data/data.dart';

class MenuItemEntityAdapter extends TypeAdapter<MenuItemEntity> {
  @override
  final int typeId = 0;

  @override
  MenuItemEntity read(BinaryReader reader) {
    return MenuItemEntity(
      id: reader.read(),
      title: reader.read(),
      cost: reader.read(),
      image: reader.read(),
      description: reader.read(),
      ingredients: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, MenuItemEntity obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.cost);
    writer.write(obj.image);
    writer.write(obj.description);
    writer.write(obj.ingredients);
  }
}
