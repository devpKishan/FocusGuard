// services/usage_service.dart
import 'package:flutter/services.dart';
import '../models/usage_model.dart';

class UsageService {
  static const platform = MethodChannel('com.focusguard/usage');

  Future<List<AppUsage>> fetchUsageData(DateTime startTime, DateTime endTime) async {
    try {
      final List<dynamic> usageData = await platform.invokeMethod('getUsageData', {
        'startTime': startTime.millisecondsSinceEpoch,
        'endTime': endTime.millisecondsSinceEpoch,
      });

      return usageData.map((data) => AppUsage(
        appName: data['appName'],
        screenTime: Duration(milliseconds: data['screenTime']),
        launchCount: data['launchCount'],
      )).toList();
    } catch (e) {
      throw Exception("Failed to fetch usage data: $e");
    }
  }
}
