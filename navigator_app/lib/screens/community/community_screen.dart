
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    // 데이터 가져오기
    // ModalRoute : 전달 받은 arguments를 사용할 수 있다.
    String? data = ModalRoute.of(context)?.settings.arguments as String?;
    // ?를 붙인 이유는 지금 home -> community로는 arguments를 넘기고 있는데,
    // community -> user로는 arguments를 넘기지 않아(null) 예외가 발생한다.
    // null인 경우 null 자체로 넘기기 위해 ?를 붙였다.

    return Scaffold(
      appBar: AppBar(title: Text('커뮤니티')),
      body: Center(
        child: Text(
                  '커뮤니티 : $data',
                  style: TextStyle(fontSize: 30.0),
              )
      ),
      bottomSheet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, "/user");
                Navigator.pushReplacementNamed(context, "/user");
              }, 
              child: Text('마이 페이지')
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, "/community");
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