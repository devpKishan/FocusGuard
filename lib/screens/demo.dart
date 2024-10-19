import 'package:flutter/material.dart';
import 'package:usage_stats_new/usage_stats.dart';


class AppUsageScreen extends StatefulWidget {
  @override
  _AppUsageScreenState createState() => _AppUsageScreenState();
}

class _AppUsageScreenState extends State<AppUsageScreen> {
  List<UsageInfo> _usageStats = [];

  @override
  void initState() {
    super.initState();
    _fetchUsageStats();
  }

  Future<void> _fetchUsageStats() async {
    DateTime endDate = DateTime.now();
    DateTime startDate = endDate.subtract(Duration(minutes: 1)); // Last 2 hours

    List<UsageInfo> usageStats = await UsageStats.queryUsageStats(startDate, endDate);

    // Filter out apps with no screen time
    usageStats = usageStats.where((info) => (info.totalTimeInForeground as int? ?? 0) != 0).toList();

    // Update the UI
    setState(() {
      _usageStats = usageStats;
    });
  }

  String _formatDuration(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Usage Stats - Last 2 Hours'),
      ),
      body: _usageStats.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _usageStats.length,
        itemBuilder: (context, index) {
          UsageInfo info = _usageStats[index];
          int totalTime = info.totalTimeInForeground as int? ?? 0;
          return ListTile(
            leading: Icon(Icons.android, size: 40), // Placeholder icon
            title: Text(info.packageName ?? 'Unknown App'), // Handle nullable packageName
            subtitle: Text(
              'Total Screen Time: ${_formatDuration(totalTime)}',
            ),
          );
        },
      ),
    );
  }
}