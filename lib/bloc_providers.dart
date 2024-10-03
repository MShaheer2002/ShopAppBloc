import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/Regsitration_view/Bloc/registration_bloc.dart';
import 'Screens/SignIn_view/Bloc/sign_in_bloc.dart';
import 'Screens/Welcome_view/Bloc/welcome_bloc.dart';

class BlocProviders{
  static get allBlocProvider=> [
    BlocProvider(create: (context) => WelcomeBloc()),
    BlocProvider(create: (context) => SignInBloc()),
    BlocProvider(create: (context) => RegistrationBloc()),
  ];
}