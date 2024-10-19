import 'package:flutter/material.dart';
import 'package:focus_gaurd/permission/accessibility_permission_handler.dart';// Import the permission handler

class PermissionWidget extends StatefulWidget {
  @override
  _PermissionWidgetState createState() => _PermissionWidgetState();
}

class _PermissionWidgetState extends State<PermissionWidget> {
  bool _isAccessibilityServiceEnabled = false;

  @override
  void initState() {
    super.initState();
    _checkAccessibilityServiceStatus(); // Check the status when the widget initializes
  }

  // Function to check if the accessibility service is enabled
  Future<void> _checkAccessibilityServiceStatus() async {
    bool isEnabled = await PermissionHandler.isAccessibilityServiceEnabled();
    setState(() {
      _isAccessibilityServiceEnabled = isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !_isAccessibilityServiceEnabled
        ? Card(
      color: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 300,
                child: Row(

                  children: [
                    const Icon(Icons.accessibility, color: Colors.white),
                    const SizedBox(width: 8.0),
                    const Text(
                      "Enable Accessibility Permission",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'To track screen time and app launches, please enable the accessibility service.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                PermissionHandler.requestAccessibilityPermission();
              },
              child: Text('Enable Now'),
            ),
          ],
        ),
      ),
    )
        : SizedBox.shrink(); // If permission is enabled, return an empty widget
  }
}
