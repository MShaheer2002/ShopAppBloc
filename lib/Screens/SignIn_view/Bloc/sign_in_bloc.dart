import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
    print("aeeeeeeemaillllllllllll ${state.email}");
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
