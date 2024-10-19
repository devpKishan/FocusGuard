class AppModel {
  final int? id; // Nullable for auto-incremented ID in the database
  final String appName;
  final String packageName;
  int isBlocked; // 1 for blocked, 0 for unblocked

  AppModel({
    this.id,
    required this.appName,
    required this.packageName,
    this.isBlocked = 0, // Default to unblocked
  });

  // Convert a map into AppModel object
  factory AppModel.fromMap(Map<String, dynamic> map) {
    return AppModel(
      id: map['id'],
      appName: map['appName'],
      packageName: map['packageName'],
      isBlocked: map['isBlocked'], // Map the 'isBlocked' field
    );
  }

  // Convert AppModel object into a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'appName': appName,
      'packageName': packageName,
      'isBlocked': isBlocked, // Include 'isBlocked' in the map
    };
  }
}
