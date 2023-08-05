import 'package:csoc/csoc/presentation/pages/quiz_section/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile_page/profile_page.dart';
import '../../../resources/resources.dart';
import '../../blocs/dummy.dart';
import '../AppDev/App_section.dart';
import '../DSA/Dsa_section.dart';
import '../UI/UI_sec.dart';
import '../WebDev/Web_section.dart';
import '../assignment/assignment_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const String id = "Dashboard";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Dummy(),
      child: const DashBoardView(),
    );
  }
}

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

void _goToSubmissionsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DsaPage(),
    ),
  );
}

void _goToWebPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => WebPage(),
    ),
  );
}

void _goToAppPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AppPage(),
    ),
  );
}

void _goToUiPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UiPage(),
    ),
  );
}

class _DashBoardViewState extends State<DashBoardView> {
  void _goToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          name: 'Arunita Sahu',
          // Replace with the actual name
          teamName: 'TEAM A1',
          // Replace with the actual team name
          teamMembers: ['Alice', 'Bob', 'Charlie', 'Anna'],
          // Replace with the actual team members
          badge: ['Gold Badge', 'Silver Badge', 'Bronze Badge'],
          // Replace with the actual badges
          profilePictureUrl: 'https://example.com/profile-picture.jpg',
          // Replace with the actual profile picture URL
        ),
      ),
    );
  }

  void _goToResourcesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResourcesPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      //todo: add navbar and all elevated buttons , add image (heroimg)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _goToSubmissionsPage(context),
              // Navigate to submissions page on button press
              child: Text('Dsa Section'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _goToAppPage(context),
              // Navigate to submissions page on button press
              child: Text('App Section'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _goToUiPage(context),
              // Navigate to submissions page on button press
              child: Text('Ui Section'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _goToWebPage(context),
              // Navigate to submissions page on button press
              child: Text('Web Section'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _goToProfilePage(context),
              // Navigate to profile page on button press
              child: Text('View Profile'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _goToResourcesPage(context),
              // Navigate to resources page on button press
              child: Text('View Resources'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AssignmentPage()));
              },
              // Navigate to resources page on button press
              child: Text('View Assignments'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizApp()));
              },
              // Navigate to resources page on button press
              child: Text('quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
