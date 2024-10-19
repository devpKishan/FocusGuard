import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:focus_gaurd/screens/blocker_sub_screen/background_service.dart';
import 'package:focus_gaurd/screens/blocker_sub_screen/overlay_widget.dart';
import 'app.dart';


void main() {
  // Start the background service
  // startBackgroundService();

  runApp(MyApp());
}

// This should be in the same file
@pragma('vm:entry-point') // This is important
void overlayMain() async {
  runApp(OverlayWidget());
}