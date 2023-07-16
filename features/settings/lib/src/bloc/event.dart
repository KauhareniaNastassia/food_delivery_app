part of 'bloc.dart';

abstract class OpenContactLinksEvent {}

class OpenFacebookEvent extends OpenContactLinksEvent {}

class OpenInstagramEvent extends OpenContactLinksEvent{}

class OpenMessengerEvent extends OpenContactLinksEvent {}

class MakeAPhoneCallEvent extends OpenContactLinksEvent {}

class OpenLocationLinkEvent extends OpenContactLinksEvent {}
