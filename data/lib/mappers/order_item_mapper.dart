import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class OrderItemMapper {
  static OrderItemEntity toEntity(OrderItemModel model) {
    return OrderItemEntity(
      id: model.id,
      date: model.date,
      shoppingCart: ShoppingCartMapper.toEntity(
        model.shoppingCart,
      ),
      isCompleted: model.isCompleted,
    );
  }

  static OrderItemModel toModel(OrderItemEntity entity) {
    return OrderItemModel(
      id: entity.id,
      date: entity.date,
      shoppingCart: ShoppingCartMapper.toModel(
        entity.shoppingCart,
      ),
      isCompleted: entity.isCompleted,
    );
  }
}
