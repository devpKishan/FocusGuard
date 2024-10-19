import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';
import '../about_screen.dart';
import '../feedback_screen.dart';
import '../help_screen.dart'; // Import the HelpScreen

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false, // Removes the default back button
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Editable Profile Picture
            GestureDetector(
              onTap: () {
                // Implement change profile picture functionality
              },
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.png'), // Placeholder image
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 20,
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Editable Name Field
            TextFormField(
              initialValue: 'Kishan', // Pre-filled user name
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.edit),
              ),
              onChanged: (value) {
                // Implement name update functionality
              },
            ),
            SizedBox(height: 30),

            // About Us Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
                title: Text('About Us'),
                onTap: () {
                  _navigateToAboutScreen(context); // Call function to go to AboutScreen
                },
              ),
            ),
            SizedBox(height: 10),

            // Feedback Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.feedback_outlined, color: Theme.of(context).primaryColor),
                title: Text('Feedback'),
                onTap: () {
                  _navigateToFeedbackScreen(context); // Call function to go to FeedbackScreen
                },
              ),
            ),
            SizedBox(height: 10),

            // Help Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.help_outline, color: Theme.of(context).primaryColor),
                title: Text('Help'),
                onTap: () {
                  _navigateToHelpScreen(context); // Call function to go to HelpScreen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to navigate to AboutScreen
  void _navigateToAboutScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => AboutScreen(),
    ));
  }

  // Function to navigate to FeedbackScreen
  void _navigateToFeedbackScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => FeedbackScreen(),
    ));
  }

  // Function to navigate to HelpScreen
  void _navigateToHelpScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => HelpScreen(),
    ));
  }
}
