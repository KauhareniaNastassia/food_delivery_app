import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'order_item_model.freezed.dart';

@freezed
class OrderItemModel with _$OrderItemModel {
  factory OrderItemModel({
    required int id,
    required ShoppingCartModel shoppingCart,
    required String date,
    required bool isCompleted,
  }) = _OrderItemModel;
}
