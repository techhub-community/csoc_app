import 'dart:async';

//import 'package:demo_application/api_services.dart';
//import 'package:demo_application/const/colors.dart';
//import 'package:demo_application/const/images.dart';
//import 'package:demo_application/const/text_style.dart';

import 'package:csoc/constants.dart';
import 'package:csoc/csoc/presentation/pages/quiz_section/resultscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_services.dart';

import 'const/text_style.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;
  bool isAnswered = false;
  int seconds = 60;
  Timer? timer;
  late Future quiz;

  int points = 0;

  var isLoaded = false;

  var optionsList = [];

  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  @override
  void initState() {
    super.initState();
    quiz = getQuiz();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  resetColors() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          gotoNextQuestion();
        }
      });
    });
  }

  gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    seconds = 60;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [darkColor, gradientColor],
        )),
        child: FutureBuilder(
          future: quiz,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data["results"];

              if (isLoaded == false) {
                optionsList = data[currentQuestionIndex]["incorrect_answers"];
                optionsList.add(data[currentQuestionIndex]["correct_answer"]);
                optionsList.shuffle();
                isLoaded = true;
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                  child: Text(
                                "Exit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            normalText(
                                color: Colors.white,
                                size: 24,
                                text: "$seconds"),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: CircularProgressIndicator(
                                value: seconds / 60,
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      width: size.width,
                      child: ListView.builder(
                        itemCount: data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CircleAvatar(
                              backgroundColor: currentQuestionIndex == index
                                  ? Colors.white
                                  : Colors.transparent,
                              child: Text("${index + 1}"));
                        },
                      ),
                    ),
                    // Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: normalText(
                    //         color: logoColor,
                    //         size: 18,
                    //         text:
                    //             "Question ${currentQuestionIndex + 1} of ${data.length}")),
                    const SizedBox(height: 20),
                    normalText(
                        color: Colors.white,
                        size: 20,
                        text: data[currentQuestionIndex]["question"]),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: optionsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var answer =
                            data[currentQuestionIndex]["correct_answer"];

                        return GestureDetector(
                          onTap: !isAnswered
                              ? () {
                                  setState(() {
                                    isAnswered = true;

                                    if (answer.toString() ==
                                        optionsList[index].toString()) {
                                      optionsColor[index] = Colors.green;
                                      points = points + 1;
                                    } else {
                                      optionsColor[index] = Colors.green;
                                    }

                                    if (currentQuestionIndex <
                                        data.length - 1) {
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        gotoNextQuestion();
                                        isAnswered = false;
                                      });
                                    } else {
                                      timer!.cancel();
                                      if (points > 7) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => RESULTS(
                                                    points, 'WellDone!!')));
                                      } else if (points < 5) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => RESULTS(
                                                    points,
                                                    'Better Luck Next Time')));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RESULTS(points, 'Good!!')));
                                      }
                                    }
                                  });
                                }
                              : null,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            alignment: Alignment.center,
                            width: size.width - 100,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: optionsColor[index],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: headingText(
                              color: Colors.orange,
                              size: 18,
                              text: optionsList[index].toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
