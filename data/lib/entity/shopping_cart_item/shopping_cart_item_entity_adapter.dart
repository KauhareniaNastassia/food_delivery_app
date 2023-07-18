import 'package:data/data.dart';

class ShoppingCartItemEntityAdapter
    extends TypeAdapter<ShoppingCartItemEntity> {
  @override
  final int typeId = 1;

  @override
  ShoppingCartItemEntity read(BinaryReader reader) {
    return ShoppingCartItemEntity(
      menuItemEntity: reader.read(),
      amount: reader.read() as int,
    );
  }

  @override
  void write(BinaryWriter writer, ShoppingCartItemEntity obj) {
    writer.write(obj.menuItemEntity);
    writer.write(obj.amount);
  }
}
