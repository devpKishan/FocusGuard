import 'package:flutter/material.dart';
import 'package:focus_gaurd/screens/demo.dart';
import 'package:focus_gaurd/widgets/bottom_nav_bar.dart';
import 'styles/theme.dart';
import 'screens/bottom_nav_screen/home_screen.dart';
import 'screens/bottom_nav_screen/blocker_screen.dart';
import 'screens/bottom_nav_screen/track_screen.dart';
import 'screens/bottom_nav_screen/tips_screen.dart';
import 'screens/bottom_nav_screen/profile_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FocusGuard',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        // '/': (context) => AppUsageScreen(),
        '/': (context) => BottomNavScreen(),
        '/home': (context) => HomeScreen(),
        '/blocker': (context) => BlockerScreen(),
        '/track': (context) => TrackScreen(),
        '/tips': (context) => TipsScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    BlockerScreen(),
    TrackScreen(),
    TipsScreen(),
    ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
