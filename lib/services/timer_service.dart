import 'dart:async';

class PomodoroTimerService {
  static final PomodoroTimerService _instance = PomodoroTimerService._internal();
  factory PomodoroTimerService() => _instance;

  int _pomodoroTimeRemaining = 1500; // 25 minutes in seconds
  int _breakTimeRemaining = 300; // 5 minutes in seconds
  Timer? _timer;
  bool _isPomodoroRunning = false;
  bool _isBreakRunning = false;

  PomodoroTimerService._internal();

  int get pomodoroTimeRemaining => _pomodoroTimeRemaining;
  int get breakTimeRemaining => _breakTimeRemaining;
  bool get isPomodoroRunning => _isPomodoroRunning;
  bool get isBreakRunning => _isBreakRunning;

  void startPomodoroTimer(Function updateCallback) {
    if (_timer != null) return; // Prevent multiple timers
    _isPomodoroRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_pomodoroTimeRemaining > 0) {
        _pomodoroTimeRemaining--;
        updateCallback();
      } else {
        stopTimer();
        startBreakTimer(updateCallback); // Start break timer
      }
    });
  }

  void startBreakTimer(Function updateCallback) {
    _isBreakRunning = true;
    _breakTimeRemaining = 300; // Reset break timer to 5 minutes
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_breakTimeRemaining > 0) {
        _breakTimeRemaining--;
        updateCallback();
      } else {
        stopTimer(); // Stop the timer when the break is over
        _isBreakRunning = false; // Set break running status to false
      }
    });
  }

  void pauseTimer() {
    stopTimer();
  }

  void resetTimer() {
    stopTimer();
    _pomodoroTimeRemaining = 1500; // Reset to 25 minutes
    _breakTimeRemaining = 300; // Reset to 5 minutes
    _isPomodoroRunning = false;
    _isBreakRunning = false;
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    _isPomodoroRunning = false;
    _isBreakRunning = false;
  }

  String get formattedPomodoroTime {
    final minutes = (_pomodoroTimeRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_pomodoroTimeRemaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String get formattedBreakTime {
    final minutes = (_breakTimeRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_breakTimeRemaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}