import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/values/colors.dart';
import './home_page_widgets.dart';
import 'Bloc/home_page_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: CustomScrollView(
        slivers: [
          // hello
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 25,
              ),
              sliver: SliverToBoxAdapter(
                  child: homePageText("Hello,",
                      color: AppColors.primaryThreeElementText, top: 20))),

          // shaheer
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 25,
              ),
              sliver: SliverToBoxAdapter(
                child: homePageText("Shaheer",
                    color: AppColors.primaryText, top: 5),
              )),

          // search bar
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 25,
              ),
              sliver: SliverToBoxAdapter(
                child: searchView(),
              )),

          // slider
          BlocBuilder<HomePageBloc, HomePageState>(
            buildWhen: (previous, current) => previous.index != current.index,
            builder: (context, state) {
              return SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 25,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: sliderView(context, state),
                  ));
            },
          ),

          // menu text and tags
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 25,
              ),
              sliver: SliverToBoxAdapter(child: menuView())),

          // grid view
          SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 25,
              ),
              sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.6,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return gridView();
                    },
                    childCount: 6,
                  ))),
        ],
      ),
    );
  }
}
