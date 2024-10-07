import 'package:flutter/material.dart';
import 'package:udemy_bloc_app/Screens/profile_view/widgets/profile_widgets.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileIconAndEditButton(),
              SizedBox(height: 30),
              //for showing profile name
              Padding(
                padding: EdgeInsets.only(left:25),
                child: buildListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
