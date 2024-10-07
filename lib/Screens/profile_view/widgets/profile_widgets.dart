



import 'package:flutter/material.dart';

import '../../../common/common_widgets.dart';
import '../../../common/routes/names.dart';
import '../../../common/values/colors.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 18,
              height: 12,
              child: Image.asset("assets/icons/menu.png")),
          reusableText("Profile"),
          SizedBox(
              width: 24,
              height: 24,
              child: Image.asset("assets/icons/more-vertical.png")),
        ],
      ),
    ),
  );
}

//profile icon and edit button
Widget profileIconAndEditButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6),
    width: 80,
    height: 80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage("assets/icons/headpic.png"))),
    child: Image(
      width: 25,
      height: 25,
      image: const AssetImage("assets/icons/edit_3.png"),
    ),
  );
}

//setting sections buttons
var imagesInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "love": "heart(1).png",
  "Reminders": "cube.png"
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
            (index) => GestureDetector(
          onTap: (){

              Navigator.of(context).pushNamed(AppRoutes.SETTINGS);

          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryElement),
                  child: Image.asset(
                      "assets/icons/${imagesInfo.values.elementAt(index)}"),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(imagesInfo.keys.elementAt(index),
                    style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))
              ],
            ),
          ),
        ),
      )
    ],
  );
}