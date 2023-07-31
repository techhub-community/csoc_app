import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RESULTS extends StatelessWidget {
  var ans;
  var col;
  var seg;




  RESULTS(this.ans,this.col,this.seg);

  var bgcolor=Colors.pink.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: col,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CircleAvatar(
                backgroundImage: AssetImage("assets/logo.jpeg"),
                radius: 150,
              ),
              SizedBox(
                height: 21,
              ),




              Text('Result : $ans/10',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
              SizedBox(
                height: 21,
              ),
              Text('${seg}',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),

            ],
          ),
        ),
      ),
    );
  }
}
