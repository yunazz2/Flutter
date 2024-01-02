import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // Text(표시할 텍스트, 스타일)
        child: Text(
          "텍스트 위젯쓰~",
          style: TextStyle(
            fontSize: 30.0,                 // double 타입으로 작성
            fontWeight: FontWeight.bold,
            color: Colors.cyan,
          ),
        ),
      ),
    );
  }
}
