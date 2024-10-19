import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';

class PermissionHandler {
  // Function to check if the accessibility service is enabled
  static Future<bool> isAccessibilityServiceEnabled() async {
    return await FlutterAccessibilityService.isAccessibilityPermissionEnabled();
  }

  // Function to request accessibility permission
  static void requestAccessibilityPermission() {
    FlutterAccessibilityService.requestAccessibilityPermission();
  }
}
