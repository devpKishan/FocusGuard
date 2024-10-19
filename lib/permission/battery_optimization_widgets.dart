import 'package:flutter/material.dart';
import 'package:optimize_battery/optimize_battery.dart';

class BatteryOptimizationCard extends StatefulWidget {
  const BatteryOptimizationCard({Key? key}) : super(key: key);

  @override
  _BatteryOptimizationCardState createState() => _BatteryOptimizationCardState();
}

class _BatteryOptimizationCardState extends State<BatteryOptimizationCard> {
  bool _isOptimized = true;

  @override
  void initState() {
    super.initState();
    _checkBatteryOptimization();
  }

  Future<void> _checkBatteryOptimization() async {
    bool isIgnoringOptimization = await OptimizeBattery.isIgnoringBatteryOptimizations();
    setState(() {
      _isOptimized = !isIgnoringOptimization;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isOptimized
        ? Card(
      color: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.battery_alert, color: Colors.white),
                const SizedBox(width: 8.0),
                const Text(
                  "Disable Battery Optimization",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'Disable Battery Optimization for the better app usage',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () async {
                await OptimizeBattery.openBatteryOptimizationSettings();
                _checkBatteryOptimization(); // Re-check after user interaction
              },
              child: Text('Disable Now'),
            ),
          ],
        ),
      ),
    )
        : Container(); // Return an empty container if optimization is disabled
  }
}
