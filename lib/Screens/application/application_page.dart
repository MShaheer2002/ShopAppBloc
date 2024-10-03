import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/values/colors.dart';
import 'Bloc/application_bloc.dart';
import 'application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
                  body: buildPage(state.index),
                  bottomNavigationBar: Container(
                      width: 375,
                      height: 58,
                      decoration: BoxDecoration(
                        color: AppColors.primaryElement,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: BottomNavigationBar(
                        onTap: (value) {
                          // setState(() {
                          //   _index = value;
                          // });
                          context.read<ApplicationBloc>().add(TriggerIndexEvent(value));
                        },
                        currentIndex: state.index,
                        elevation: 0,
                        type: BottomNavigationBarType.fixed,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        unselectedItemColor: AppColors.primaryFourElementText,
                        selectedItemColor: AppColors.primaryElement,
                        items: [
                          BottomNavigationBarItem(
                            icon: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                "assets/icons/home.png",
                              ),
                            ),
                            activeIcon: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                "assets/icons/home.png",
                                color: AppColors.primaryElement,
                              ),
                            ),
                            label: "home",
                          ),
                          BottomNavigationBarItem(
                            icon: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                "assets/icons/search2.png",
                              ),
                            ),
                            activeIcon: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                "assets/icons/search2.png",
                                color: AppColors.primaryElement,
                              ),
                            ),
                            label: "search",
                          ),
                          BottomNavigationBarItem(
                            icon: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                "assets/icons/play-circle1.png",
                              ),
                            ),
                            activeIcon: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                "assets/icons/play-circle1.png",
                                color: AppColors.primaryElement,
                              ),
                            ),
                            label: "search",
                          ),
                          BottomNavigationBarItem(
                            icon: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                "assets/icons/message-circle.png",
                              ),
                            ),
                            activeIcon: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                "assets/icons/message-circle.png",
                                color: AppColors.primaryElement,
                              ),
                            ),
                            label: "search",
                          ),
                          BottomNavigationBarItem(
                            icon: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                "assets/icons/person2.png",
                              ),
                            ),
                            activeIcon: SizedBox(
                              width: 15,
                              height: 15,
                              child: Image.asset(
                                "assets/icons/person2.png",
                                color: AppColors.primaryElement,
                              ),
                            ),
                            label: "search",
                          ),
                        ],
                      )))),
        );
      },
    );
  }
}
