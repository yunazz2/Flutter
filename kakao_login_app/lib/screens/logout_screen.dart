import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_login_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱 바
      appBar: AppBar(
        title: const Text('로그아웃 페이지'),
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
                        // 카카오 로그아웃 요청 - context => provider 가져와서 사용
                        var user = context.read<UserProvider>();
                        if(user.isLogin) {
                          user.kakaoLogout();
                          print('카카오 로그아웃 완료~!');
                        }
                        Navigator.pushReplacementNamed(context, "/login");
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