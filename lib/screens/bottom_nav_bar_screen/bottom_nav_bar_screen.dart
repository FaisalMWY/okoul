import 'package:flutter/material.dart';
import 'package:quizu_app/screens/home_screen/home_screen.dart';
import 'package:quizu_app/screens/leaderboard_screen/leaderboard_screen.dart';
import 'package:quizu_app/screens/login_screen/login_screen.dart';
import 'package:quizu_app/screens/profile_screen/profile_screen.dart';

// The BottomNavigationBarScreen is stateful because we're using the bottomNavigationBar here.
// bottomNavigationBar requires a StatefulWidget.
class BottomNavigationBarScreen extends StatefulWidget {
  static const String routeName = 'tabs-screen';
  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreen();
}

class _BottomNavigationBarScreen extends State<BottomNavigationBarScreen> {
  List<Map<String, dynamic>>? _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': const HomeScreen(), 'title': 'QuizU'},
      {'page': LeaderboardScreen(), 'title': 'Leaderboard'},
      {'page': const ProfileScreen(), 'title': 'Profile'}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.red,
            ),
          ),
        ],
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          _pages?[_selectedPageIndex]['title'],
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white.withOpacity(0),
        shadowColor: Colors.white.withOpacity(0),
      ),
      body: _pages?[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
