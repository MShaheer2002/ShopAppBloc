import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc_app/Screens/Regsitration_view/Bloc/registration_bloc.dart';
import 'package:udemy_bloc_app/Screens/Regsitration_view/registration_screen.dart';
import 'package:udemy_bloc_app/Screens/SignIn_view/Bloc/sign_in_bloc.dart';
import 'package:udemy_bloc_app/Screens/SignIn_view/signIn_view.dart';
import 'package:udemy_bloc_app/Screens/Welcome_view/Bloc/welcome_bloc.dart';
import 'package:udemy_bloc_app/Screens/Welcome_view/welcome_view.dart';
import 'package:udemy_bloc_app/Screens/application/application_page.dart';
import 'package:udemy_bloc_app/common/routes/names.dart';

import '../../Screens/application/Bloc/application_bloc.dart';
import '../../global.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}

class AppPages {
  static List<PageEntity> Routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const WelcomeView(),
          bloc: BlocProvider(create: (context) => WelcomeBloc())),
      PageEntity(
          route: AppRoutes.SIGNIN,
          page: const SigninView(),
          bloc: BlocProvider(create: (context) => SignInBloc())),
      PageEntity(
          route: AppRoutes.REGISTRATION,
          page: const RegistrationScreen(),
          bloc: BlocProvider(create: (context) => RegistrationBloc())),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (context) => ApplicationBloc()),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = [];

    for (var bloc in Routes()) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = Routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool is_device_already_opened =
            Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && is_device_already_opened) {
          bool isLogedIn = Global.storageService.getAlreadyLogedIn();
          if (isLogedIn) {
            return MaterialPageRoute<void>(builder: (context) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute<void>(
              builder: (context) => const SigninView(), settings: settings);
        }

        return MaterialPageRoute(
            builder: (context) => result.first.page, settings: settings);
      }
    }

    return MaterialPageRoute(
        builder: (context) => const SigninView(), settings: settings);
  }
}
