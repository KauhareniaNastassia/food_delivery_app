import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'order_item_model.freezed.dart';

@freezed
class OrderItemModel with _$OrderItemModel {
  factory OrderItemModel({
    required int id,
    required String userId,
    required ShoppingCartModel shoppingCart,
    required String date,
  }) = _OrderItemModel;
}
