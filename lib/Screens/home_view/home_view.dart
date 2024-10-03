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
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 25,
                  ),
                  sliver: SliverToBoxAdapter(
                      child: homePageText(
                          "Hello,", color: AppColors.primaryThreeElementText,
                          top: 20)
                  )
              ),
              SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 25,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: homePageText(
                        "Dbestech", color: AppColors.primaryText, top: 5),
                  )
              ),
              SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 25,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: searchView(),
                  )
              ),

              SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 25,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: sliderView(context, state),
                  )
              ),
              SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 25,
                  ),
                  sliver: SliverToBoxAdapter(
                      child: menuView(context, state)
                  )
              ),

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
          );
        },
      ),
    );
  }
}
