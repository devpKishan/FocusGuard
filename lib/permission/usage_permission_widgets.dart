import 'package:flutter/material.dart';
import 'package:usage_stats_new/usage_stats.dart';

class UsagePermissionCard extends StatefulWidget {
  const UsagePermissionCard({Key? key}) : super(key: key);

  @override
  _UsagePermissionCardState createState() => _UsagePermissionCardState();
}

class _UsagePermissionCardState extends State<UsagePermissionCard> {
  bool isPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _checkUsagePermission();
  }

  // Check if the usage access permission is granted
  Future<void> _checkUsagePermission() async {
    bool? granted = await UsageStats.checkUsagePermission();
    setState(() {
      isPermissionGranted = granted ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isPermissionGranted
        ? Container() // Show nothing if permission is granted
        : Card(
      color: Colors.redAccent,
      elevation: 4,
      // margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.warning, color: Colors.white),
                const SizedBox(width: 8.0),
                const Text(
                  "Permission Required",
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
              "Usage access permission is required to continue. Please enable it in the settings.",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                UsageStats.grantUsagePermission();
              },
              child: const Text("Grant Permission"),
            ),
          ],
        ),
      ),
    );
  }
}
