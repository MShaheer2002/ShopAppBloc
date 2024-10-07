import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc_app/Screens/setting_view/setting_widgets.dart';

import '../../common/common_widgets.dart';
import '../../common/routes/names.dart';
import '../../common/values/constant.dart';
import '../../global.dart';
import '../home_view/Bloc/home_page_bloc.dart';
import 'Bloc/settings_bloc.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  void removeUserData() {
    Global.storageService.remove(Constant.LOGED_IN);
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.SIGNIN,
      (route) => false,
    );
    context.read<HomePageBloc>().add( const HomePageDots(0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Settings"),
      body: SingleChildScrollView(child:
          BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
        return Column(
          children: [
            settingsButton(context, removeUserData)
            // settingsButton(context)
          ],
        );
      })),
    );
  }
}
