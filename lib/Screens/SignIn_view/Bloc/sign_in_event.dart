part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;

  EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  final String password;

  PasswordEvent(this.password);
}
