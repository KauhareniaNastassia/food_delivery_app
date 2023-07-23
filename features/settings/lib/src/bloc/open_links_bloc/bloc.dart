import 'package:core/core.dart';
import 'package:url_launcher/url_launcher.dart';

part 'event.dart';

part 'state.dart';

class OpenContactLinksBloc
    extends Bloc<OpenContactLinksEvent, OpenContactLinksState> {
  OpenContactLinksBloc() : super(OpenContactLinksState()) {
    on<OpenFacebookEvent>(_openFacebookLink);
    on<OpenInstagramEvent>(_openInstagramLink);
    on<OpenMessengerEvent>(_openMessengerLink);
    on<MakeAPhoneCallEvent>(_makeAPhoneCall);
    on<OpenLocationLinkEvent>(_openLocationLink);
  }

  Future<void> _openFacebookLink(
    OpenFacebookEvent event,
    Emitter<OpenContactLinksState> emit,
  ) async {
    try {
      final Uri url = Uri.parse('https://www.facebook.com');
      await launchUrl(url);
    } catch (e) {
      emit(
        ErrorOpenLinkState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _openInstagramLink(
    OpenInstagramEvent event,
    Emitter<OpenContactLinksState> emit,
  ) async {
    try {
      final Uri url = Uri.parse('https://www.instagram.com');
      await launchUrl(url);
    } catch (e) {
      emit(
        ErrorOpenLinkState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _openMessengerLink(
    OpenMessengerEvent event,
    Emitter<OpenContactLinksState> emit,
  ) async {
    const String telephoneNumber = '+375291234567';
    final Uri messageUrl = Uri.parse('sms:$telephoneNumber');
    try {
      await launchUrl(messageUrl);
    } catch (e) {
      emit(
        ErrorOpenLinkState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _makeAPhoneCall(
    MakeAPhoneCallEvent event,
    Emitter<OpenContactLinksState> emit,
  ) async {
    const String telephoneNumber = '+375291234567';
    final Uri telephoneUrl = Uri.parse('tel:$telephoneNumber');
    try {
      await launchUrl(telephoneUrl);
    } catch (e) {
      emit(
        ErrorOpenLinkState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _openLocationLink(
    OpenLocationLinkEvent event,
    Emitter<OpenContactLinksState> emit,
  ) async {
    const String lat = '53.915629';
    const String lng = '27.569431';
    final Uri mapUrl = Uri.parse('geo:$lat,$lng');
    try {
      await launchUrl(mapUrl);
    } catch (e) {
      emit(
        ErrorOpenLinkState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
