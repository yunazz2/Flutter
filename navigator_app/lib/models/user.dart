// User 객체를 만들어 데이터를 넘겨보자
class User {

  String? id;
  String? name;
  int? age;
  String? gender;

  // 생성자
  User({
    required this.id,
    required this.name,
    this.age,
    this.gender,
  });
}