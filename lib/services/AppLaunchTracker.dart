import 'package:flutter/material.dart';
import 'package:flutter_accessibility_service/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_accessibility_service/accessibility_event.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';
import 'dart:developer';

// Global variable to store total app launches accessible from anywhere
int totalAppLaunchesGlobal = 0;

class AppLaunchTracker extends StatefulWidget {
  @override
  _AppLaunchTrackerState createState() => _AppLaunchTrackerState();
}

class _AppLaunchTrackerState extends State<AppLaunchTracker> {
  @override
  void initState() {
    super.initState();
    _loadAppLaunches(); // Load saved app launches
    _startListening(); // Start listening for app launch events
  }

  /// Load saved app launches from SharedPreferences
  Future<void> _loadAppLaunches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      totalAppLaunchesGlobal = prefs.getInt('totalAppLaunches') ?? 0; // Load or initialize
    });
  }

  /// Save app launches to SharedPreferences
  Future<void> _saveAppLaunches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('totalAppLaunches', totalAppLaunchesGlobal); // Save current launches
  }

  void _startListening() {
    FlutterAccessibilityService.accessStream.listen((AccessibilityEvent event) {
      log("Current Event: $event");
      if (event.eventType == EventType.typeWindowStateChanged) {
        // Increment the app launches count when a new app window is detected
        totalAppLaunchesGlobal++;
        _saveAppLaunches(); // Save launches after incrementing
        setState(() {}); // Update the UI
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Added SingleChildScrollView for scrolling support
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15), // Padding at the top

              // Title
              Text(
                'Total App Launches',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20), // Spacing after title

              // Circular Indicator to represent app launches
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        value: totalAppLaunchesGlobal > 0
                            ? totalAppLaunchesGlobal / 100
                            : 0.01, // Progress indicator, adjust as per range
                        strokeWidth: 8,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    // Display the number of launches in the center of the progress indicator
                    Text(
                      '$totalAppLaunchesGlobal',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 40), // Spacing below the progress indicator
              //
              // // Display App Launch Count
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Text(
              //     'Total App Launches Recorded',
              //     style: TextStyle(
              //       fontSize: 22,
              //       color: Colors.black54,
              //     ),
              //   ),
              // ),

              // Call to Action Card
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.bar_chart,
                        size: 50,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Keep tracking your app usage',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
