import 'package:flutter/cupertino.dart';
import 'package:udemy_bloc_app/Screens/home_view/home_view.dart';
import 'package:udemy_bloc_app/Screens/profile_view/profile_view.dart';
import 'package:udemy_bloc_app/Screens/setting_view/settings_view.dart';

Widget buildPage(int index){
  List<Widget> _widget = [
    HomeView(),
    Center(child: Text("Search"),),
    Center(child: Text("Course"),),
    Center(child: Text("Chat"),),
    ProfileView(),

  ];
  return _widget[index];

}