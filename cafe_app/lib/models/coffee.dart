class Coffee {

  // final을 붙인 이유는 한 번 얘를 생성하고 따로 변형하지 않기 위해서
  final String id;
  final String title;
  final int price;
  final String imageUrl;
  final String imageUrl2; // 커피는 ice/hot 있어서 그걸 구현하려고 url2도 만듦

  Coffee({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.imageUrl2,
  });
} // class Coffee


// 샘플 데이터
List<Coffee> coffeeList = [
  Coffee(id: "01",
  title: "아메리카노",
  price: 4000,
  imageUrl: "images/coffee01_hot.jpg",
  imageUrl2: "images/coffee01_ice.jpg"),

  Coffee(id: "02",
  title: "카페라떼",
  price: 3500,
  imageUrl: "images/coffee02_hot.jpg",
  imageUrl2: "images/coffee02_ice.jpg"),

  Coffee(id: "03",
  title: "리스트레토라떼",
  price: 4000,
  imageUrl: "images/coffee03_hot.jpg",
  imageUrl2: "images/coffee03_ice.jpg"),

  Coffee(id: "04",
  title: "아인슈페너",
  price: 5000,
  imageUrl: "images/coffee04_hot.jpg",
  imageUrl2: "images/coffee04_ice.jpg"),

  Coffee(id: "05",
  title: "바닐라라떼",
  price: 4000,
  imageUrl: "images/coffee05_hot.jpg",
  imageUrl2: "images/coffee05_ice.jpg"),

  Coffee(id: "06",
  title: "아샷추",
  price: 4000,
  imageUrl: "images/coffee06_hot.jpg",
  imageUrl2: "images/coffee06_ice.jpg"),
];