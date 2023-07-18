import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';

part 'event.dart';
part 'state.dart';

class NavigateToPageBloc
    extends Bloc<NavigateToPageEvent, NavigateToPageState> {
  NavigateToPageBloc() : super(NavigateToPageState()) {
    on<NavigateBackEvent>(_onNavigateBack);
    on<NavigateToMenuItemEvent>(_onNavigateToMenuItem);
    on<NavigateToMainPageEvent>(_onNavigateToMainPage);
  }

  void _onNavigateBack(
    NavigateBackEvent event,
    Emitter<NavigateToPageState> emit,
  ) {
    AutoRouter.of(event.context).pop();
  }

  void _onNavigateToMenuItem(
    NavigateToMenuItemEvent event,
    Emitter<NavigateToPageState> emit,
  ) {
    AutoRouter.of(event.context).push(
      MenuItemDetailsScreenRoute(
        menuItem: event.menuItem,
      ),
    );
  }

  void _onNavigateToMainPage(
    NavigateToMainPageEvent event,
    Emitter<NavigateToPageState> emit,
  ) {
    AutoRouter.of(event.context).push(
      const MainPageRoute(),
    );
  }
}
