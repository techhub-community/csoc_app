import 'package:csoc/constants.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color gradColor1;
  final Color gradColor2;
  final Color iconColor;
  const CustomBackButton(
      {Key? key,
      required this.gradColor1,
      required this.gradColor2,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        gradient: LinearGradient(colors: [
          gradColor1,
          gradColor2,
        ]),
      ),
      child: Icon(color: iconColor, Icons.arrow_back),
    );
  }
}
