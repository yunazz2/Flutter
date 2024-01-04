import 'package:flutter/material.dart';
import 'package:navigator_app/screens/community/community_screen.dart';
import 'package:navigator_app/screens/home_screen.dart';
import 'package:navigator_app/screens/user/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // 선택된 화면(최초 화면인 Home으로 초기화 시켜놓자.)
  Widget _selectedScreen = HomeScreen();

  // 선택된 index(최초 화면인 Home을 0으로 설정해놓자.)
  int _selectedIndex = 0;

  // 인덱스별로 화면을 연결
  void _onTab(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0) _selectedScreen = HomeScreen();
      else if(_selectedIndex == 1) _selectedScreen = UserScreen();
      else if(_selectedIndex == 2) _selectedScreen = CommunityScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('메인 화면')),
      body: _selectedScreen,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'user'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'community'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTab,
        ),
    );
  }
}

