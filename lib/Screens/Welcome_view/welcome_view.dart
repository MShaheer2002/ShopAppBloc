import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_bloc_app/Screens/Welcome_view/widgets/widget.dart';

import 'Bloc/welcome_bloc.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    PageController pageController = PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: BlocBuilder<WelcomeBloc, WelcomeState>(
            builder: (context, state) {
              return Stack(
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                     BlocProvider.of<WelcomeBloc>(context).add( WelcomeEvent());
                      state.index = index;
                    },
                    children: [
                      WelcomeWidgets().page1(
                          context,
                          height,
                          width,
                          1,
                          "NEXT",
                          "First See Learning",
                          "Forgot about a for of paper all knowledge in one learning",
                          "assets/images/reading.png",pageController),
                      WelcomeWidgets().page1(
                          context,
                          height,
                          width,
                          2,
                          "NEXT",
                          "Connect with Everyone",
                          "Always keep in touch with your tutor & friends. Lets get connected",
                          "assets/images/boy.png",pageController),
                      WelcomeWidgets().page1(
                          context,
                          height,
                          width,
                          3,
                          "Get Started",
                          "Always Fascinated learning",
                          "Anywhere anytime. The time is at our discretion so study whenever you want",
                          "assets/images/man.png",pageController),
                    ],
                  ),
                  Positioned(
                    left: 1,
                    right: 1,
                    bottom: height * 0.14,
                    child: DotsIndicator(
                      position: state.index,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.blue,
                          size: const Size.square(8),
                          activeSize: Size(18, 8),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
