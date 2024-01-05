// 비동기를 학습해보자.

// 5초 지연
Future<void> fetchOrder1() async {
  Future.delayed(const Duration(seconds: 5), () {
    print('5초 후 출력 - 먼저 호출했는데 나중에 나옴');
  });
}


// 3초 지연
Future<void> fetchOrder2() async {
  Future.delayed(const Duration(seconds: 3), () {
    print('3초 후 출력 - 나중에 호출했는데 먼저 나옴');
  });
}

void main(List<String> args) {
  fetchOrder1();
  fetchOrder2();
  print('요청 중~');
}