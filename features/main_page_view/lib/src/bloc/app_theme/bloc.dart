import 'package:core/core.dart';

part 'event.dart';

part 'state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<SwitchOnEvents>((event, emit) {
      emit(const SwitchState(switchValue: true));
    });
    on<SwitchOffEvents>((event, emit) {
      emit(const SwitchState(switchValue: false));
    });
  }
}
