import 'package:csoc/constants.dart';
import 'package:csoc/csoc/presentation/pages/quiz_section/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_back_button.dart';

class RESULTS extends StatelessWidget {
  var ans;

  var seg;

  RESULTS(this.ans, this.seg);

  var bgcolor = Colors.pink.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      body: Container(
        color: appBarColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QuizApp())),
                      child: CustomBackButton())),
              SizedBox(
                height: 150,
              ),
              Text(
                'Quiz Completed',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                'Result : $ans/10',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                '${seg}',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
