import 'package:cafe_app/screens/menu/menu_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cafe_app/models/coffee.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  
  @override
  Widget build(BuildContext context) {
    // 탭 바 메뉴에 들어갈 아이콘
    List<String> menuItems = [
      "신메뉴",
      "커피",
      "디카페인",
      "Tea"
    ];

    // 탭 바1 - 신메뉴 이미지 슬라이드 아이템
    List<String> bannerItemImgUrl = [
      "images/banner01.jpg",
      "images/banner02.jpg"
    ];

    // 탭 바2 - 커피 메뉴 아이템
    List<String> coffeeMenuImgUrl = [
      'images/coffee01_hot.jpg',
      'images/coffee02_hot.jpg',
      'images/coffee03_hot.jpg',
      'images/coffee04_hot.jpg',
      'images/coffee05_hot.jpg',
      'images/coffee06_hot.jpg',
      'images/coffee01_ice.jpg',
      'images/coffee02_ice.jpg',
      'images/coffee03_ice.jpg',
      'images/coffee04_ice.jpg',
      'images/coffee05_ice.jpg',
      'images/coffee06_ice.jpg',
    ];

    // 탭 바에 대한 컨트롤러
    return DefaultTabController(
      initialIndex: 0,            // 탭 바 초기 인덱스
      length: menuItems.length,   // 탭 바 아이템 개수
      child: Scaffold(
        appBar: AppBar(
          title: const Text('메뉴', style: TextStyle(color: Colors.black),),
          centerTitle: true,  // appbar title을 가운데 정렬
          backgroundColor: Colors.white,
          leading: const Icon(Icons.home, color: Colors.grey,),  // appbar영역의 앞에 아이콘을 넣는 속성
          // 실제 탭 바가 들어가는 부분
          bottom: TabBar(
            tabs: List.generate(menuItems.length, (index) => Tab(text: menuItems[index],)),
            unselectedLabelColor: Colors.grey,  // 탭 바에서 선택되지 않은 메뉴의 라벨 색 설정
            labelColor: Colors.black,           // 선택된 라벨 색상
            indicatorColor: Colors.cyan,        // 선택된 탭의 강조 색상
            indicatorSize: TabBarIndicatorSize.tab,
            // isScrollable: true,                   // 탭 바의 메뉴 개수가 많아지면 스크롤 가능하도록 지정 - 메뉴가 많아지면 쓰자
            ),
          ),
          body: TabBarView(children: [
            // 탭 바1 : 신메뉴
            ListView(
              children: [
                // 배너 - 스크롤이 가능하게끔 ListView 사용
                CarouselSlider.builder(
                  itemCount: bannerItemImgUrl.length,
                  itemBuilder: (context, index, realIndex) {
                    return Stack(
                      children: [
                        Image.asset(
                          "${bannerItemImgUrl[index]}",
                          fit: BoxFit.cover,
                          // 이미지 가로 사이즈를 앱 가로 사이즈로 지정
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 1.0         // 슬라이드당 이미지 개수
                  ),
                ),
                // 신메뉴 탭 아래 그리드 뷰 - 커피 메뉴
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('조은 카페의 신메뉴', style: TextStyle(color: Colors.black),),
                          GridView.builder(
                            // ✅ physics : 위젯 스크롤 동작을 지정하는 속성
                            // ScrollPhysics          : 기본 스크롤 동작 위젯
                            // BouncingScrollPhysics  : 바운스 효과 스크롤 동작 위젯
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,       // 큰 이미지(아이템)일 경우 축소해서 적용
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3     // 그리드 컬럼의 개수
                              ),
                              itemCount: coffeeMenuImgUrl.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("${coffeeMenuImgUrl[index]}",
                                  fit: BoxFit.cover,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                  )
              ],
            ),

            // Center(child: Text('신메뉴쓰'),),
            // const Center(child: Text('커피쓰')),
            // 탭 바2 - 커피 메뉴
            ListView(
              children:
                List.generate(
                  // 아이템 개수
                  coffeeList.length,
                  (index) => Container(
                    height: 150.0,
                    child: GestureDetector(
                      // 클릭 시 상세화면으로 이동
                      onTap: () {
                        // route를 지정했으면 pushNamed를 쓰면 되지만, 안했으니까 push를 사용해보자
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>
                          MenuDetailScreen(item: coffeeList[index])),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          // [이미지, 내용 영역]
                          children: [
                            // 이미지
                            Image.asset("${coffeeList[index].imageUrl}",
                            width: 100.0,
                            fit: BoxFit.cover,
                            ),
                            // 내용
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 메뉴 이름
                                  Text("${coffeeList[index].title}", style: TextStyle(color: Colors.black, fontSize: 22.0)),
                                  // 가격
                                  Text(
                                      "${NumberFormat
                                          .decimalPattern()
                                          .format(coffeeList[index].price) }원",
                                      // "${coffeeList[index].price} 원",
                                      style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              ),
                          ],
                        ),
                        ),
                    ),
                  ),
                ),
            ),
            const Center(child: Text('디카페인쓰')),
            const Center(child: Text('Tea쓰~')),
          ],
        ),
      )
    );
  }
}