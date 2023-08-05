import 'package:csoc/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String teamName;
  final List<String> teamMembers;
  final List<String> badge;
  final String profilePictureUrl;

  const ProfilePage({
    super.key,
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
        backgroundColor: appBarColor,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/profilepic.png'),
                    radius: 75,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 16), //set according to media query
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    height: 1.2857,
                    color: Color(0xFF4E4039),
                  ),
                ),
                const SizedBox(height: 8),
                // Team Section as ExpansionTile (Accordion)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ExpansionTile(
                    title: Container(
                      width: 200, // Adjust this value as per your preference
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        //todo: Update the ui of the team section
                        child: Text(
                          '$teamName',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    children: teamMembers
                        .map(
                          (teamMember) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0, // Add horizontal padding to align left
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            teamMember,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '   Badges:',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      height: 1.2857,
                      color: Color(0xFF4E4039),
                    ),
                  ),
                ),
                //TODO: change the badges
                Container(
                  width: 600,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildBadgeContainer('images/badge1.png'),
                      _buildBadgeContainer('images/badge2.png'),
                      _buildBadgeContainer('images/badge3.png'),
                      _buildBadgeContainer('images/badge4.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //keep inside widgets directory
  Widget _buildBadgeContainer(String badgeImageAsset) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          badgeImageAsset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
