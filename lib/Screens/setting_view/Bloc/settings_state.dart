part of 'settings_bloc.dart';

class SettingsState {
  int index;

  SettingsState({this.index = 0});

  SettingsState copyWith(int? index) {
    return SettingsState(index: index ?? this.index);
  }
}
