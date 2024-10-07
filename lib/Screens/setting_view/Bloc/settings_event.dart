part of 'settings_bloc.dart';


sealed class SettingsEvent {
  const SettingsEvent();
}


class TriggerSettingScreen extends SettingsEvent{
  final int index;
  const TriggerSettingScreen(this.index);
}
