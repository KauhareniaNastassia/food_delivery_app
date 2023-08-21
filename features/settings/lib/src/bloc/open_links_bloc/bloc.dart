import 'package:core/core.dart';

part 'event.dart';

part 'state.dart';

class OpenContactLinksBloc
    extends Bloc<OpenContactLinksEvent, OpenContactLinksState> {
  OpenContactLinksBloc()
      : super(
          OpenContactLinksState(),
        ) {
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
      final Uri url = Uri.parse(AppConstants.facebookLink);
      await launchUrl(url);
    } catch (e) {
      emit(
        ErrorOpenLinkState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _openInstagramLink(
    OpenInstagramEvent event,
    Emitter<OpenContactLinksState> emit,
  ) async {
    try {
      final Uri url = Uri.parse(AppConstants.instagramLink);
      await launchUrl(url);
    } catch (e) {
      emit(
        ErrorOpenLinkState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _openMessengerLink(
    OpenMessengerEvent event,
    Emitter<OpenContactLinksState> emit,
  ) async {
    final Uri messageUrl = Uri.parse('sms:${AppConstants.phoneNumber}');

    final PermissionStatus status = await Permission.sms.request();

    if (status.isGranted) {
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
  }

  Future<void> _makeAPhoneCall(
    MakeAPhoneCallEvent event,
    Emitter<OpenContactLinksState> emit,
  ) async {
    final Uri telephoneUrl = Uri.parse('tel:${AppConstants.phoneNumber}');

    final PermissionStatus status = await Permission.phone.request();

    if (status.isGranted) {
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
  }

  Future<void> _openLocationLink(
    OpenLocationLinkEvent event,
    Emitter<OpenContactLinksState> emit,
  ) async {
    final Uri mapUrl = Uri.parse(AppConstants.geoPosition);

    final PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
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
}
