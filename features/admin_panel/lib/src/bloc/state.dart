part of 'bloc.dart';

class AdminPanelState {
  final List<UserInfoModel> usersList;
  final List<UserInfoModel> filteredUserList;
  final String selectedFilter;
  final List<OrderItemModel> userOrderHistory;
  final List<OrderItemForAdminModel> completedOrdersList;
  final List<OrderItemForAdminModel> unCompletedOrdersList;
  final String selectedOrdersFilter;
  final bool isDataProcessing;
  final String? exception;

  const AdminPanelState({
    required this.usersList,
    required this.filteredUserList,
    required this.selectedFilter,
    required this.userOrderHistory,
    required this.completedOrdersList,
    required this.unCompletedOrdersList,
    required this.selectedOrdersFilter,
    required this.isDataProcessing,
    this.exception,
  });

  const AdminPanelState.initial({
    this.usersList = const [],
    this.filteredUserList = const [],
    this.selectedFilter = 'all users',
    this.userOrderHistory = const [],
    this.completedOrdersList = const [],
    this.unCompletedOrdersList = const [],
    this.selectedOrdersFilter = 'new orders',
    this.isDataProcessing = false,
    this.exception,
  });

  AdminPanelState copyWith({
    List<UserInfoModel>? usersList,
    List<UserInfoModel>? filteredUserList,
    String? selectedFilter,
    List<OrderItemModel>? userOrderHistory,
    List<OrderItemForAdminModel>? completedOrdersList,
    List<OrderItemForAdminModel>? unCompletedOrdersList,
    String? selectedOrdersFilter,
    bool? isDataProcessing,
    String? exception,
  }) {
    return AdminPanelState(
      usersList: usersList ?? this.usersList,
      filteredUserList: filteredUserList ?? this.filteredUserList,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      userOrderHistory: userOrderHistory ?? this.userOrderHistory,
      completedOrdersList: completedOrdersList ?? this.completedOrdersList,
      unCompletedOrdersList: unCompletedOrdersList ?? this.unCompletedOrdersList,
      selectedOrdersFilter: selectedOrdersFilter ?? this.selectedOrdersFilter,
      isDataProcessing: isDataProcessing ?? this.isDataProcessing,
      exception: exception ?? this.exception,
    );
  }
}
