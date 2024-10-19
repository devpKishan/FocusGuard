import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart'; // Import the AppDrawer

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'How can we assist you?',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 20),

            // Frequently Asked Questions Section
            Text(
              'Frequently Asked Questions (FAQs)',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            SizedBox(height: 10),
            ExpansionTile(
              title: Text('How do I reset my password?'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'To reset your password, go to Settings > Account > Reset Password.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('How can I contact support?'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'You can reach us by email at support@focusguard.com or call us at +1234567890.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('How do I block distracting apps?'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'To block distracting apps, go to Blocker in the app menu and select the apps you want to block.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Contact Us Section
            Text(
              'Still need help?',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.email, color: Theme.of(context).primaryColor),
              title: Text('Email Us'),
              subtitle: Text('support@focusguard.com'),
              onTap: () {
                // Implement email feature or show email client
              },
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Theme.of(context).primaryColor),
              title: Text('Call Us'),
              subtitle: Text('+1234567890'),
              onTap: () {
                // Implement phone call feature
              },
            ),
            SizedBox(height: 20),

            // Usage Tips Section
            Text(
              'Tips to Get the Most Out of FocusGuard',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.access_time, color: Theme.of(context).primaryColor),
              title: Text('Set Scheduled Downtime'),
              subtitle: Text('Use the downtime feature to block social media during work or sleep hours.'),
            ),
            ListTile(
              leading: Icon(Icons.track_changes, color: Theme.of(context).primaryColor),
              title: Text('Track App Usage'),
              subtitle: Text('Monitor your app usage to understand where your time goes and improve focus.'),
            ),
            ListTile(
              leading: Icon(Icons.notifications_off, color: Theme.of(context).primaryColor),
              title: Text('Enable Focus Mode'),
              subtitle: Text('Activate Focus Mode to silence notifications and stay on track.'),
            ),
          ],
        ),
      ),
    );
  }
}
