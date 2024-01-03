import 'package:flutter/material.dart';
import 'package:input_widget/screens/join_screen.dart';
import 'package:input_widget/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  // late : 늦은 초기화
  late TabController controller;

  @override
  void initState() {
    super.initState();
    // with SingleTickerProviderStateMixin을 지정해서 this 사용
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('홈 화면'),),
      body: TabBarView(
        children: [
          LoginScreen(),
          JoinScreen(),
        ],
        controller: controller,)
      ,
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(child: Text('로그인'),),
          Tab(child: Text('회원가입'),),
        ],
        controller: controller,
      ),
    );
  }
}