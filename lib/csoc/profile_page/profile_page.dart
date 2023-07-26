import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String teamName;
  final List<String> teamMembers;
  final List<String> badge;
  final String profilePictureUrl;

  ProfilePage({
    required this.name,
    required this.teamName,
    required this.teamMembers,
    required this.badge,
    required this.profilePictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Container(
        color: Color(0xfffef8f5),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/heroimg.png',
                  height: 150,
                ),
                SizedBox(height: 16),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    height: 1.2857,
                    color: Color(0xFF4E4039),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xfffef8f5),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "TEAM A1",
                      style: TextStyle(
                        color: Color(0xFF4E4039),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Team Members: ${teamMembers.join(", ")}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                const Text(
                  'Badge',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    height: 1.2857,
                    color: Color(0xFF4E4039),
                  ),
                ),
                Image.asset(
                  'images/star.png',
                  height: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
