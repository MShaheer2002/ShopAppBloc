import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/routes/names.dart';
import '../../common/values/constant.dart';
import '../../global.dart';
import 'Bloc/sign_in_bloc.dart';

class SigninController {
  final BuildContext context;

  SigninController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String passwordAddress = state.password;
        if (emailAddress.isEmpty) {}
        if (passwordAddress.isEmpty) {}
        try {
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: passwordAddress);

          if (credentials.user == null) {}
          if (!credentials.user!.emailVerified) {}
          var user = credentials.user;
          if (user != null) {
            Global.storageService.setBool(Constant.LOGED_IN, true);
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.APPLICATION, (route) => false);
          } else {}
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            print("User not found");
          } else if (e.code == "invalid-email") {
            print("email is invalid");
          } else if (e.code == "wrong-password") {
            print("Invalid Password");
          } else {
            print("Error occurred ${e.code}");
          }
        }
      }
    } catch (e) {}
  }
}
