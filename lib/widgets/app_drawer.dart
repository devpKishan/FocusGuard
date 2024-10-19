import 'package:flutter/material.dart';

import '../screens/blocker_sub_screen/app_blocker_screen.dart';
import '../screens/bottom_nav_screen/blocker_screen.dart';
import '../screens/bottom_nav_screen/home_screen.dart';
import '../screens/bottom_nav_screen/profile_screen.dart';
import '../screens/bottom_nav_screen/tips_screen.dart';
import '../screens/bottom_nav_screen/track_screen.dart';
import '../screens/setting_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'FocusGuard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.block),
            title: Text('Blocker'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BlockerScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.track_changes),
            title: Text('Track'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrackScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('Tips'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TipsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
