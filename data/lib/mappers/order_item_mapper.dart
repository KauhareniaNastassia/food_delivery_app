import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class OrderItemMapper {
  static OrderItemEntity toEntity(OrderItemModel model) {
    return OrderItemEntity(
      id: model.id,
      userId: model.userId,
      date: model.date,
      shoppingCart: ShoppingCartMapper.toEntity(
        model.shoppingCart,
      ),
    );
  }

  static OrderItemModel toModel(OrderItemEntity entity) {
    return OrderItemModel(
      id: entity.id,
      userId: entity.userId,
      date: entity.date,
      shoppingCart: ShoppingCartMapper.toModel(
        entity.shoppingCart,
      ),
    );
  }
}
