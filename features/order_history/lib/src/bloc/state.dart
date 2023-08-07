part of 'bloc.dart';

class OrderHistoryState {
  final List<OrderItemModel> orderItems;
  final String? exception;
  final bool isLoading;
  final String userId;

  OrderHistoryState({
    required this.orderItems,
    required this.exception,
    required this.isLoading,
    required this.userId,
  });

  OrderHistoryState.empty({
    this.orderItems = const [],
    this.exception = '',
    this.isLoading = false,
    this.userId = '',
  });

  OrderHistoryState copyWith({
    List<OrderItemModel>? orderItems,
    String? exception,
    bool? isLoading,
    String? userId,
  }) {
    return OrderHistoryState(
      orderItems: orderItems ?? this.orderItems,
      exception: exception ?? this.exception,
      isLoading: isLoading ?? this.isLoading,
      userId: userId ?? this.userId,
    );
  }
}
