import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationState()) {
    on<TriggerIndexEvent>(_triggerIndex);
  }
  
  
  void _triggerIndex(TriggerIndexEvent event, Emitter<ApplicationState> emit){
    emit(state.copyWith(index: event.index));
  }
}
