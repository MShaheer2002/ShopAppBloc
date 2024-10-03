import 'package:flutter/material.dart';

import '../../../common/values/colors.dart';

class Signinwidgets {
  Widget appBar() {
    return AppBar(
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(1.0)),
        centerTitle: true,
        title: Text(
          "Log In",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ));
  }

  Widget buildThirdPartyLogin(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
        padding: EdgeInsets.only(left: 0, right: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _reusableIcons("google"),
            _reusableIcons("apple"),
            _reusableIcons("facebook"),
          ],
        ));
  }

  Widget _reusableIcons(String iconName) {
    return GestureDetector(
      child: SizedBox(
          width: 40,
          height: 40,
          child: Image.asset("assets/icons/$iconName.png", fit: BoxFit.fill)),
      onTap: () {},
    );
  }

  Widget reusableText(String text){
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, String textType,String iconName,void Function(String value) fun){
    return Container(
      width: 325,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17),
            width: 16,
            height: 16,
            child: Image.asset("assets/icons/$iconName.png"),
          ),
          Container(
            width: 280,
            height: 50,
            child: TextField(
              onChanged: (value) => fun(value),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: hintText,
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
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
              autocorrect: false,
              obscureText: textType=="password"?true:false,
            ),
          )
        ],
      ),
    );
  }


  Widget forgotPassword(){
    return Container(
      width: 260,
      height: 44,
      child: GestureDetector(
          child: Text(
            "Forgot password?",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          onTap: () {
          }),
    );
  }

  Widget buildLogInAndRegButton(String buttonName, String buttonType,VoidCallback fun){
    return GestureDetector(
        child: Container(
            width: 325,
            height: 50,
            margin: EdgeInsets.only(top: buttonType=="login"?40:20, left: 0, right: 0),
            decoration: BoxDecoration(
                color:  buttonType=="login"?AppColors.primaryElement:AppColors.primaryBackground,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: buttonType=="login"?Colors.transparent:AppColors.primaryFourElementText)),
            child: Center(
                child: Text(
                  buttonName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: buttonType=="login"?AppColors.primaryElementText:AppColors.primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ))),
        onTap: ()=>fun());
  }
}