part of 'bloc.dart';

class AdminPanelState {
  final List<UserInfoModel> usersList;
  final List<UserInfoModel> filteredUserList;
  final String selectedFilter;
  final List<OrderItemModel> userOrderHistory;
  final bool isDataProcessing;
  final String? exception;

  const AdminPanelState({
    required this.usersList,
    required this.filteredUserList,
    required this.selectedFilter,
    required this.userOrderHistory,
    required this.isDataProcessing,
    this.exception,
  });

  const AdminPanelState.initial({
    this.usersList = const [],
    this.filteredUserList = const [],
    this.selectedFilter = 'all users',
    this.userOrderHistory = const [],
    this.isDataProcessing = false,
    this.exception,
  });

  AdminPanelState copyWith({
    List<UserInfoModel>? usersList,
    List<UserInfoModel>? filteredUserList,
    String? selectedFilter,
    final List<OrderItemModel>? userOrderHistory,
    bool? isDataProcessing,
    String? exception,
  }) {
    return AdminPanelState(
      usersList: usersList ?? this.usersList,
      filteredUserList: filteredUserList ?? this.filteredUserList,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      userOrderHistory: userOrderHistory ?? this.userOrderHistory,
      isDataProcessing: isDataProcessing ?? this.isDataProcessing,
      exception: exception ?? this.exception,
    );
  }
}
