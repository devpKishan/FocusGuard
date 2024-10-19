import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usage_stats_new/usage_stats.dart';
import 'dart:convert';

// Global variable to store total screen time accessible from anywhere
int totalScreenTimeGlobal = 0;

class ScreenTimeContent extends StatefulWidget {
  @override
  _ScreenTimeContentState createState() => _ScreenTimeContentState();
}

class _ScreenTimeContentState extends State<ScreenTimeContent> {
  Map<String, int> _appScreenTime = {}; // Store screen time (milliseconds) for each app
  static const int maxScreenTime = 24 * 60 * 60 * 1000; // 24 hours in milliseconds

  @override
  void initState() {
    super.initState();
    _loadScreenTimeData(); // Load saved screen time
    _fetchAppUsageStats(); // Fetch app usage stats initially
  }

  /// Load saved screen time data from SharedPreferences
  Future<void> _loadScreenTimeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      totalScreenTimeGlobal = prefs.getInt('totalScreenTime') ?? 0;

      // Load app-specific screen times
      String? appScreenTimeString = prefs.getString('appScreenTime');
      if (appScreenTimeString != null) {
        Map<String, dynamic> appData = jsonDecode(appScreenTimeString);
        _appScreenTime = appData.map((key, value) => MapEntry(key, value as int));
      }
    });
  }

  /// Save the current screen time data to SharedPreferences
  Future<void> _saveScreenTimeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('totalScreenTime', totalScreenTimeGlobal);

    // Save app-specific screen times as JSON
    await prefs.setString('appScreenTime', jsonEncode(_appScreenTime));
  }

  /// Fetch the usage stats for the apps
  Future<void> _fetchAppUsageStats() async {
    DateTime endDate = DateTime.now();
    DateTime startDate = DateTime(endDate.year, endDate.month, endDate.day, 0, 0, 0);

    // Open usage settings if permission is not granted
    bool? isPermissionGranted = await UsageStats.checkUsagePermission();
    if (isPermissionGranted == null || !isPermissionGranted) {
      UsageStats.grantUsagePermission();
    }

    // Fetch usage stats for today
    List<UsageInfo> usageStats = await UsageStats.queryUsageStats(startDate, endDate);

    // Process the fetched stats
    setState(() {
      _appScreenTime = {
        for (var stat in usageStats)
          _getAppName(stat.packageName) ?? 'Unknown App': _parseToInt(stat.totalTimeInForeground)
      };

      // Calculate total screen time
      totalScreenTimeGlobal = _appScreenTime.values.fold(0, (sum, time) => sum + time);

      // Save the updated screen time data
      _saveScreenTimeData();
    });
  }

  /// Helper function to parse totalTimeInForeground safely
  int _parseToInt(Object? value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  /// Get app name from package name
  String? _getAppName(String? packageName) {
    // Replace this with your actual logic to get app name from package name
    return packageName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Screen Time',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 200, // Adjust the width for the circular progress bar
                      height: 200, // Adjust the height for the circular progress bar
                      child: CircularProgressIndicator(
                        value: totalScreenTimeGlobal / maxScreenTime, // Calculate the progress
                        strokeWidth: 8, // Thicker progress line
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                    Text(
                      '${(totalScreenTimeGlobal / 1000 / 60 / 60).toStringAsFixed(2)} h',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _appScreenTime.length,
              itemBuilder: (context, index) {
                String appName = _appScreenTime.keys.elementAt(index); // Get app package name
                int screenTime = _appScreenTime[appName]!; // Get screen time in milliseconds

                return ListTile(
                  title: Text(appName),
                  subtitle: Text('Screen Time: ${(screenTime / 1000 / 60 / 60).toStringAsFixed(2)} hours'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
