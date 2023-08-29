part of 'bloc.dart';

abstract class AdminPanelEvent {
  const AdminPanelEvent();
}

class InitUsersEvent extends AdminPanelEvent {
  InitUsersEvent();
}

class FilterUsersByRoleEvent extends AdminPanelEvent {
  final String filterValue;

  FilterUsersByRoleEvent({
    required this.filterValue,
  });
}

class ChangeUserRoleEvent extends AdminPanelEvent {
  final String newUserRoleValue;
  final String userId;

  ChangeUserRoleEvent({
    required this.newUserRoleValue,
    required this.userId,
  });
}

class FetchUserOrderHistoryEvent extends AdminPanelEvent {
  final String userId;

  FetchUserOrderHistoryEvent({
    required this.userId,
  });
}

class InitOrdersEvent extends AdminPanelEvent {
  InitOrdersEvent();
}

class FilterOrdersByCompleteEvent extends AdminPanelEvent {
  final String filterValue;

  FilterOrdersByCompleteEvent({
    required this.filterValue,
  });
}

class ChangeOrderStatusEvent extends AdminPanelEvent {
  final String userId;
  final int orderId;

  ChangeOrderStatusEvent({
    required this.userId,
    required this.orderId,
  });
}
