part of 'bloc.dart';

class NavigateToPageState {
  final String? route;

  NavigateToPageState({this.route});

  NavigateToPageState copyWith({String? route}) {
    return NavigateToPageState(
      route: route,
    );
  }
}
