import 'package:flutter/material.dart';

class WebBlockerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Blocker'),
        backgroundColor: Color(0xFF6200EE), // Customize your app bar color
      ),
      body: Container(
        color: Colors.white, // Set background to white
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                // Alert Message
                Container(
                  color: Colors.redAccent,
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    '🚨 Upcoming Features Coming Soon! 🚨',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(height: 30),
                // Feature Cards
                _buildFeatureCard(
                  context,
                  icon: Icons.lock,
                  title: 'Block Specific Sites',
                  description: 'Easily block specific websites that distract you.',
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.timer,
                  title: 'Scheduled Blocking',
                  description: 'Set specific times to block distracting websites.',
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.notifications,
                  title: 'Custom Alerts',
                  description: 'Receive notifications when you try to access blocked sites.',
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.analytics,
                  title: 'Usage Statistics',
                  description: 'Track your web usage and see improvements over time.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon, required String title, required String description}) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Color(0xFF6200EE), // Icon color
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}