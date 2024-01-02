import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }

}

// "_클래스" dart 파일 내부에서만 사용하는 클래스
class _MyApp extends State<MyApp> {

  var switchValue = false;

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,    // 디버그 리본 숨기기
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.light(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: 메인(홈) 화면을 지정하는 속성
      home: Scaffold(
              body : Center(
                        child: Switch(
                          value: switchValue,  // false
                          onChanged: (value){
                                      print('스위치 여부 : ${value}');
                                      // 1229 5교시(15시) 강의 참고
                                      // setState를 호출 하면서 실제 UI에 있는 토글 버튼 자체의 true/false 값을 가지고 온다.
                                      // 그래서 아래 setState에서 value를 렌더링 해주기 때문에 따로 switchValue = !switchValue 를 해줄 필요가 없다. 
                                      setState(() {
                                        switchValue = value;
                                      });

                                   }
                          )

                    )
            )
      
      
      
    );
  }

}

