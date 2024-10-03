import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState("", "", "", "")) {
    on<UserNameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPassword);
  }

  void _usernameEvent(UserNameEvent event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(userName: event.UserName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(emailAddress: event.EmailAddress));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(password: event.Password));
  }

  void _confirmPassword(
      ConfirmPasswordEvent event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(confirmPassword: event.ConfirmPassword));
  }
}
