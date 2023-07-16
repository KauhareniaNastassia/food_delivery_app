part of 'bloc.dart';

class OpenContactLinksState {
  OpenContactLinksState();
}

class ErrorOpenLinkState extends OpenContactLinksState {
  final String errorMessage;

  ErrorOpenLinkState({required this.errorMessage});
}
