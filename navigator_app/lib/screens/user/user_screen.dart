
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // 데이터 가져오기
    // ModalRoute : 전달 받은 arguments를 사용할 수 있다.
    String? data = ModalRoute.of(context)?.settings.arguments as String?;
    // ?를 붙인 이유는 지금 home -> user로는 arguments를 넘기고 있는데,
    // user -> community로는 arguments를 넘기지 않아(null) 예외가 발생한다.
    // null인 경우 null 자체로 넘기기 위해 ?를 붙였다.

    return Scaffold(
      appBar: AppBar(title: Text('마이 페이지')),
      body: Center(
        child: Text(
                  '마이 페이지 : $data',
                  style: TextStyle(fontSize: 30.0),
              )
      ),
      bottomSheet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // pushNamed를 쓰면 마이페이지를 누를 때 마다 화면이 쌓인다.
                // Navigator.pushNamed(context, "/user");

                // pushReplacementNamed를 쓰면 마이페이지를 계속 눌러도 화면이 한 번만 쌓인다.
                Navigator.pushReplacementNamed(context, "/user");
              }, 
              child: Text('마이 페이지')
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/community");
              }, 
              child: Text('커뮤니티')
            ),
          ],
        ),
      ),
    );
  }
}