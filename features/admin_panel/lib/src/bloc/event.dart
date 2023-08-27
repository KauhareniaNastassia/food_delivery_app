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
