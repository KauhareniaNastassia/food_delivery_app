part of 'bloc.dart';

abstract class AdminPanelEvent {
  const AdminPanelEvent();
}

class InitUsersEvent extends AdminPanelEvent {
  const InitUsersEvent();
}

class FilterUsersByRoleEvent extends AdminPanelEvent {
  final String filterValue;

  const FilterUsersByRoleEvent({
    required this.filterValue,
  });
}

class ChangeUserRoleEvent extends AdminPanelEvent {
  final String newUserRoleValue;
  final String userId;

  const ChangeUserRoleEvent({
    required this.newUserRoleValue,
    required this.userId,
  });
}

class FetchUserOrderHistoryEvent extends AdminPanelEvent {
  final String userId;

  const FetchUserOrderHistoryEvent({
    required this.userId,
  });
}

class InitOrdersEvent extends AdminPanelEvent {
  const InitOrdersEvent();
}

class FilterOrdersByCompleteEvent extends AdminPanelEvent {
  final String filterValue;

  const FilterOrdersByCompleteEvent({
    required this.filterValue,
  });
}

class ChangeOrderStatusEvent extends AdminPanelEvent {
  final String userId;
  final int orderId;

  const ChangeOrderStatusEvent({
    required this.userId,
    required this.orderId,
  });
}

class EditModeEvent extends AdminPanelEvent {
  final bool modeValue;

  const EditModeEvent({
    required this.modeValue,
  });
}

class NavigateToAddItemPageEvent extends AdminPanelEvent {
  const NavigateToAddItemPageEvent();
}

class SaveMenuItemChangesEvent extends AdminPanelEvent {
  final MenuItemModel menuItem;
  final Function() onComplete;

  const SaveMenuItemChangesEvent({
    required this.menuItem,
    required this.onComplete,
  });
}

class InitMenuItem extends AdminPanelEvent {
  final MenuItemModel menuItem;

  const InitMenuItem({
    required this.menuItem,
  });
}

class DeleteMenuItemEvent extends AdminPanelEvent {
  final String menuItemId;

  const DeleteMenuItemEvent({
    required this.menuItemId,
  });
}

class UploadMenuItemImageEvent extends AdminPanelEvent {
  const UploadMenuItemImageEvent();
}

class SelectMenuItemImageEvent extends AdminPanelEvent {
  const SelectMenuItemImageEvent();
}

class NavigateBackToAdminEvent extends AdminPanelEvent {
  const NavigateBackToAdminEvent();
}
