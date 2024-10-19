import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class OverlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // or TextDirection.rtl for right-to-left languages
      child: Container(
        color: Colors.red.withOpacity(0.8), // Semi-transparent red background
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Blocked App in Use!",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Logic to close the overlay
                  FlutterOverlayWindow.closeOverlay();
                },
                child: Text("Close Overlay"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
