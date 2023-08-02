import 'package:csoc/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'assignment_details.dart';

class AssignmentPage extends StatefulWidget {
  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  bool _status = false;
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xffeb5d1e),
        title: Text(
          "Assignments",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                delay: Duration(milliseconds: 100),
                child: SlideAnimation(
                  duration: Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  horizontalOffset: -300,
                  verticalOffset: -850,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AssignmentDetailsPage(
                            assignmentDescription:
                                "Assignment ${index + 1} description goes here...",
                            isCompleted: _status,
                          ),
                        ),
                      );
                    },
                    child: Container(
                        margin: EdgeInsets.only(bottom: _w / 20),
                        height: _w / 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Assignment ${index + 1}",
                                    style: TextStyle(
                                      color: appBarColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "20/07/2023",
                                    style: TextStyle(
                                      color: appBarColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      (_status == false)
                                          ? _status = true
                                          : _status = false;
                                    });
                                  },
                                  child: Container(
                                      width: 90,
                                      height: 22,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          color: (_status == false)
                                              ? const Color(0xFFECFDF3)
                                              : const Color(0xFFEAECF0)),
                                      child: Center(
                                          child: Text(
                                        (_status == false)
                                            ? AssignmentStatus.completed.name
                                            : AssignmentStatus.pending.name,
                                        style: TextStyle(
                                            color: (_status == false)
                                                ? const Color(0xFF10B981)
                                                : const Color(0xFF374151),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ))))
                            ],
                          ),
                        )),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
