import 'package:bloc/bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()){
   on<TriggerSettingScreen>(_triggerEvent);
  }


  void _triggerEvent(TriggerSettingScreen event, Emitter<SettingsState> emit){
    emit(SettingsState(index: event.index));
  }
}
