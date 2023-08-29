import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class OrderItemForAdminMapper {
  static OrderItemForAdminEntity toEntity(OrderItemForAdminModel model) {
    return OrderItemForAdminEntity(
      userId: model.userId,
      email: model.email,
      orderItem: OrderItemMapper.toEntity(
        model.orderItem,
      ),
    );
  }

  static OrderItemForAdminModel toModel(OrderItemForAdminEntity entity) {
    return OrderItemForAdminModel(
      userId: entity.userId,
      email: entity.email,
      orderItem: OrderItemMapper.toModel(
        entity.orderItem,
      ),
    );
  }
}
