import 'package:flutter/material.dart';
import 'package:layout_widget/models/animal.dart';

class ListViewScreen extends StatefulWidget {
  final List<Animal> list;
  const ListViewScreen({super.key, required this.list});

  @override
  State createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('리스트 뷰')),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: Center(
          child: ListView.builder(  // 여기에 우리가 받아 온 애니멀 리스트를 사용해서 리스트 개수 만큼 반복시킨다. 
            itemBuilder: (context, position) {
              return GestureDetector( // 아이템 하나하나에 대한 이벤트를 사용하기 위해 GestureDetector로 묶어 주고
                child: Card(  // 카드를 만듦
                  child: Row( // row 방향으로(가로)
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 이미지, 텍스트, 아이콘을 spaceBetween 정렬
                    children: [
                      Image.asset(
                        // ''image/animal1.jpg'
                        widget.list[position].imagePath ?? 'image/product.jpg', // ?? : nullSafety 처리, widget. : 위에 4ln에 있는 widget을 뜻 함
                        width: 64,
                        height: 64,
                        fit: BoxFit.contain,
                      ),
                      Text(widget.list[position].animalName ?? '이름없음'), // ?? : nullSafety 처리
                      const Icon(
                        Icons.arrow_right,
                        size: 32.0,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  print('카드 클릭!!!');
                  AlertDialog dialog = AlertDialog(
                    content: Text(
                      '이 동물은 ${widget.list[position].kind} 입니다',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('확인'),
                      )
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => dialog,  // 이 dialog가 45ln의 dialog를 실행하는 것임
                  );
                },
                onLongPress: () { // 길게 눌렀을 때 액션
                  print('position ${position}');
                  setState(() {
                    widget.list.removeAt(position);
                  });
                },
              );
            },
            itemCount: widget.list.length,
          ),
        ),
      ),
    );
  }
}
