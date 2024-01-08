import 'package:cafe_app/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenuDetailScreen extends StatefulWidget {
  final Coffee item;
  const MenuDetailScreen({super.key, required this.item});

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {

  // state
  String? type = 'hot'; // ice/hot
  
  @override
  Widget build(BuildContext context) {

    // coffee 객체를 만들어서 widget.item 길게 쓰는걸 줄이자
    Coffee coffee = widget.item;

    return Scaffold(
      appBar: AppBar(
        title: Text('커피'),
        centerTitle: true,
        backgroundColor: Colors.black12,
        leading: BackButton(
          color: Colors.black,
        ),
        actions: [
          GestureDetector(onTap: () {
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Icons.home, color: Colors.black,),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(children: [
              // ClipRRect : 둥근 사각형 위젯으로, child를 한 개만 가진다.
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  // HOT / ICE
                  // type이 hot이면 imageUrl이 나오고, 아니면 imageUrl2가 나오도록
                  type == 'hot'? "${coffee.imageUrl}" : "${coffee.imageUrl2}",
                  width: 250.0,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
              ),
              // 커피 이름
              Text("${coffee.title}", style: TextStyle(fontSize: 20.0),),

              SizedBox(height: 10.0,),
              
              // 가격
              Text("${NumberFormat.decimalPattern().format(coffee.price) }원", style: TextStyle(fontSize: 16.0),),
            ],),
            ),
            Divider(),  // hr 태그같은 줄

            // 옵션 선택 영역
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('온도'),
                  ),
                  Row(
                    // hot/ice 버튼 가운데 정렬
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    ChoiceChip(
                      label: Text('hot'),
                      // 언제 선택되는지
                      selected: type == 'hot',
                      // 선택됐을 때
                      onSelected: (selected) {
                        setState(() {
                          type = 'hot';
                        });
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      side: BorderSide(
                        color: type == 'hot' ? Colors.black : Colors.grey
                      ),
                      ),
                    ChoiceChip(
                      label: Text('ice'),
                      // 언제 선택되는지
                      selected: type == 'ice',
                      // 선택됐을 때
                      onSelected: (selected) {
                        setState(() {
                          type = 'ice';
                        });
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      side: BorderSide(
                        color: type == 'ice' ? Colors.black : Colors.grey
                      ),
                      ),
                  ],)
              ],
            )
        ],
      ),
      // -------------------------------------- body --------------------------------------
      bottomNavigationBar: BottomAppBar(
        color: Colors.cyan,
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
            // 최대 너비를 사용하는 위젯
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("${NumberFormat.decimalPattern().format(coffee.price)}", style: TextStyle(color: Colors.white, fontSize: 18.0),),
                ),
              ),
              TextButton(
                child: Text('주문하기', style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
                // 주문하기 버튼 클릭 시 '주문이 완료되었습니다.' 출력
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("${coffee.title}"),
                        content: Text("${coffee.price}원 입니다."),
                        actions: [
                          // 취소 / 확인 버튼
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: Text('취소'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: Text('확인'),
                          ),
                        ],
                      );
                    }
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}