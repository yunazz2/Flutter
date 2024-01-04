import 'package:flutter/material.dart';
import 'package:navigator_app/screens/community/community_screen.dart';
import 'package:navigator_app/screens/first_screen.dart';
import 'package:navigator_app/screens/home_screen.dart';
import 'package:navigator_app/screens/main_screen.dart';
import 'package:navigator_app/screens/user/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      // home: const FirstScreen(),
      initialRoute: '/main', // 처음 경로
      routes: {
        '/main' : (context) => MainScreen(),
        '/home' : (context) => HomeScreen(),
        '/user' : (context) => UserScreen(),
        '/community' : (context) => CommunityScreen(),
      },
    );
  }
}
