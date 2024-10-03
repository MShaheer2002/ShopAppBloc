part of 'registration_bloc.dart';

@immutable
class RegistrationState {
  final String userName;
  final String emailAddress;
  final String password;
  final String confirmPassword;

  const RegistrationState(
      this.userName, this.emailAddress, this.password, this.confirmPassword);

  RegistrationState copyWith(
      {String? userName,
      String? emailAddress,
      String? password,
      String? confirmPassword}) {
    return RegistrationState(
        userName ?? this.userName,
        emailAddress ?? this.emailAddress,
        password ?? this.password,
        confirmPassword ?? this.confirmPassword);
  }
}

