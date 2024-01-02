import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // 네트워크 이미지
              const SizedBox(height: 50,),
              const Text("네트워크 이미지쓰~", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),),
              Image.network(
                // 네트워크 이미지 구성 : url, width, height, fit
                'https://i.imgur.com/fzADqJo.png', width: 100.0, height: 100.0,
              ),

              // 로컬 이미지
              const SizedBox(height: 20,),
              const Text("로컬 이미지쓰~", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),),
              const Image(image: AssetImage('image/logo.png'), width: 100.0, height: 100.0,),
            
              // BoxFit.contain - 이미지가 화면에 딱 맞도록 크기를 조절
              const SizedBox(height: 20,),
              const Text("BoxFit.contain", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),),
              Container(
                width: 300,
                height: 200,
                color: Colors.cyan,
                child: const Image(
                  image: AssetImage('image/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),

              // BoxFit.cover - 이미지가 화면을 덮도록 크기를 조절
              const SizedBox(height: 20,),
              const Text("BoxFit.cover", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),),
              Container(
                width: 300,
                height: 200,
                color: Colors.cyan,
                child: const Image(
                  image: AssetImage('image/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),

              // BoxFit.fill - 이미지가 화면을 가득 채우도록 크기를 조절
              const SizedBox(height: 20,),
              const Text("BoxFit.fill", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),),
              Container(
                width: 300,
                height: 200,
                color: Colors.cyan,
                child: const Image(
                  image: AssetImage('image/logo.png'),
                  fit: BoxFit.fill,
                ),
              ),

              // BoxFit.fitWidth - 이미지가 화면 너비에 맞도록 크기를 조절
              const SizedBox(height: 20,),
              const Text("BoxFit.fitWidth", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),),
              Container(
                width: 300,
                height: 200,
                color: Colors.cyan,
                child: const Image(
                  image: AssetImage('image/logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),

              // BoxFit.fitHeight - 이미지가 화면 높이에 맞도록 크기를 조절
              const SizedBox(height: 20,),
              const Text("BoxFit.fitHeight", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),),
              Container(
                width: 300,
                height: 200,
                color: Colors.cyan,
                child: const Image(
                  image: AssetImage('image/logo.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),

              // BoxFit.scaleDown - 이미지가 원본 크기보다 작을 경우에만 크기를 조절하며, 원본 크기보다 작지 않으면 이미지를 그대로 표시
              const SizedBox(height: 20,),
              const Text("BoxFit.scaleDown", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),),
              Container(
                width: 300,
                height: 200,
                color: Colors.cyan,
                child: const Image(
                  image: AssetImage('image/logo.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
              
              // BoxFit.none - 원본 이미지 그대로 출력
              const SizedBox(height: 20,),
              const Text("BoxFit.none", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),),
              Container(
                width: 300,
                height: 200,
                color: Colors.cyan,
                child: const Image(
                  image: AssetImage('image/logo.png'),
                  fit: BoxFit.none,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}