import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RefreshScreen extends StatefulWidget {
  const RefreshScreen({super.key});

  @override
  State<RefreshScreen> createState() => _RefreshScreenState();
}

class _RefreshScreenState extends State<RefreshScreen> {

  int _page = 1;
  Map<String,dynamic> _pageObj = {'last':0};

  List<String> items = [];

  // List<String> items = ['item1', 'item2', 'item3', 'item4', 'item5'
  //                     , 'item6', 'item7', 'item8', 'item9', 'item10'
  //                     , 'item11', 'item12', 'item13', 'item14', 'item15'
  //                     , 'item16', 'item17', 'item18', 'item19', 'item20'
  //                     ];

  @override
  void initState() {
    super.initState();

    fetch();
  }

  Future fetch() async {
    print('fetch !');
    // http
    // 1. URL 인코딩
    // 2. GET 방식 요청
    // final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final url = Uri.parse('http://10.0.2.2:8080/board?page=${_page}');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      print('응답 성공쓰');
      setState(() {
        // items.addAll(['New Item',]); // 테스트를 위해 하드코딩 해둔 데이터
        
        var utf8Decoded = utf8.decode(response.bodyBytes);

        var result = json.decode(utf8Decoded);
        final page = result['page'];
        final List list = result['list'];

        // JSON 문자열 데이터를 List String으로 변환 해주는 작업
        // final List newData = json.decode(utf8Decoded);

        print('page : ');
        print(page);
        _pageObj = page;

        // 마지막 페이지라면 빈 페이지로 덮지 말고 더 이상 덮어쓰지 않도록 함
        if(list.isEmpty) return;

        items = list.map<String>((item) {
          final boardNo = item['boardNo'];
          final title = item['title'];
          return 'Item $boardNo - $title';
        }).toList();

        // 다음 페이지
        _page++;
      });
    }
    }

  // 아래는 나중에 참고해서 쓰세요~!
  Future _refresh() async {
    print('fetch !');
    // http 
    // 1. URL 인코딩
    // 2. GET 방식 요청
    // final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final url = Uri.parse('http://10.0.2.2:8080/board?page=${_page}');
    final response = await http.get(url);

    if( response.statusCode == 200 ) {
      setState(() {

        var utf8Decoded = utf8.decode(response.bodyBytes);
        
        // JSON 문자열 데이터를 List String으로 변환 해주는 작업
        final List newData = json.decode(utf8Decoded);

        List<String> newList = newData.map<String>((item) {
          // final id = item['id'];
          final boardNo = item['boardNo'];
          final title = item['title'];
          // return 'Item $id - $title';
          return 'Item $boardNo - $title';
        }).toList();

        items = newList;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pull Reload'),),
      body: 
        RefreshIndicator(
          onRefresh: fetch,
          child: ListView.builder(
            
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              if(index < items.length) {
                final item = items[index];
                return ListTile(title: Text(item),);
              }
              else {
                // 마지막 페이지까지 도달했을 때, 버튼을 눌러 첫 페이지로 갈 수 있도록 하기
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _page = 1;
                    });
                    fetch();
                  },
                child: const Text('처음으로 돌아가기')
                );
              }
            },
            itemCount: _page > _pageObj['last'] ? items.length+1 : items.length, 
          ),
        )
    );
  }
}