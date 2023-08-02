import 'package:csoc/constants.dart';
import 'package:csoc/csoc/presentation/pages/quiz_section/quiz_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_back_button.dart';
import 'const/text_style.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [gradientColor, darkColor])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CustomBackButton())),
            ),
            SizedBox(height: size.height * 0.1),
            Image.asset("images/badge2.png",
                width: size.width * 0.8, height: size.height * 0.4),
            const SizedBox(height: 20),
            normalText(color: logoColor, size: 18, text: "Welcome to our"),
            headingText(color: logoColor, size: 32, text: "Quiz App"),
            const SizedBox(height: 20),
            normalText(
                color: logoColor,
                size: 16,
                text:
                    "Do you feel confident? Here you'll face our most difficult questions!"),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizScreen()));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  width: size.width - 100,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:
                      headingText(color: logoColor, size: 18, text: "Continue"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
