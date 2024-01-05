Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    return '결과 데이터';
  });
}

void main(List<String> args) {
  // then(data)
  // : Future가 완료된 후, 반환 값 data를 가져와서 특정 작업을 수행하는 메소드
  fetchData().then((data) {
    print(data);
    print('추가 작업');
  });

  print('요청 중');
}