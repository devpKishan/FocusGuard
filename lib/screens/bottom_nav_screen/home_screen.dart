import 'package:flutter/material.dart';
import 'package:focus_gaurd/screens/blocker_sub_screen/notification_blocker_screen.dart';
import 'package:focus_gaurd/widgets/app_drawer.dart';

import '../../services/ScreenTimeContent.dart';
import '../../services/pomodoro_timer.dart';
import '../../widgets/ripple_button.dart';
import '../blocker_sub_screen/app_blocker_screen.dart';
import '../blocker_sub_screen/app_selection_screen.dart';
import '../blocker_sub_screen/blocked_apps_screen.dart';
import '../blocker_sub_screen/reels_blocker_screen.dart';
import '../blocker_sub_screen/web_blocker_screen.dart';
import '../../services/AppLaunchTracker.dart';
import 'blocker_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> tips = [
    'Stay focused by blocking distracting apps.',
    'Take regular breaks to enhance productivity.',
    'Set specific goals for your study sessions.',
    'Use timers to manage your time effectively.',
    'Keep your workspace organized and free of clutter.',
    'Limit your screen time before bed.',
    'Use apps that promote concentration.',
    'Practice mindfulness and meditation.',
    'Plan your day the night before.',
    'Reward yourself after completing tasks.',
    'Eliminate notifications during focus time.',
    'Use the Pomodoro Technique for studying.',
    'Create a designated study space.',
    'Stay hydrated and eat healthy snacks.',
    'Avoid multitasking for better focus.',
    'Review your day to improve tomorrow.',
    'Listen to focus-enhancing music.',
    'Set boundaries with friends and family during work hours.',
    'Use visual aids to organize thoughts.',
    'Reflect on your progress regularly.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FocusGaurd'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          height: 1250,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Centered RippleIconButton
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        // Navigate to AppSelectionScreen when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AppSelectionScreen()),
                        );
                      },
                      child: RippleIconButton(
                        icon: Icons.power_settings_new,
                        activeColor: Colors.red,
                        inactiveColor: Colors.greenAccent,
                        activeText: 'Activated',
                        inactiveText: 'Tap to Quick Block',
                        size: 80.0,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                PomodoroCard(),

                // Card with Four Buttons (2 in each row)
                Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BlockerScreen()),
                            );
                          },
                          child: Text(
                            'Blockers',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => AppSelectionScreen()),
                                );
                              },
                              child: Text('App Blocker'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShortsBlockerScreen()),
                                );
                              },
                              child: Text('Shorts Blocker'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10), // Spacing between rows
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WebBlockerScreen()),
                                );
                              },
                              child: Text('Website Blocker'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NotificationBlockerScreen()),
                                );
                              },
                              child: Text('Notification'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Card with Stats
                Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Statistics',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Screen Time:', style: TextStyle(fontSize: 16)),
                            Text('${(totalScreenTimeGlobal / 1000 / 60 / 60).toStringAsFixed(2)} hours', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total App Launches:', style: TextStyle(fontSize: 16)),
                            Text(totalAppLaunchesGlobal.toString(), style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Horizontal scrolling tips card
                Container(
                  height: 120, // Set height for the tips card
                  width: double.infinity, // Ensure it doesn't exceed the screen width
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tips.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 200, // Fixed width for each tip card
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue.shade300, Colors.blue.shade700],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              tips[index],
                              style: TextStyle(fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
