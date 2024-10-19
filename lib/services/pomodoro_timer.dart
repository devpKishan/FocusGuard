import 'package:flutter/material.dart';
import 'package:focus_gaurd/services/timer_service.dart';

class PomodoroCard extends StatefulWidget {
  @override
  _PomodoroCardState createState() => _PomodoroCardState();
}

class _PomodoroCardState extends State<PomodoroCard> {
  final PomodoroTimerService _timerService = PomodoroTimerService();

  @override
  void initState() {
    super.initState();
    if (_timerService.isPomodoroRunning) {
      _timerService.startPomodoroTimer(() {
        setState(() {});
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Same margin as the Blocker card
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pomodoro Timer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Focus on Your Work for 25 minutes',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            // Pomodoro Timer UI
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 150, // Adjust width as necessary
                  height: 150,
                  child: CircularProgressIndicator(
                    value: _timerService.isPomodoroRunning ? (_timerService.pomodoroTimeRemaining / 1500) : 0,
                    strokeWidth: 8.0,
                    backgroundColor: Colors.red[100],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
                Text(
                  _timerService.formattedPomodoroTime,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(_timerService.isPomodoroRunning ? Icons.pause : Icons.play_arrow),
                  iconSize: 30,
                  onPressed: () {
                    if (_timerService.isPomodoroRunning) {
                      _timerService.pauseTimer();
                    } else {
                      _timerService.startPomodoroTimer(() {
                        setState(() {});
                      });
                    }
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: Icon(Icons.replay),
                  iconSize: 30,
                  onPressed: () {
                    _timerService.resetTimer();
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Take a break for 5 minutes!',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            // Break Timer UI
            Container(
              width: 240, // Adjust width as necessary
              height: 8, // Thinner height for the break timer bar
              child: LinearProgressIndicator(
                value: _timerService.isBreakRunning ? (_timerService.breakTimeRemaining / 300) : 0,
                minHeight: 10, // Same thin height
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
            SizedBox(height: 8),
            Text(
              _timerService.formattedBreakTime,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Repeat It!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
    );
  }
}
