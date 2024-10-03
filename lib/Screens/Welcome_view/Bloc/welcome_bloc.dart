import 'package:bloc/bloc.dart';

part 'welcome_event.dart';

part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>(_welcomeEvent);
  }

  void _welcomeEvent(WelcomeEvent event, Emitter<WelcomeState> emit) {
    emit(WelcomeState(index: state.index));
  }
}
