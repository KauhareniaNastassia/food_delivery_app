part of 'bloc.dart';

class AdminPanelState {
  final List<UserInfoModel> usersList;
  final List<UserInfoModel> filteredUserList;
  final String selectedFilter;
  final List<OrderItemModel> userOrderHistory;
  final List<OrderItemForAdminModel> completedOrdersList;
  final List<OrderItemForAdminModel> unCompletedOrdersList;
  final String selectedOrdersFilter;
  final MenuItemModel menuItem;
  final String uploadedMenuItemImage;
  final bool isItemEditing;
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
    required this.uploadedMenuItemImage,
    required this.isItemEditing,
    required this.isDataProcessing,
    required this.menuItem,
    this.exception,
  });

  AdminPanelState.initial()
      : usersList = [],
        filteredUserList = [],
        selectedFilter = AppConstants.allUsers,
        userOrderHistory = [],
        completedOrdersList = [],
        unCompletedOrdersList = [],
        selectedOrdersFilter = AppConstants.orderStatus[0],
        uploadedMenuItemImage = '',
        isItemEditing = false,
        isDataProcessing = false,
        exception = '',
        menuItem = MenuItemModel.empty();

  AdminPanelState copyWith({
    List<UserInfoModel>? usersList,
    List<UserInfoModel>? filteredUserList,
    String? selectedFilter,
    List<OrderItemModel>? userOrderHistory,
    List<OrderItemForAdminModel>? completedOrdersList,
    List<OrderItemForAdminModel>? unCompletedOrdersList,
    String? selectedOrdersFilter,
    MenuItemModel? menuItem,
    String? uploadedMenuItemImage,
    bool? isItemEditing,
    bool? isDataProcessing,
    String? exception,
  }) {
    return AdminPanelState(
      usersList: usersList ?? this.usersList,
      filteredUserList: filteredUserList ?? this.filteredUserList,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      userOrderHistory: userOrderHistory ?? this.userOrderHistory,
      completedOrdersList: completedOrdersList ?? this.completedOrdersList,
      unCompletedOrdersList:
          unCompletedOrdersList ?? this.unCompletedOrdersList,
      selectedOrdersFilter: selectedOrdersFilter ?? this.selectedOrdersFilter,
      uploadedMenuItemImage:
          uploadedMenuItemImage ?? this.uploadedMenuItemImage,
      isItemEditing: isItemEditing ?? this.isItemEditing,
      isDataProcessing: isDataProcessing ?? this.isDataProcessing,
      exception: exception ?? this.exception,
      menuItem: menuItem ?? this.menuItem,
    );
  }
}
