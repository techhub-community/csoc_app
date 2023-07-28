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
        backgroundColor: Color(0xffE9B384).withOpacity(0.7),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/profilepic.png'),
                    radius: 75,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
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
                SizedBox(height: 8),
                // Team Section as ExpansionTile (Accordion)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ExpansionTile(
                    title: Container(
                      width: 200, // Adjust this value as per your preference
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          ' Team: $teamName',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    children: teamMembers
                        .map(
                          (teamMember) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          teamMember,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),
                SizedBox(height: 16),
                const Text(
                  'Badges',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    height: 1.2857,
                    color: Color(0xFF4E4039),
                  ),
                ),
                Container(
                  width: 600,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    padding: EdgeInsets.all(16),
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
