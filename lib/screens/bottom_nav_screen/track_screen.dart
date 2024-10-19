import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_accessibility_service/accessibility_event.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';
import 'package:focus_gaurd/permission/battery_optimization_widgets.dart';
import 'package:focus_gaurd/services/AppLaunchTracker.dart';
import '../../permission/accessibilty_permission_widget.dart';
import '../../permission/overlay_permission_widget.dart';
import '../../permission/usage_permission_widgets.dart';
import '../../services/ScreenTimeContent.dart';// Import the permission widget

class TrackScreen extends StatefulWidget {
  @override
  _TrackScreenState createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  bool isScreenTimeActive = true; // By default, Screen Time is active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Added padding for better UI spacing
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
              children: [
                UsagePermissionCard(),
                BatteryOptimizationCard(),
                SizedBox(height: 16.0),
                OverlayPermissionCard(),
                SizedBox(height: 16.0),

                // Reusable Permission Widget
                PermissionWidget(), // Use the reusable permission widget here
                SizedBox(height: 16.0), // Spacing between the card and other content
        
                // Text 'Usage Overview'
                Text(
                  'Usage Overview',
                  style: TextStyle(
                    fontSize: 24.0, // Adjust the font size as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0), // Spacing between text and buttons
        
                // Toggle buttons for Screen Time and App Launches
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isScreenTimeActive = true; // Activate Screen Time
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isScreenTimeActive ? Colors.blue : Colors.grey, // Active button styling
                      ),
                      child: Text('Screen Time'),
                    ),
                    SizedBox(width: 10), // Spacing between buttons
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isScreenTimeActive = false; // Activate App Launches
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isScreenTimeActive ? Colors.grey : Colors.blue, // Active button styling
                      ),
                      child: Text('App Launches'),
                    ),
                  ],
                ),
                SizedBox(height: 20.0), // Spacing between buttons and content
        
                // Content Area
                Expanded(
                  child: isScreenTimeActive ? ScreenTimeContent() : AppLaunchTracker(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Dummy content for Screen Time
// class ScreenTimeContent extends StatefulWidget {
//   @override
//   _ScreenTimeContentState createState() => _ScreenTimeContentState();
// }
//
// class _ScreenTimeContentState extends State<ScreenTimeContent> {
//   Map<String, int> _appStartTimes = {};
//   Map<String, int> _appScreenTime = {};
//   int _totalScreenTime = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _startListening();
//   }
//
//   /// Start listening to accessibility events
//   void _startListening() {
//     FlutterAccessibilityService.accessStream.listen((AccessibilityEvent event) {
//       log("Current Event: $event");
//       String appName = event.packageName ?? 'Unknown App';
//       int timestamp = event.eventTime?.millisecondsSinceEpoch ?? 0;
//
//       _handleAppSwitch(appName, timestamp);
//     });
//   }
//
//   /// Handle app switch and track screen time
//   void _handleAppSwitch(String appName, int timestamp) {
//     // If the app was already in the start times map, calculate time spent
//     if (_appStartTimes.containsKey(appName)) {
//       int startTime = _appStartTimes[appName]!;
//       int timeSpent = timestamp - startTime;
//
//       // Update the screen time for this app
//       _appScreenTime.update(appName, (existingTime) => existingTime + timeSpent, ifAbsent: () => timeSpent);
//
//       // Update the total screen time
//       _updateTotalScreenTime();
//     }
//
//     // Update the start time for the new app
//     _appStartTimes[appName] = timestamp;
//   }
//
//   /// Update total screen time
//   void _updateTotalScreenTime() {
//     int total = 0;
//     _appScreenTime.forEach((appName, timeSpent) {
//       total += timeSpent;
//     });
//     setState(() {
//       _totalScreenTime = total;
//     });
//   }
//
//   // @override
//   // void dispose() {
//   //   FlutterAccessibilityService.stopListeningToAccessibilityEvents();
//   //   super.dispose();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Total Screen Time:',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           Text(
//             '${(_totalScreenTime / 1000/60).toStringAsFixed(2)} minutes',
//             style: TextStyle(fontSize: 30, color: Colors.blue),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Tracking screen time...',
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Dummy content for App Launches
// class AppLaunchesContent extends StatelessWidget {
//   final int totalAppLaunches;
//
//   const AppLaunchesContent({Key? key, required this.totalAppLaunches}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Total App Launches: $totalAppLaunches',
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }
