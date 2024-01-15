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
      // 앱 바
      appBar: AppBar(
        title: const Text('로그인 페이지'),
        backgroundColor: Colors.cyan,
        titleTextStyle: GoogleFonts.daysOne(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      
      // 바디
      body: Consumer<UserProvider>( // 어떤 provider를 쓸 건지 지정
        builder: (context, user, child) =>  // user라고 써놨지만 user_provider를 가리키는 것임
          Container(
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    user.isLogin ?
                    Container(
                      child: Column(
                        children: [
                          // 프로필 사진
                          Image.network('${user.userInfo.kakaoAccount?.profile?.thumbnailImageUrl}'),
                          // 이름
                          Text('${user.userInfo.kakaoAccount?.profile?.nickname}'),
                        ],
                      ),
                    )
                    : Text(''),
                    ElevatedButton(
                      child: Text(!user.isLogin ? '카카오 로그인' : '로그아웃'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        elevation: 5  // 그림자 효과
                      ),
                      // 버튼을 눌렀을 때 동작할 내용
                      onPressed: () async {
                        // 카카오 로그인 요청 - provider로부터 사용자 정보를 가져와서 확인
                        var user = context.read<UserProvider>();
                        // 로그인 여부 확인
                        user.loginCheck();

                        // 비 로그인 시 => 로그인 요청
                        if(!await user.isLogin) {
                          // 사용자 조건 : 카카오톡 설치 여부에 따라
                          await isKakaoTalkInstalled() ? user.kakaoTalkLogin() : user.kakaoLogin();
                        }
                        else {
                          // 이미 로그인 된 상태라면 => 로그아웃 화면으로 이동
                          // 원래는 로그아웃 화면이 따로 없는데, 우리는 실습중이니까 화면으로 이동시켜보자
                          //pushReplacementNamed : 라우트 경로로 이동하면서 화면을 대체시키는 것
                          Navigator.pushReplacementNamed(context, "/logout");
                        }
                      },
                    ),
                  ],
                ),
              )
            ),
          )
        )
    );
  }
}