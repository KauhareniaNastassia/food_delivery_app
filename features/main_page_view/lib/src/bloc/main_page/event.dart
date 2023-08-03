part of 'bloc.dart';

abstract class MenuEvent {}

class InitEvent extends MenuEvent {}

class LoadMenuEvent extends MenuEvent {}

class IsInternetConnectionAvailableEvent extends MenuEvent {}
