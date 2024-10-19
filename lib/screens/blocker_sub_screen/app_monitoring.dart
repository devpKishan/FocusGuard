import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_accessibility_service/constants.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';
import 'database_helper.dart';
import 'overlay_widget.dart'; // Import your OverlayWidget here

class AppMonitoringScreen extends StatefulWidget {
  @override
  _AppMonitoringScreenState createState() => _AppMonitoringScreenState();
}

class _AppMonitoringScreenState extends State<AppMonitoringScreen> {
  List<String> _blockedApps = [];
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _fetchBlockedApps();
    _startMonitoring();
  }

  // Fetch blocked apps from the database
  void _fetchBlockedApps() async {
    var apps = await _databaseHelper.getBlockedApps();
    setState(() {
      _blockedApps = apps;
    });
  }

  // Start monitoring using accessibility service
  void _startMonitoring() async {
    bool isEnabled = await FlutterAccessibilityService.isAccessibilityPermissionEnabled();
    if (!isEnabled) {
      await FlutterAccessibilityService.requestAccessibilityPermission();
    } else {
      _listenToAccessibilityEvents();
    }
  }

  // Listen to accessibility events
  void _listenToAccessibilityEvents() {
    FlutterAccessibilityService.accessStream.listen((event) {
      log("Current Event: ${event.packageName}");

      // Check if the current app is in the blocked list
      if (event.eventType == EventType.typeWindowStateChanged && _blockedApps.contains(event.packageName)) {
        _showOverlay();
      }
    });
  }

  // Show the custom overlay using flutter_overlay_window
  void _showOverlay() async {
    try {
      await FlutterOverlayWindow.showOverlay(
        height: 200,
        width: 200,
        alignment: OverlayAlignment.center,
        enableDrag: true,
        flag: OverlayFlag.defaultFlag,
      );
      print("Overlay should be showing");
    } catch (e) {
      print("Failed to show overlay: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monitoring Apps')),
      body: Center(
        child: Text(
          'Monitoring blocked apps...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
