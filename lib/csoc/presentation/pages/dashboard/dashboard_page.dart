import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/dummy.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const String id= "Dashboard";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>Dummy(),child:const DashBoardView(),);
  }
}

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<Dummy,int>(
        listener: (context,state){},
        builder: (context,state){
          final dummyCount=context.watch<Dummy>();
          return Center(
            child: Column(
              children: [
                Text("Hello ${state} \n don't delete any code comment it out for future ref \n"),
                ElevatedButton(
                  onPressed: () {
                    dummyCount.inc();
                  },
                  child: Text('Increment'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
