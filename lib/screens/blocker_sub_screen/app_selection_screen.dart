import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

import 'database_helper.dart';

class AppSelectionScreen extends StatefulWidget {
  @override
  _AppSelectionScreenState createState() => _AppSelectionScreenState();
}

class _AppSelectionScreenState extends State<AppSelectionScreen> {
  List<AppInfo> _installedApps = [];
  List<AppInfo> _selectedApps = [];
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _fetchInstalledApps();
  }

  // Fetch installed apps
  void _fetchInstalledApps() async {
    var apps = await InstalledApps.getInstalledApps(true, true); // Exclude system apps and include icons
    setState(() {
      _installedApps = apps;
    });
  }

  // Handle selection of app
  void _toggleAppSelection(AppInfo app) {
    setState(() {
      if (_selectedApps.contains(app)) {
        _selectedApps.remove(app);
      } else {
        _selectedApps.add(app);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Apps to Block')),
      body: _installedApps.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _installedApps.length,
        itemBuilder: (context, index) {
          final app = _installedApps[index];
          return ListTile(
            leading: app.icon != null ? Image.memory(app.icon!) : null,
            title: Text(app.name),
            subtitle: Text(app.packageName),
            trailing: Checkbox(
              value: _selectedApps.contains(app),
              onChanged: (bool? value) {
                _toggleAppSelection(app);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () async {
          for (var app in _selectedApps) {
            await _databaseHelper.insertBlockedApp(app.packageName);
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected apps saved!')),
          );
          Navigator.pop(context); // Navigate back to the previous screen if necessary
        },
      ),
    );
  }
}