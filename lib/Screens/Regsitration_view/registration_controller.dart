import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc_app/Screens/Regsitration_view/Bloc/registration_bloc.dart';

class RegistrationController {
  final BuildContext context;

  const RegistrationController(this.context);

  Future<void> handleEmailRegistration() async {
    final state = context.read<RegistrationBloc>().state;
    String userName = state.userName;
    String emailAddress = state.emailAddress;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (userName.isEmpty) {
      print("User Name is not provided");
      return;
    }
    if (emailAddress.isEmpty) {
      print("Email is not provided");
      return;
    }
    if (password.isEmpty) {
      print("password is not provided");
      return;
    }
    if (confirmPassword.isEmpty) {
      print("Confirm Password is not provided");
      return;
    }

    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);

      if(credentials.user != null){
        await credentials.user?.sendEmailVerification();
        await credentials.user?.updateDisplayName(userName);
        print("Verfication email has been sended");
        Navigator.pop(context);
      }

    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }
}
