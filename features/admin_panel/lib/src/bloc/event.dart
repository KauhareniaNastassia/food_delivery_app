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

class EditModeEvent extends AdminPanelEvent {
  final bool modeValue;

  EditModeEvent({
    required this.modeValue,
  });
}

class NavigateToAddItemPageEvent extends AdminPanelEvent {
  NavigateToAddItemPageEvent();
}

class SaveMenuItemChangesEvent extends AdminPanelEvent {
  final MenuItemModel menuItem;
  final Function() onComplete;

  SaveMenuItemChangesEvent({
    required this.menuItem,
    required this.onComplete,
  });
}

class InitMenuItem extends AdminPanelEvent {
  final MenuItemModel menuItem;

  InitMenuItem({
    required this.menuItem,
  });
}

class DeleteMenuItemEvent extends AdminPanelEvent {
  final String menuItemId;

  DeleteMenuItemEvent({
    required this.menuItemId,
  });
}

class UploadMenuItemImageEvent extends AdminPanelEvent {
  UploadMenuItemImageEvent();
}

class SelectMenuItemImageEvent extends AdminPanelEvent {
  SelectMenuItemImageEvent();
}

class NavigateBackToAdminEvent extends AdminPanelEvent {
  NavigateBackToAdminEvent();
}
