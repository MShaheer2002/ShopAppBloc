import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc_app/Screens/Regsitration_view/Bloc/registration_bloc.dart';
import 'package:udemy_bloc_app/Screens/Regsitration_view/registration_controller.dart';

import '../../common/common_widgets.dart';
import '../../common/values/colors.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Container(
          color: AppColors.primaryBackground,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.primaryBackground,
              appBar: buildAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: reusableText(
                            "Enter your details below & free sign up")),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User name"),
                          SizedBox(
                            height: 5,
                          ),
                          buildTextField(
                              "Enter your user name", "username", "user",
                              (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(UserNameEvent(value));
                          }),
                          reusableText("Email"),
                          SizedBox(
                            height: 5,
                          ),
                          buildTextField(
                              "Enter your email address", "email", "user",
                              (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(EmailEvent(value));
                          }),
                          reusableText("Password"),
                          SizedBox(
                            height: 5,
                          ),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(PasswordEvent(value));
                          }),
                          reusableText("Re-enter Password"),
                          SizedBox(
                            height: 5,
                          ),
                          buildTextField("Re-enter your password to confirm",
                              "re-password", "lock", (value) {
                            context
                                .read<RegistrationBloc>()
                                .add(ConfirmPasswordEvent(value));
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 260,
                            child: Text(
                              "By creating an account you have to agree with our them & condication.",
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              style: TextStyle(
                                color: AppColors.primaryThreeElementText,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          buildLogInAndRegButton("Sign Up", "login", () {
                            RegistrationController(context).handleEmailRegistration();
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // This trailing comma makes auto-formatting nicer for build methods.
            ),
          ),
        );
      },
    );
  }
}
