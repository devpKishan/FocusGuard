import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class OverlayPermissionCard extends StatefulWidget {
  const OverlayPermissionCard({Key? key}) : super(key: key);

  @override
  _OverlayPermissionCardState createState() => _OverlayPermissionCardState();
}

class _OverlayPermissionCardState extends State<OverlayPermissionCard> {
  bool _isOverlayGranted = true;

  @override
  void initState() {
    super.initState();
    _checkOverlayPermission();
  }

  Future<void> _checkOverlayPermission() async {
    bool isGranted = await FlutterOverlayWindow.isPermissionGranted();
    setState(() {
      _isOverlayGranted = isGranted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !_isOverlayGranted
        ? Card(
      color: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.warning, color: Colors.white),
                const SizedBox(width: 8.0),
                const Text(
                  "Overlay Permission Required",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Please enable overlay permission to block apps.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () async {
                await FlutterOverlayWindow.requestPermission();
                _checkOverlayPermission(); // Re-check after user interaction
              },
              child: const Text('Enable Now'),
            ),
          ],
        ),
      ),
    )
        : Container(); // Return an empty container if overlay permission is granted
  }
}
