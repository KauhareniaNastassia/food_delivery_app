part of 'bloc.dart';

abstract class OrderHistoryEvent {}

class InitOrderHistoryEvent extends OrderHistoryEvent {}

class CreateOrderEvent extends OrderHistoryEvent {
  final OrderItemModel orderItem;

  CreateOrderEvent({
    required this.orderItem,
  });
}

class NavigateToShoppingCartPageEvent extends OrderHistoryEvent {
  NavigateToShoppingCartPageEvent();
}
