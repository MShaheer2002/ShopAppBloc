part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {
  const RegistrationEvent();
}

class UserNameEvent extends RegistrationEvent {
  final String UserName;

  const UserNameEvent(this.UserName);
}

class EmailEvent extends RegistrationEvent {
  final String EmailAddress;

  const EmailEvent(this.EmailAddress);
}

class PasswordEvent extends RegistrationEvent {
  final String Password;

  const PasswordEvent(this.Password);
}

class ConfirmPasswordEvent extends RegistrationEvent {
  final String ConfirmPassword;

  const ConfirmPasswordEvent(this.ConfirmPassword);
}
