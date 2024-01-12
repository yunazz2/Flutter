import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_login_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인 페이지'),
        backgroundColor: Colors.cyan,
        titleTextStyle: GoogleFonts.daysOne(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Consumer<UserProvider>(
              builder: (context, user, child) =>
              Text('카카오 로그인'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              elevation: 5
            ),
            onPressed: () async {
              // 카카오 로그인 요청
              // provider로부터 사용자 정보를 가져와서 확인
              var user = context.read<UserProvider>();

              // ✔ 로그인 여부 확인 
              user.loginCheck();

              // 비 로그인 시 => 로그인 요청
              if(!await user.isLogin) {
                // 사용자 조건 : 카카오톡 설치 여부에 따라
                await isKakaoTalkInstalled() ? user.kakaoTalkLogin() : user.kakaoLogin();
              }
              else {
                // 이미 로그인된 상태라면 => 로그아웃 화면으로 이동
                // pushReplacementNamed : 라우트 경로로 이동하면서 화면을 대체 시키는 것
                Navigator.pushReplacementNamed(context, "/logout");
              }

            },
            ),
        ),
      ),
    );
  }
}