import 'package:csoc/csoc/presentation/pages/AuthScreens/forgot_password.dart';
import 'package:csoc/csoc/presentation/pages/assignment/assignment_page.dart';
import 'package:csoc/csoc/presentation/pages/dashboard/dashboard_page.dart';
import 'package:csoc/csoc/presentation/pages/AuthScreens/login_page.dart';
import 'package:csoc/csoc/presentation/pages/quiz_section/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'csoc/presentation/blocs/dummy.dart';

void main() {
  runApp(const Csoc());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class Csoc extends StatelessWidget {
  const Csoc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider<Dummy>(create: (context) => Dummy()),
      ],
      child: MaterialApp(
        title: 'CSOC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true, //todo: 1) change the theme
        ),
        home: QuizApp(),
        //initialRoute:DashboardPage.id,
        routes: {
          DashboardPage.id: (context) => const DashboardPage(),
        }, //todo: follow the named routing across the project
      ),
    );
  }
}

//Pragya: feel free to add loads of comments explaining everyone why u did what you did and mention ur name too if u r cool with it


