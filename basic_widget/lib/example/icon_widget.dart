import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // 아이콘 위젯 : Icon(아이콘, size)
              SizedBox(height: 50,),
              Text("아이콘 위젯쓰~", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
              Icon(
                Icons.face,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.person,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.login,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.logout,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.shopping_cart,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.menu,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.favorite,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.favorite_border,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.thumb_up,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.thumb_up_outlined,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.bookmark,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.bookmark_outline,
                size: 48,
                color: Colors.cyan,
              ),
              SizedBox(height: 20,),
              Icon(
                Icons.payment,
                size: 48,
                color: Colors.cyan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}