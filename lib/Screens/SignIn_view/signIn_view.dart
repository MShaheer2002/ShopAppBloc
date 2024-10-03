import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc_app/Screens/SignIn_view/Bloc/sign_in_bloc.dart';
import 'package:udemy_bloc_app/Screens/SignIn_view/signIn_controller.dart';
import './widgets/signInWidgets.dart';


class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    double appbarHeight = AppBar().preferredSize.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: Signinwidgets().appBar(),
        preferredSize: Size(double.infinity, appbarHeight),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Signinwidgets().buildThirdPartyLogin(context),
            Center(
                child: Signinwidgets()
                    .reusableText("Or use your email account to login")),
            Container(
              margin: EdgeInsets.only(top: 66),
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Signinwidgets().reusableText("Email"),
                  SizedBox(height: 5),
                  Signinwidgets().buildTextField(
                    "Enter your email address",
                    "email",
                    "user",
                    (value) {
                      context.read<SignInBloc>().add(EmailEvent(value));
                    },
                  ),
                  Signinwidgets().reusableText("Password"),
                  SizedBox(height: 5),
                  Signinwidgets().buildTextField(
                    "Enter your password",
                    "password",
                    "lock",
                    (value) {
                      context.read<SignInBloc>().add(PasswordEvent(value));
                    },
                  ),
                  SizedBox(height: 20),
                  Signinwidgets().forgotPassword(),
                  Signinwidgets().buildLogInAndRegButton("Log In", "login",() {
                   SigninController(context: context).handleSignIn("email");
                  },),
                  Signinwidgets()
                      .buildLogInAndRegButton("Register", "register",() {
                        Navigator.pushNamed(context, "/register");
                      },),
                ],
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
