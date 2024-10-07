

import 'package:flutter/material.dart';

import '../values/colors.dart';

Widget reusableText(String text,
    {Color color = AppColors.primaryText,
      double fontSize = 16, FontWeight fontWeight=FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(
        color: color, fontWeight: fontWeight, fontSize: fontSize),
  );
}

AppBar buildAppBar(String url) {
  return AppBar(
    title: reusableText(url),
  );
}
Widget listItemContainer(
    String name,
    {double fontSize = 13,
      Color color = AppColors.primaryText,
      fontWeight = FontWeight.bold}) {
  return Container(
    width: 180,
    margin: EdgeInsets.only(left: 6),
    child: Text(
      name,
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
          color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
    ),
  );
}


