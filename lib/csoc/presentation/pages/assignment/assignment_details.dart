import 'package:flutter/material.dart';

import '../../../../constants.dart';

enum AssignmentStatus { completed, pending }

class AssignmentDetailsPage extends StatefulWidget {
  final String assignmentDescription;
  final bool isCompleted;

  AssignmentDetailsPage({
    required this.assignmentDescription,
    required this.isCompleted,
  });

  @override
  State<AssignmentDetailsPage> createState() => _AssignmentDetailsPageState();
}

class _AssignmentDetailsPageState extends State<AssignmentDetailsPage> {
  bool? _isCompleted = false;
  bool _showSubmitButton = false;

  @override
  void initState() {
    super.initState();
    _isCompleted = widget.isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: appBarColor,
        title: const Text(
          "Assignment Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.assignmentDescription,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("Status:"),
                SizedBox(width: 10),
                Checkbox(
                  value: _isCompleted,
                  onChanged: (value) {
                    setState(() {
                      _isCompleted = value;
                      _showSubmitButton = true;
                    });
                  },
                ),
                //todo make enum for status
                Text(_isCompleted!
                    ? AssignmentStatus.completed.name
                    : AssignmentStatus.pending.name),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Assignment details go here...",
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            _isCompleted!
                ? Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Submit"),
                    ),
                  )
                : SizedBox(),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
