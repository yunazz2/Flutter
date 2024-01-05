// Stream으로 반환할 때는 'async*'로 쓴다
Stream<int> countStream(int to) async* {
  for(int i = 1; i <= to; i++) {
    await Future.delayed(Duration(seconds: 1), () {
      print('요청 : $i');
    });
    yield i;
  }
}

Future<int> sumCount(Stream<int> stream) async {

  var sum = 0;
  print('합계');

  await for(final value in stream) {
    sum += value;
    print('전달된 값 : $value, sum : $sum');
    print('-----------------------------------');
  }

  return sum;
}

void main(List<String> args) async {

  var stream = countStream(10);
  var sum = await sumCount(stream);
 
  print(stream);
}