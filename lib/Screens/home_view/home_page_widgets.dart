

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/values/colors.dart';
import 'Bloc/home_page_bloc.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
      title: Container(
        margin: EdgeInsets.only(left: 7, right: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 18,
              height: 12,
              child: Image.asset("assets/icons/menu.png"),
            ),
            GestureDetector(
              child:Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/person.png")),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
              ),
              onTap:(){

              },
            ),
          ],
        ),
      )
  );
}

Widget homePageText(String text,{Color color=AppColors.primaryText,double top=20}) {
  return Container(
    margin: EdgeInsets.only(bottom: 0, top: top),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
  );
}


Widget searchView() {
  return Container(
    margin: EdgeInsets.only(bottom: 0, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 280,
          height: 40,
          margin: EdgeInsets.only(bottom: 0, top: 0),
          padding: EdgeInsets.only(top: 0, bottom: 0),
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: AppColors.primaryFourElementText)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 17),
                padding: EdgeInsets.only(left: 0, top: 0),
                width: 16,
                height: 16,
                child: Image.asset("assets/icons/search.png"),
              ),
              Container(
                width: 240,
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "Search your course...",
                    hintStyle: TextStyle(
                      color: AppColors.primaryThreeElementText,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                  onChanged: (value) {
                    // controller.state.email.value = value;
                  },
                  maxLines: 1,
                  autocorrect: false, // 自动纠正
                  obscureText: false, // 隐藏输入内容, 密码框
                ),
              )
            ],
          ),
        ),
        GestureDetector(child:Container(
          width: 40,
          height: 40,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset("assets/icons/options.png"),
        ),onTap: (){
        },),
      ],
    ),
  );
}

Widget sliderView(BuildContext context,HomePageState state) {
  return Column(
    children: [
      Container(
        width: 325,
        height: 160,
        margin: EdgeInsets.only(top:20),
        child: PageView(
          onPageChanged: (value){
            context.read<HomePageBloc>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(path:"assets/icons/Art.png"),
            _slidersContainer(path:"assets/icons/Image(1).png"),
            _slidersContainer(path:"assets/icons/Image(2).png"),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 8),
        child: DotsIndicator(
            mainAxisAlignment: MainAxisAlignment.center,
            reversed: false,
            dotsCount: 3,
            position: state.index,
            decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            )),
      )
    ],
  );
}

Widget _slidersContainer({String path = "assets/icons/Art.png"}) {
  return Container(
    width: 325,
    height: 160,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(path),
        fit: BoxFit.fill,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );
}

Widget menuView(BuildContext context, state) {
  return Column(
    children: [
      Container(
          width: 325,
          margin: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 0, top: 0),
                child: Text(
                  "Choice your course",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(child: Container(
                margin: EdgeInsets.only(bottom: 0, top: 0),
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: AppColors.primaryThreeElementText,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                ),
              ),onTap: (){  },)
            ],
          )),
      Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 30),
                padding: EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    border: Border.all(color: AppColors.primaryElement)),
                child: Text(
                  "All",
                  style: TextStyle(
                    color: AppColors.primaryElementText,
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "Popular",
                  style: TextStyle(
                    color: AppColors.primaryThreeElementText,
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                  ),
                ),
              ),

              Container(
                child: Text(
                  "Newest",
                  style: TextStyle(
                    color: AppColors.primaryThreeElementText,
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                  ),
                ),
              )
            ],
          ))
    ],
  );
}

GestureDetector gridView(){
  return GestureDetector(
      child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            image: DecorationImage(
                image:AssetImage("assets/icons/Image(1).png"),
                fit: BoxFit.fill),
            borderRadius:
            BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                    "course",
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(
                      color: AppColors.primaryElementText,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 6),
                  child: Text(
                    "1 Lesson",
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(
                      color:
                      AppColors.primaryFourElementText,
                      fontWeight: FontWeight.normal,
                      fontSize: 8,
                    ),
                  ))
            ],
          )),
      onTap: () {

      });
}
