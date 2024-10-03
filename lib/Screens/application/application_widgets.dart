import 'package:flutter/cupertino.dart';
import 'package:udemy_bloc_app/Screens/home_view/home_view.dart';

Widget buildPage(int index){
  List<Widget> _widget = [
    HomeView(),
    Center(child: Text("Search"),),
    Center(child: Text("Course"),),
    Center(child: Text("Chat"),),
    Center(child: Text("Profile"),),
  ];
  return _widget[index];

}