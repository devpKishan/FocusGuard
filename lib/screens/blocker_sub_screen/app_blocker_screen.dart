import 'package:flutter/material.dart';

import '../bottom_nav_screen/track_screen.dart';
import 'app_selection_screen.dart';
import 'blocked_apps_screen.dart';

class AppBlockerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Blocker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _buildCard(
              context,
              title: 'Select to Block',
              description: 'Choose apps to block',
              icon: Icons.block, // Add an icon
              onTap: () {
                // Navigate to the Select to Block screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppSelectionScreen()),
                );
              },
            ),
            SizedBox(height: 20.0), // Add space between cards
            _buildCard(
              context,
              title: 'Blocked Apps',
              description: 'View apps you have blocked',
              icon: Icons.cancel, // Add an icon
              onTap: () {
                // Navigate to the Blocked Apps screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlockedAppsScreen()),
                );
              },
            ),
            SizedBox(height: 20.0), // Add space between cards
            _buildCard(
              context,
              title: 'Statistics',
              description: 'View app usage statistics',
              icon: Icons.bar_chart, // Add an icon
              onTap: () {
                // Navigate to the Statistics screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrackScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required String title, required String description, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(icon, size: 40.0), // Display the icon
              SizedBox(width: 16.0), // Add space between icon and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      description,
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
