import 'package:flutter/material.dart';
import 'app_selection_screen.dart';
import 'database_helper.dart';


class BlockedAppsScreen extends StatefulWidget {
  @override
  _BlockedAppsScreenState createState() => _BlockedAppsScreenState();
}

class _BlockedAppsScreenState extends State<BlockedAppsScreen> {
  List<String> _blockedApps = [];
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _fetchBlockedApps();
  }

  // Fetch blocked apps from the database
  void _fetchBlockedApps() async {
    var apps = await _databaseHelper.getBlockedApps();
    setState(() {
      _blockedApps = apps;
    });
  }

  // Handle deleting an app
  Future<void> _deleteApp(String packageName) async {
    final db = await _databaseHelper.database;
    await db.delete('blocked_apps', where: 'package_name = ?', whereArgs: [packageName]);
    _fetchBlockedApps(); // Refresh the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocked Apps'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigate to the App Selection screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppSelectionScreen()),
              );
            },
          ),
        ],
      ),
      body: _blockedApps.isEmpty
          ? Center(child: Text('No blocked apps yet.'))
          : ListView.builder(
        itemCount: _blockedApps.length,
        itemBuilder: (context, index) {
          final packageName = _blockedApps[index];
          return ListTile(
            title: Text(packageName),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _deleteApp(packageName); // Delete app
              },
            ),
          );
        },
      ),
    );
  }
}
