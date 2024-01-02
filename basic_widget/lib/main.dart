import 'package:basic_widget/example/icon_widget.dart';
import 'package:basic_widget/example/image_widget.dart';
import 'package:basic_widget/example/text_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Flutter Stateless Widget 자동 완성
// s : ctrl + space
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "기본 위젯",
      home: 
            // TextWidget()
            // ImageWidget()
            IconWidget()
    );
  }
}