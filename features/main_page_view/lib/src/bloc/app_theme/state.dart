part of 'bloc.dart';

class SwitchState {
  final bool switchValue;

  const SwitchState({
    required this.switchValue,
  });
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required bool switchValue})
      : super(switchValue: switchValue);
}
