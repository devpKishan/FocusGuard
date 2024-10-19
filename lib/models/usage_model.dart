// models/usage_model.dart
class AppUsage {
  final String appName;
  final Duration screenTime;
  final int launchCount;

  AppUsage({required this.appName, required this.screenTime, required this.launchCount});
}