import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Submission {
  final String title;
  final bool isAttempted;

  Submission(this.title, this.isAttempted);
}

class UiPage extends StatelessWidget {
  final List<PieChartSectionData> pieChartData = [
    PieChartSectionData(
      value: 25,
      color: Colors.orange,
      title: '25%',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      value: 30,
      color: Colors.orangeAccent,
      title: '30%',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: const Color(0xffffffff),
      ),
    ),
    PieChartSectionData(
      value: 45,
      color: Colors.orange,
      title: '45%',
      radius: 60,
      titleStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: const Color(0xffffffff),
      ),
    ),
  ];

  final List<FlSpot> barData = [
    FlSpot(0, 0), // Placeholder for easy
    FlSpot(1, 30), // 30% for medium
    FlSpot(2, 45), // 45% for hard
  ];

  final List<Submission> submissions = [
    Submission('Submission 1', true),
    Submission('Submission 2', true),
    Submission('Submission 3', false),
    Submission('Submission 4', true),
    Submission('Submission 5', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI/UX'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: FractionallySizedBox(
                    widthFactor: 0.6, // Adjust the size of the pie chart
                    heightFactor: 0.6, // Adjust the size of the pie chart
                    child: PieChart(
                      PieChartData(
                        sections: pieChartData,
                        centerSpaceRadius: 50,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Difficulty Levels',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildLevelIndicator('Easy', Colors.orange, 25),
                    _buildLevelIndicator('Medium', Colors.orange, 30),
                    _buildLevelIndicator('Hard', Colors.orange, 45),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'All Submissions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: submissions.map((submission) {
                    return Card(
                      color: Colors.orange,
                      // Background color for each submission box
                      child: ListTile(
                        leading: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: submission.isAttempted
                                ? Colors.white
                                : Colors.white,
                          ),
                        ),
                        title: Text(submission.title),
                        subtitle: Text(submission.isAttempted
                            ? 'Attempted'
                            : 'Unattempted'),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLevelIndicator(String level, Color color, double percentage) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${percentage.toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(level),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UiPage(),
  ));
}
