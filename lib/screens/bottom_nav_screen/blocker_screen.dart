import 'package:flutter/material.dart';

import '../../widgets/card_widget.dart';
import '../../widgets/ripple_button.dart';
import '../blocker_sub_screen/app_blocker_screen.dart';
import '../blocker_sub_screen/app_selection_screen.dart';
import '../blocker_sub_screen/notification_blocker_screen.dart';
import '../blocker_sub_screen/reels_blocker_screen.dart';
import '../blocker_sub_screen/web_blocker_screen.dart';

class BlockerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocker'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 650,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // App Blocker
                CustomCardWidget(
                  icon: Icons.mobile_screen_share,
                  title: 'App Blocker',
                  subtitle: 'Block specific apps to stay focused',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppBlockerScreen()),
                    );
                  },
                ),
                SizedBox(height: 16.0),

                // Web Blocker
                CustomCardWidget(
                  icon: Icons.web,
                  title: 'Web Blocker',
                  subtitle: 'Block distracting websites',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WebBlockerScreen()),
                    );
                  },
                ),
                SizedBox(height: 16.0),

                // Notification Blocker
                CustomCardWidget(
                  icon: Icons.notifications_off,
                  title: 'Notification Blocker',
                  subtitle: 'Block notifications during focus time',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotificationBlockerScreen()),
                    );
                  },
                ),
                SizedBox(height: 16.0),

                // Shorts Blocker
                CustomCardWidget(
                  icon: Icons.play_circle_outline,
                  title: 'Shorts Blocker',
                  subtitle: 'Block shorts videos to improve focus',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShortsBlockerScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}