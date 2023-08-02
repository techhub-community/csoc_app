import 'package:csoc/constants.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        gradient: LinearGradient(colors: [
          gradientColor,
          darkColor,
        ]),
      ),
      child: Icon(color: Colors.white, Icons.arrow_back),
    );
  }
}
