import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:usage_stats_new/usage_stats.dart';
// import 'package:usage_stats_new/usage_stats_new.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'database_helper.dart';
// import 'your_database_helper_file.dart'; // Import your DatabaseHelper
import 'overlay_widget.dart'; // Import the overlay widget

void startBackgroundService() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the service
  FlutterBackgroundService.initialize(onStart);
}

void onStart() {
  Timer.periodic(Duration(seconds: 5), (timer) async {
    bool isPermission = (await UsageStats.checkUsagePermission()) ?? false;

    if (!isPermission) {
      await UsageStats.grantUsagePermission();
    } else {
      DateTime endDate = DateTime.now();
      DateTime startDate = DateTime(endDate.year, endDate.month, endDate.day, 0, 0, 0);

      List<UsageInfo> usageStats = await UsageStats.queryUsageStats(startDate, endDate);

      if (usageStats.isNotEmpty) {
        UsageInfo lastUsedApp = usageStats[usageStats.length - 1];

        DatabaseHelper db = DatabaseHelper();
        List<String> blockedApps = await db.getBlockedApps();

        if (blockedApps.contains(lastUsedApp.packageName)) {
          // Show overlay if a blocked app is in use
          await showOverlay();
        }
      }
    }
  });
}

Future<void> showOverlay() async {
  // Check if overlay permission is granted
  final bool permissionGranted = await FlutterOverlayWindow.isPermissionGranted();

  if (!permissionGranted) {
    await FlutterOverlayWindow.requestPermission();
  } else {
    // Open the overlay
    await FlutterOverlayWindow.showOverlay(
      overlayTitle: "Overlay Activated",
      overlayContent: "Blocked app in use!",
    );

    // Here, you can set up a listener for overlay events
    FlutterOverlayWindow.overlayListener.listen((event) {
      print("Overlay event: $event");
    });
  }
}
