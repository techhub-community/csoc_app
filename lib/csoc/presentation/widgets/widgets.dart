import 'dart:ui';

import 'package:flutter/material.dart';

class CustomWidgets {
  Widget NeoTextField(IconData icon, String hintText, bool isPassword,
      bool isEmail, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 8,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Color(0xffE9B384).withOpacity(.7),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            style: TextStyle(color: Colors.black),
            cursorColor: Colors.white,
            obscureText: isPassword,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.white,
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget NeoButton(String string, double width, VoidCallback voidCallback,
      BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            height: size.width / 8,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffDFA878).withOpacity(.8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              string,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
