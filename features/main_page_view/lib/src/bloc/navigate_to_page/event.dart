part of 'bloc.dart';

abstract class NavigateToPageEvent {}

class NavigateBackEvent extends NavigateToPageEvent {
  final BuildContext context;

  NavigateBackEvent({
    required this.context,
  });
}

class NavigateToMenuItemEvent extends NavigateToPageEvent {
  final MenuItemModel menuItem;
  final BuildContext context;

  NavigateToMenuItemEvent({
    required this.menuItem,
    required this.context,
  });
}

class NavigateToMainPageEvent extends NavigateToPageEvent {
  final BuildContext context;

  NavigateToMainPageEvent({
    required this.context,
  });
}

class NavigateToSignInPageEvent extends NavigateToPageEvent {
  final BuildContext context;

  NavigateToSignInPageEvent({
    required this.context,
  });
}

class NavigateToSignUpPageEvent extends NavigateToPageEvent {
  final BuildContext context;

  NavigateToSignUpPageEvent({
    required this.context,
  });
}

