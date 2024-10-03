import 'package:flutter/material.dart';

class WelcomeWidgets {
  Column page1(
      BuildContext context,
      double height,
      double width,
      int index,
      String buttonName,
      String title,
      String subTitle,
      String imageUrl,
      PageController pageController) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.45,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: Duration(microseconds: 500),
                  curve: Curves.decelerate);
            } else {
              //   jump to new page
              Navigator.pushNamedAndRemoveUntil(
                  context, "/SignIn", (_) => false);
            }
          },
          child: Container(
            height: height * 0.08,
            width: width * 0.85,
            margin: EdgeInsets.only(top: height * 0.15),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(1, 1),
                      blurRadius: 10,
                      spreadRadius: 4)
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
