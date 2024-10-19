import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart'; // Import the AppDrawer

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Name
              Center(
                child: Text(
                  'FocusGuard',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Short Description
              Center(
                child: Text(
                  'Your companion for achieving a balanced digital life. Stay productive, block distractions, and focus on what matters.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Features or Information Section
              _buildFeatureSection(
                context,
                icon: Icons.shield_rounded,
                title: 'Customizable Blocker',
                description: 'Block apps or websites to help you focus on important tasks.',
              ),
              _buildFeatureSection(
                context,
                icon: Icons.track_changes,
                title: 'Usage Tracking',
                description: 'Track time spent on apps and visualize usage patterns.',
              ),
              _buildFeatureSection(
                context,
                icon: Icons.notifications_off,
                title: 'Focus Mode',
                description: 'Enable Focus Mode to silence distractions during work or study sessions.',
              ),
              _buildFeatureSection(
                context,
                icon: Icons.timeline_rounded,
                title: 'Progress Reports',
                description: 'View detailed reports and track your productivity over time.',
              ),

              // Our Mission Section
              SizedBox(height: 30),
              Text(
                'Our Mission',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'At FocusGuard, we aim to help users develop healthier digital habits by providing tools to monitor and control screen time, block distractions, and promote productivity.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[700],
                ),
              ),

              // Footer
              SizedBox(height: 30),
              Divider(),
              Center(
                child: Text(
                  '© 2024 FocusGuard. All rights reserved.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable method for building feature sections
  Widget _buildFeatureSection(BuildContext context, {required IconData icon, required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 30),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
