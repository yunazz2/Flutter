import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // debug 라벨 제거
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // App Bar
      appBar: AppBar(
        title: Text('유나쓰 App'),
      ),

      // Body
      body: Center(
        child: 
          Column(
            children: [
              Image.asset(
                "image/1.jpg", // 이미지
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              const Text('스위스',
                    style: TextStyle(
                      fontFamily: 'IBMPlexSansKR',
                      fontSize: 50,
                      color: Colors.cyan,
                    ),
                  ),
          ],)
      ),

      // FloatingActionsButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('마이 페이지 메뉴 클릭!');
        },
        child: const Icon(Icons.person),
      ),

      // Drawer(사이드 바)
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 163, 192, 1),
              ),
              child: Text('메뉴 목록'),
            ),
            ListTile(
              title: Text('메뉴1'),
              onTap: () {print('메뉴1 클릭!');},
            ),
            ListTile(
              title: Text('메뉴2'),
              onTap: () {print('메뉴2 클릭!');},
            ),
          ],
        ),
      ),

      // BottomNavigationBar(사실 많이 쓰이지는 않음)
      bottomNavigationBar: BottomNavigationBar(
        // 아이템을 2개 이상 만들어 주어야 함
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'user',
            ),
        ],
      ),

      // BottomSheet
      bottomSheet: Container(
        height: 20,
        color: Colors.grey,
        child: Center(
          child: Text('Bottom'),
        ),
      ),
    );
  }
}
